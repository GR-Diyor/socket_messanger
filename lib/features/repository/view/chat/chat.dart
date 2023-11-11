import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_messanger/core/di/export_package.dart';
import 'package:socket_messanger/core/helpers/socket_stream.dart';



class Chat extends StatefulWidget {
  final String name;
  final String id;
  const Chat({required this.name,required this.id,super.key});

  @override
  State<Chat> createState() => _ChatState();
}


class _ChatState extends State<Chat> {
late Socket socket;
final socketStream = StreamSocket();
var messageController = TextEditingController();
List<Map<String,dynamic>> _messages=[];
  @override
  void initState() {
    connectSocket();
    super.initState();

  }
  void connectSocket(){
     socket = io(Platform.isAndroid?"http://10.0.2.2:3000":'http://localhost:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .build()
    );
    socket.onConnect((_) {
      print('connect');
    });
    socket.on('xabar', (xabar){

        _messages.add(xabar);
      socketStream.addResponse(_messages);
      print(xabar);});
    socket.onDisconnect((_) => print('disconnect'));
  }

  @override
  void dispose() {
    socket.close();
    socket.dispose();
    socketStream.dispose();
    super.dispose();
  }

  void sendmessage(){
    if(messageController.text.isNotEmpty||messageController.text!='') {
      socket.emit('xabar', {"xabar":messageController.text.trim(),"name":widget.name,"id":widget.id});
    messageController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          //message
          Expanded(child:
          StreamBuilder(
            stream: socketStream.getResponse,
            builder: (cxt,snapshot) {
              if(snapshot.connectionState==ConnectionState.active){
              return ListView.builder(
                itemCount: _messages.length,
                  itemBuilder: (BuildContext context,int index){
                return  Message(username: _messages[index]['name'] ,isMe: widget.id==_messages[index]['id'],message: _messages[index]['xabar'],);
              });
            }
              return const Center(child: CircularProgressIndicator(),);
            }

          ),
          ),

          // send text
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20.0),
            // padding: EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              // border: Border.all(
              //   width: 2,
              //   color: Colors.grey
              // ),
            ),
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "xabar yozing..",
                suffixIcon: IconButton(
                  onPressed: sendmessage,
                  icon: const Icon(Icons.send),
                ),
                border: const OutlineInputBorder()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
