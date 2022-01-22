import 'package:flutter/material.dart';
import 'package:sampleproject/defaults/default_button.dart';
import 'package:sampleproject/user_storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int id = 0;
  String tok = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async{
    final idl = await UserSecureStorage.getUserId();
    final tokl = await UserSecureStorage.getToken();

    setState(() {
      id = idl!;
      tok = tokl!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(id.toString()),
        Text(tok)
      ],),
    );
  }

}