var http = require('http');
var userCount = 0;
var server = http.createServer(function (require, response) {
    if (require.url === '/favicon.ico'){
        console.log('favicon');
        return;
    }
    userCount++;
    response.writeHead(200, { 'Content-Type': 'text/plain' });
    response.write('Welcome !\n');
    response.write('We were visited ' + userCount + ' times!\n');
    response.end();

});

server.listen(9090);
console.log('server is running')
