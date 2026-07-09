# EnglishMate

**AI-powered English correction and expression assistant**

EnglishMate is a single-page web demo for English learners.  
这是一个面向英语学习者的 AI 英语纠错与表达优化网页 Demo，帮助用户在写英文句子时看懂哪里错、为什么错，以及如何表达得更自然。

## Live Demo

[https://2790414541y-art.github.io/EnglishMate/](https://2790414541y-art.github.io/EnglishMate/)

## Project Overview

EnglishMate focuses on a common learning problem: many tools can provide a corrected sentence, but they do not clearly explain the reason behind the mistake.

本项目通过一个轻量级 MVP Prototype 展示完整的 AI 产品体验链路：

- English input
- Grammar correction
- Chinese explanation
- Expression optimization
- Example generation
- Feedback tags

## User Pain Point

普通翻译工具通常只给出修改结果，不解释错误原因。  
For English learners, this makes it hard to understand the pattern behind the mistake and reuse the correction in future writing.

## Core Features

- **English Input**: 用户输入英文句子。
- **Grammar Correction**: 展示句子的语法纠错结果。
- **Chinese Explanation**: 用中文解释错误原因，降低理解门槛。
- **Expression Optimization**: 提供 Basic、Natural、Spoken 等不同表达版本。
- **Example Generation**: 生成可迁移学习的例句。
- **Feedback Tags**: 用户可以点击反馈标签，模拟产品反馈机制。
- **Essay Analysis**: 支持从单句扩展到作文诊断、评分和问题拆解。
- **Learning Profile**: 使用浏览器本地历史记录生成学习画像和高频错误统计。

## Tech Stack

- HTML
- CSS
- JavaScript
- Node.js local server
- DeepSeek API integration for local real AI analysis

No React, Vue, database, or complex build tools are used.

## Project Status

**MVP Prototype / Portfolio Demo**

The GitHub Pages site is a static portfolio demo. It shows the product flow, interaction design, report structure, and local learning profile.

For real sentence and essay analysis, run the local Node.js server and enable DeepSeek with your own API key. API keys are kept only in the local server memory and are not committed to the repository.

当前版本重点展示 AI 英语写作教练的 MVP 链路：输入、分析、纠错、解释、优化、例句、反馈和学习画像。

## Local Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\start-local.ps1 -Port 3001
```

Then open:

[http://127.0.0.1:3001/](http://127.0.0.1:3001/)

Paste your own DeepSeek API key into the local setup panel to enable real AI analysis.

## Future Iteration

- Deploy a secure backend proxy for the public website
- Add saved incorrect sentences / 错句收藏
- Add more writing scenarios, such as school, work, travel, and exams
- Add learning records and progress tracking
- Add vocabulary book and sentence book for reusable learning materials

## Project Value

This project demonstrates:

- 英语学习场景理解
- AI 产品功能链路设计
- 问题反馈机制设计
- 单页网页原型搭建能力

## Demo Scope

EnglishMate is designed as a portfolio-friendly product demo for AI product / product manager internship applications.  
It keeps the implementation simple while showing a clear user problem, MVP boundary, and future product direction.
