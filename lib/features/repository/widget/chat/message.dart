import 'package:socket_messanger/core/di/export_package.dart';

class Message extends StatelessWidget {
  final String username;
  final bool isMe;
  final String message;
  const Message({required this.username,required this.isMe,required this.message,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width/2,
          margin:  EdgeInsets.only(top: 15.0,left: isMe?0:10,right: isMe?10:0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isMe?Colors.blueAccent:Colors.greenAccent,
              //border: Border.all(width: 1,color: isMe?Colors.greenAccent:Colors.indigoAccent,strokeAlign: BorderSide.strokeAlignOutside),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: isMe?const Radius.circular(20):Radius.zero,
                bottomRight: isMe?Radius.zero:const Radius.circular(20),
              ),
              boxShadow:[
                BoxShadow(
                  spreadRadius: 1.0,
                  color: isMe?Colors.blueAccent:Colors.greenAccent,
                  offset: isMe?const Offset(0,0):const Offset(0, 0),
                  blurRadius: 10,
                  blurStyle: BlurStyle.normal
                ),
              ]
            ),
            child: Column(
              crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: [
                Text(username,style: TextStyle(color: Colors.white,fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),),
                Text(message,style: TextStyle(color: Colors.white,fontSize: Theme.of(context).textTheme.bodySmall!.fontSize)),
              ],
            )),

      ],
    );
  }
}
