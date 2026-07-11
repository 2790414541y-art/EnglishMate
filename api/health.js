const { MODEL } = require("./_shared");

module.exports = function handler(request, response) {
  response.setHeader("Cache-Control", "no-store");
  response.status(200).json({
    ready: Boolean(process.env.DEEPSEEK_API_KEY),
    model: MODEL,
    usageLevels: ["Quick", "Standard", "Deep"]
  });
};
