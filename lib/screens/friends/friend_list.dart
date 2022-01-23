import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_input.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/screens/friends/friend_card.dart';
import 'package:sampleproject/screens/friends/friend_model.dart';
import 'package:sampleproject/size_data.dart';

class FriendList extends StatefulWidget {
  const FriendList({ Key? key }) : super(key: key);

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  bool loading = true;
  TextEditingController searchController = new TextEditingController();
  List<Friend> Friends = [Friend(id: 1, name: 'usuario1'), Friend(id: 2, name: 'usuario2'),Friend(id: 3, name: 'usuario3'),Friend(id: 4, name: 'usuario4'),];
  List<Widget> contenido = [];

  
 
  @override
  void initState() {
    super.initState();
    buildList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: !loading
        ?CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(40),),
                  Text('Amigos',
                    textScaleFactor: 1.6,
                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(40),
                        width: getProportionateScreenWidth(180),
                        child: DefaultInput(controller: searchController, isContrasena: false, label: 'Buscar...')),
                      IconButton(
                        onPressed: buildList, 
                        icon: Icon(Icons.search, color: kDisableColor,)
                      ),
                      IconButton(
                        onPressed: buildList, 
                        icon: Icon(Icons.add_circle_sharp, color: Colors.green,)
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  Column(children: contenido,)
                ],
              )
            )
          ]
        )
      : Cargando()
    );
  }

  void buildList() {
    List<Widget> res = [];
    setState(() {
      contenido = [];
    });
    debugPrint(searchController.text);
    for (var Friend in Friends){
      if(searchController.text == ''){
        res.add(FriendCard(
          id: Friend.id!, 
          name: Friend.name!)
        );
      }else if(Friend.name!.toLowerCase().contains(searchController.text.toLowerCase())){
        res.add(FriendCard(
          id: Friend.id!, 
          name: Friend.name!)
        );
      }
    }
    setState(() {
      contenido = res;
      loading = false;
    });
  }
}