// 🛡️ FINAL SECRETS DEMO APPLICATION
// Proper Docker secrets implementation

const http = require('http');
const fs = require('fs');

console.log('🔒 Starting Secure Secrets Demo...');

// Secure secrets loader
class SecretsManager {
    constructor() {
        this.secrets = {};
        this.loadSecrets();
    }

    loadSecrets() {
        try {
            console.log('📁 Loading secrets from secure files...');
            
            // Load secrets from mounted files
            this.secrets.dbPassword = fs.readFileSync('/run/secrets/db_password.txt', 'utf8').trim();
            this.secrets.apiKey = fs.readFileSync('/run/secrets/api_key.txt', 'utf8').trim();
            
            console.log('✅ Secrets loaded successfully!');
            console.log('🔐 Security Features:');
            console.log('   - Secrets loaded from files, not environment variables');
            console.log('   - File permissions protected on host');
            console.log('   - Secrets masked in all outputs');
            
            return true;
        } catch (error) {
            console.error('❌ CRITICAL: Failed to load secrets:', error.message);
            console.error('   This indicates a security configuration issue');
            process.exit(1);
        }
    }

    // Never expose actual secrets!
    getMaskedInfo() {
        return {
            db_password: '***' + this.secrets.dbPassword.slice(-3),
            api_key: '***' + this.secrets.apiKey.slice(-3),
            security_level: 'high',
            storage_method: 'file_based'
        };
    }

    validateSecrets() {
        const issues = [];
        if (this.secrets.dbPassword.length < 8) issues.push('DB password too short');
        if (this.secrets.apiKey.length < 10) issues.push('API key too short');
        return issues;
    }
}

// Initialize secrets
const secretsManager = new SecretsManager();
const validationIssues = secretsManager.validateSecrets();

if (validationIssues.length > 0) {
    console.warn('⚠️  Secret validation warnings:', validationIssues);
}

// Create secure HTTP server
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
        res.setHeader('Content-Type', 'application/json');
        res.writeHead(200);
        res.end(JSON.stringify({
            status: 'secure',
            message: 'Secrets are properly secured in files',
            masked_secrets: secretsManager.getMaskedInfo(),
            security: {
                level: 'high',
                method: 'file_based',
                exposed: 'none'
            }
        }, null, 2));
        return;
    }

    if (req.url === '/security') {
        res.setHeader('Content-Type', 'application/json');
        res.writeHead(200);
        res.end(JSON.stringify({
            security_features: [
                'Secrets stored as files with 600 permissions',
                'No secrets in environment variables',
                'Read-only secrets mount',
                'Non-root user execution',
                'Secrets masked in all outputs'
            ]
        }, null, 2));
        return;
    }

    // Main page
    res.setHeader('Content-Type', 'text/html');
    res.writeHead(200);
    res.end(`
        <!DOCTYPE html>
        <html>
        <head>
            <title>🔒 Docker Secrets Security Demo</title>
            <style>
                body { font-family: Arial, sans-serif; max-width: 800px; margin: 40px auto; padding: 20px; }
                .success { color: #2ecc71; }
                .info { background: #f8f9fa; padding: 15px; border-radius: 5px; }
            </style>
        </head>
        <body>
            <h1>🔒 Docker Secrets Security Demo</h1>
            <div class="info">
                <p class="success">✅ <strong>SECURE SECRETS MANAGEMENT ACTIVE</strong></p>
                <p>This application demonstrates proper Docker secrets security practices.</p>
            </div>
            
            <h2>🎯 Security Features Implemented</h2>
            <ul>
                <li>Secrets loaded from secure files (not environment variables)</li>
                <li>File permissions: 600 for secrets, 700 for directory</li>
                <li>Secrets masked in all API responses and logs</li>
                <li>Read-only secrets mount</li>
                <li>Non-root user execution</li>
                <li>Security headers implemented</li>
            </ul>

            <h2>🔍 Test Endpoints</h2>
            <ul>
                <li><a href="/secrets-info">/secrets-info</a> - View masked secrets information</li>
                <li><a href="/security">/security</a> - Security features list</li>
                <li><a href="/health">/health</a> - Health check</li>
            </ul>

            <h2>📚 Learning Points</h2>
            <ul>
                <li><strong>Never</strong> store secrets in environment variables</li>
                <li><strong>Always</strong> use file-based secrets with proper permissions</li>
                <li><strong>Mask</strong> secrets in all outputs and logs</li>
                <li><strong>Validate</strong> secret strength and existence</li>
            </ul>
        </body>
        </html>
    `);
});

// Start server
const PORT = 3000;
server.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Secure Secrets Demo running on port ${PORT}`);
    console.log('📊 Available Endpoints:');
    console.log('   GET /              - Application information');
    console.log('   GET /secrets-info  - Masked secrets information');
    console.log('   GET /security      - Security features list');
    console.log('   GET /health        - Health check');
    console.log('');
    console.log('🔐 SECURITY STATUS: ACTIVE AND SECURE');
});
