import 'package:socket_messanger/core/di/export_package.dart';




class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void navigatePage(BuildContext context){
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return const Login();
      }));
    });
  }

  @override
  void initState() {
    super.initState();
    navigatePage(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Chat messenger",style: TextStyle(fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,color: Colors.blueAccent),),
      ),
    );
  }
}
