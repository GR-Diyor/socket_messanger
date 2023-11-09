var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
   res.sendFile('server boshlandi');
});
//Whenever someone connects this gets executed
io.on('connection', function(socket){
   console.log('A user connected');

     socket.join('SpenserChat');
     socket.on('xabar', function (xabar) {
     io.to('SpenserChat').emit('xabar',xabar);
         console.log(xabar);
      });
   //Whenever someone disconnects this piece of code executed
   socket.on('disconnect', function () {
      console.log('A user disconnected');
   });
});
http.listen(3000, function(){
   console.log('listening on *:3000');
});