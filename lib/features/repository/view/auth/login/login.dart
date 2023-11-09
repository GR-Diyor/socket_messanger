import 'package:socket_messanger/core/di/export_package.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final name = TextEditingController();
  String id = UniqueKey().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                hintText: "Ismingizni kiriting",
                border: OutlineInputBorder()
              ),
            ),
          ),
          MaterialButton(
            onPressed: (){
              if(name.text.isNotEmpty) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (BuildContext context) {
                  return Chat(name: name.text, id: id);
                }));
              }
            },
            color: Colors.blueAccent,
            minWidth: MediaQuery.of(context).size.width/3,
          child: const Text("Chatni boshlash",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
