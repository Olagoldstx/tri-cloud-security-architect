// 🛡️ WORKING SECRETS DEMO APPLICATION
const http = require('http');
const fs = require('fs');

console.log('🔒 Starting Working Secrets Demo...');

// Load secrets
function loadSecrets() {
    try {
        console.log('📁 Loading secrets from /run/secrets/...');
        const files = fs.readdirSync('/run/secrets');
        console.log('Found files:', files);
        
        const dbPassword = fs.readFileSync('/run/secrets/db_password.txt', 'utf8').trim();
        const apiKey = fs.readFileSync('/run/secrets/api_key.txt', 'utf8').trim();
        
        console.log('✅ Secrets loaded successfully!');
        console.log('🔐 Security Status: ACTIVE');
        
        return { dbPassword, apiKey };
    } catch (error) {
        console.error('❌ Failed to load secrets:', error.message);
        console.log('Current user info:');
        try {
            const execSync = require('child_process').execSync;
            console.log('User:', execSync('whoami').toString().trim());
            console.log('UID:', execSync('id -u').toString().trim());
            console.log('GID:', execSync('id -g').toString().trim());
        } catch (e) {
            console.log('Cannot get user info:', e.message);
        }
        process.exit(1);
    }
}

const secrets = loadSecrets();

// Create server
const server = http.createServer((req, res) => {
    // Security headers
    res.setHeader('X-Content-Type-Options', 'nosniff');
    res.setHeader('X-Frame-Options', 'DENY');
    
    if (req.url === '/health') {
        res.writeHead(200);
        res.end('OK');
        return;
    }
    
    if (req.url === '/secrets-info') {
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({
            status: 'secure',
            message: 'Docker secrets working correctly!',
            masked_secrets: {
                db_password: '***' + secrets.dbPassword.slice(-3),
                api_key: '***' + secrets.apiKey.slice(-3)
            },
            security: 'high'
        }, null, 2));
        return;
    }
    
    if (req.url === '/') {
        res.writeHead(200, { 'Content-Type': 'text/html' });
        res.end(`
            <h1>🔒 Docker Secrets Demo - WORKING!</h1>
            <p>Secrets are properly secured and loaded from files.</p>
            <ul>
                <li><a href="/secrets-info">View masked secrets</a></li>
                <li><a href="/health">Health check</a></li>
            </ul>
        `);
        return;
    }
    
    res.writeHead(404);
    res.end('Not found');
});

server.listen(3000, '0.0.0.0', () => {
    console.log('🚀 Server running on port 3000');
    console.log('📊 Endpoints:');
    console.log('   GET / - Main page');
    console.log('   GET /secrets-info - Masked secrets info');
    console.log('   GET /health - Health check');
});
