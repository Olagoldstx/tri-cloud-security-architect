// Simple secure Node.js application
console.log('🛡️ Secure Multi-Stage Node.js Container Running!');
console.log('User:', process.env.USER || 'unknown');
console.log('UID:', process.env.UID || 'unknown');
console.log('Security Features:');
console.log('- Running as non-root user');
console.log('- Multi-stage build');
console.log('- Minimal production image');

// Keep alive for demo
setInterval(() => {
    console.log('Application running securely...', new Date().toISOString());
}, 30000);
