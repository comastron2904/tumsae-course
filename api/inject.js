const fs = require('fs');
const path = require('path');

module.exports = (req, res) => {
  const supabaseUrl = process.env.SUPABASE_URL || '';
  const supabaseKey = process.env.SUPABASE_ANON_KEY || '';

  const htmlPath = path.join(__dirname, '../public/index.html');
  let html = fs.readFileSync(htmlPath, 'utf-8');

  // 환경변수를 window 객체에 주입
  const injection = `<script>
    window.ENV_SUPABASE_URL = ${JSON.stringify(supabaseUrl)};
    window.ENV_SUPABASE_ANON_KEY = ${JSON.stringify(supabaseKey)};
  </script>`;

  html = html.replace('</head>', injection + '\n</head>');

  res.setHeader('Content-Type', 'text/html; charset=utf-8');
  res.setHeader('Cache-Control', 'no-store');
  res.send(html);
};
