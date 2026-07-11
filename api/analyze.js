const {
  analyzeWriting,
  parseJsonPayload,
  validateInput
} = require("./_shared");

module.exports = async function handler(request, response) {
  response.setHeader("Cache-Control", "no-store");

  if (request.method !== "POST") {
    response.status(405).json({ error: "Method not allowed." });
    return;
  }

  try {
    const body = parseJsonPayload(request.body);
    const input = validateInput(body);
    const analysis = await analyzeWriting(input);
    response.status(200).json(analysis);
  } catch (error) {
    response.status(error.statusCode || 502).json({
      error: error.message || "分析请求失败，请稍后重试。"
    });
  }
};
