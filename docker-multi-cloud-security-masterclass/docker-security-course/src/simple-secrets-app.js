// Simple Secrets Demo App
const http = require('http');
const fs = require('fs');

// Load secrets safely from files
function loadSecrets() {
    try {
        const dbPassword = fs.readFileSync('/run/secrets/db_password', 'utf8').trim();
        const apiKey = fs.readFileSync('/run/secrets/api_key', 'utf8').trim();
        
        console.log('✅ Secrets loaded successfully from files');
        console.log('🔒 Security: Secrets are NOT in environment variables');
        
        return { dbPassword, apiKey };
    } catch (error) {
        console.error('❌ Error loading secrets:', error.message);
        process.exit(1);
    }
}

const secrets = loadSecrets();

// Create HTTP server
const server = http.createServer((req, res) => {
    if (req.url === '/health') {
        res.writeHead(200);
        res.end('OK');
        return;
    }
    
    if (req.url === '/secrets-info') {
        // Return masked secrets info (never the actual values!)
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({
            status: 'secure',
            db_password: '***' + secrets.dbPassword.slice(-3),
            api_key: '***' + secrets.apiKey.slice(-3),
            message: 'Secrets are properly secured in files'
        }));
        return;
    }
    
    res.writeHead(200);
    res.end(`
        <h1>🔒 Docker Secrets Security Demo</h1>
        <p>This application demonstrates secure secrets management.</p>
        <ul>
            <li>Secrets loaded from secure files</li>
            <li>No secrets in environment variables</li>
            <li>Proper file permissions (600)</li>
            <li>Secrets masked in outputs</li>
        </ul>
        <p><a href="/secrets-info">View masked secrets info</a></p>
        <p><a href="/health">Health check</a></p>
    `);
});

server.listen(3000, '0.0.0.0', () => {
    console.log('🚀 Secure secrets demo running on port 3000');
    console.log('📊 Endpoints:');
    console.log('   GET / - Application info');
    console.log('   GET /secrets-info - Masked secrets info');
    console.log('   GET /health - Health check');
});
