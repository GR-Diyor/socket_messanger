import 'dart:async';



class StreamSocket{
  final _socketResponse= StreamController<List<Map<String,dynamic>>>();

  void Function(List<Map<String,dynamic>>) get addResponse => _socketResponse.sink.add;

  Stream<List<Map<String,dynamic>>> get getResponse => _socketResponse.stream;

  void dispose(){
    _socketResponse.close();
  }
}