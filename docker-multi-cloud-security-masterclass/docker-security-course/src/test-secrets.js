// Super simple secrets test
const fs = require('fs');
const http = require('http');

console.log('🔍 Testing secrets access...');

try {
    // Try to read secrets
    const files = fs.readdirSync('/run/secrets');
    console.log('📁 Secrets directory contents:', files);
    
    files.forEach(file => {
        try {
            const content = fs.readFileSync('/run/secrets/' + file, 'utf8');
            console.log(`✅ ${file}: ${content.length} chars (content: ***${content.slice(-3)})`);
        } catch (err) {
            console.log(`❌ ${file}: ${err.message}`);
        }
    });
} catch (err) {
    console.log('❌ Cannot access /run/secrets:', err.message);
    console.log('Current directory:', __dirname);
    console.log('Trying to list files in /run:');
    try {
        const runFiles = fs.readdirSync('/run');
        console.log('/run contents:', runFiles);
    } catch (e) {
        console.log('Cannot access /run either');
    }
}

// Simple server
const server = http.createServer((req, res) => {
    res.writeHead(200);
    res.end('Hello from simple test! Secrets are working!');
});

server.listen(3000, '0.0.0.0', () => {
    console.log('🚀 Simple test running on port 3000');
});
