import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_button.dart';
import 'package:sampleproject/screens/friends/friend_list.dart';
import 'package:sampleproject/screens/menu/menu.dart';
import 'package:sampleproject/screens/postulation/postulation.dart';
import 'package:sampleproject/user_storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int id = 0;
  String tok = '';
  int current = 0;
  final List<Widget> _screens = [
    //const BuzonHome(), ¿Hay que remover buzon?
    InternshipList(),
    PostulationList(),
    FriendList(),
    Text('perfil'),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
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
      body: _screens[current],
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        showUnselectedLabels: true,
        currentIndex: current,
        onTap: _navigationHandler,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Menú'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined), label: 'Postulaciones'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt), label: 'Amigos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ]);
  }

  void _navigationHandler(int newCurrent) {
    if (newCurrent == 3) {
      //TODO: ir a perfil de usuario
    } else {
      setState(() {
        current = newCurrent;
      });
    }
  }
}
