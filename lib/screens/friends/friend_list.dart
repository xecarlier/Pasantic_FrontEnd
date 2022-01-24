import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_input.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/screens/friends/friend_card.dart';
import 'package:sampleproject/screens/friends/friend_model.dart';
import 'package:sampleproject/screens/user/user_model.dart';
import 'package:sampleproject/size_data.dart';
import 'package:sampleproject/user_storage.dart';
import 'package:sampleproject/validator.dart';

class FriendList extends StatefulWidget {
  const FriendList({ Key? key }) : super(key: key);

  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  bool loading = true;
  TextEditingController searchController = new TextEditingController();
  TextEditingController newFriendController = new TextEditingController();
  User? userInfo;
  List<Friend> friends = [];
  List<Widget> contenido = [];

  
 
  @override
  void initState() {
    super.initState();
    getFriends();
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
                        child: DefaultInput(controller: newFriendController, isContrasena: false, label: 'Cédula del nuevo amigo...'),),
                      IconButton(
                        onPressed: addFriend, 
                        icon: Icon(Icons.add_circle_sharp, color: Colors.green,)
                      )
                    ],
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
    for (var Friend in friends){
      if(searchController.text == ''){
        res.add(FriendCard(
          id: Friend.id!, 
          name: Friend.name!,
          deleteFunc: deleteFriend,)
        );
      }else if(Friend.name!.toLowerCase().contains(searchController.text.toLowerCase())){
        res.add(FriendCard(
          id: Friend.id!, 
          name: Friend.name!,
          deleteFunc: deleteFriend)
        );
      }
    }
    setState(() {
      contenido = res;
      loading = false;
    });
  }

  Future<void> getFriends() async {
    setState(() {
      friends = [];
    });
    var usrId = await UserSecureStorage.getUserId();
    try {
      final Response resUserData = await dioConst.get('$kUrl/user/intern/$usrId/', 
                                    );
      setState(() {
        userInfo = User(
          id: resUserData.data['id'],
          cardId: resUserData.data['card_id'],
          city: resUserData.data['city'],
          bornDate: resUserData.data['born_date'],
          address: resUserData.data['address'],
          bio: resUserData.data['bio'],
          institution: resUserData.data['institution'],
          studyField: resUserData.data['study_field'],
          certifications: resUserData.data['certifications'],
          languages: resUserData.data['languages'],
          references: resUserData.data['references'],
          friends: resUserData.data['friends'],
          user: resUserData.data['user'],
          firstName: resUserData.data['user_data']['first_name'],
          lastName: resUserData.data['user_data']['last_name'],
          email: resUserData.data['user_data']['email'],
          username: resUserData.data['user_data']['username'],
          cellphone: resUserData.data['cellphone']
        );
      });
      debugPrint(resUserData.data.toString());
      var iter = userInfo!.friends;
      for (var friendId in iter!) {
        final Response response = await dioConst.get('$kUrl/user/intern/$friendId/', 
                                    );
                                    debugPrint(response.data.toString());
        Friend friend = Friend(
          id: response.data['id'],
          name: response.data['user_data']['username']
        );
        friends.add(friend);
      }
      setState(() {
        loading = false;
      });
      buildList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addFriend() async {
    debugPrint(userInfo.toString());
    debugPrint('$kUrl/user/intern/?card_id=${this.newFriendController.text}');
    try {
      var friendId;
      final Response resUserData = await dioConst.get('$kUrl/user/intern/?card_id=${this.newFriendController.text}',);
      debugPrint(resUserData.data.toString());
      for(var res in resUserData.data['results']){
        friendId = res['id'];
      }
      userInfo!.friends!.add(friendId!);
      final Response response = await dioConst.put('$kUrl/user/intern/${userInfo!.id}/',
        data: {
          'card_id': userInfo!.cardId,
          'born_date':userInfo!.bornDate,
          'first_name':userInfo!.firstName,
          'address':userInfo!.address!,
          'active':true,
          'city':userInfo!.city,
          'cellphone':userInfo!.cellphone,
          'institution':userInfo!.institution,
          'study_field':userInfo!.studyField,
          'email':userInfo!.email,
          'last_name':userInfo!.lastName,
          'user':userInfo!.user,
          'friends':userInfo!.friends
        });
        await getFriends();
    } catch (e) {
      
      debugPrint(e.toString());
    }
    
  }

  Future<void> deleteFriend( int friendId ) async {
    debugPrint(userInfo.toString());
    debugPrint('$kUrl/user/intern/${userInfo!.id}/');
    userInfo!.friends!.remove(friendId);
    try {
      final Response response = await dioConst.put('$kUrl/user/intern/${userInfo!.id}/',
        data: {
          'card_id': userInfo!.cardId,
          'born_date':userInfo!.bornDate,
          'first_name':userInfo!.firstName,
          'address':userInfo!.address!,
          'active':true,
          'city':userInfo!.city,
          'cellphone':userInfo!.cellphone,
          'institution':userInfo!.institution,
          'study_field':userInfo!.studyField,
          'email':userInfo!.email,
          'last_name':userInfo!.lastName,
          'user':userInfo!.user,
          'friends':userInfo!.friends
        });
        await getFriends();
    } catch (e) {
      
      debugPrint(e.toString());
    }
    
  }
}