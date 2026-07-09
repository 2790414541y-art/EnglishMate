param(
  [int]$Port = 3000
)

$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$nodePath = (Get-Command node -ErrorAction Stop).Source

$internetSettings = Get-ItemProperty `
  -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" `
  -ErrorAction SilentlyContinue

if ($internetSettings.ProxyEnable -eq 1 -and -not [string]::IsNullOrWhiteSpace($internetSettings.ProxyServer)) {
  $proxySetting = [string]$internetSettings.ProxyServer
  if ($proxySetting -match "(?:^|;)https=([^;]+)") {
    $proxyAddress = $Matches[1]
  }
  elseif ($proxySetting -match "(?:^|;)http=([^;]+)") {
    $proxyAddress = $Matches[1]
  }
  else {
    $proxyAddress = $proxySetting
  }

  if ($proxyAddress -notmatch "^https?://") {
    $proxyAddress = "http://$proxyAddress"
  }

  $env:HTTPS_PROXY = $proxyAddress
  $env:HTTP_PROXY = $proxyAddress
  $env:NODE_USE_ENV_PROXY = "1"
  Write-Host "Using Windows proxy for DeepSeek API connectivity."
}

function Test-LocalPortAvailable([int]$CandidatePort) {
  $listener = [Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback, $CandidatePort)
  try {
    $listener.Start()
    return $true
  }
  catch {
    return $false
  }
  finally {
    $listener.Stop()
  }
}

$lastPort = $Port + 20
while ($Port -le $lastPort -and -not (Test-LocalPortAvailable $Port)) {
  $Port += 1
}

if ($Port -gt $lastPort) {
  throw "No available local port was found."
}

$env:PORT = $Port
$server = Start-Process `
  -FilePath $nodePath `
  -ArgumentList "server.js" `
  -WorkingDirectory $projectRoot `
  -NoNewWindow `
  -PassThru

try {
  Start-Sleep -Seconds 1
  Start-Process "http://127.0.0.1:$Port"
  Write-Host "EnglishMate is running. Close this window or press Ctrl+C to stop it."
  Wait-Process -Id $server.Id
}
finally {
  if (-not $server.HasExited) {
    Stop-Process -Id $server.Id
  }
  Remove-Item Env:DEEPSEEK_API_KEY -ErrorAction SilentlyContinue
  Remove-Item Env:NODE_USE_ENV_PROXY -ErrorAction SilentlyContinue
}
