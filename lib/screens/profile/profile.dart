import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/screens/user/user_model.dart';
import 'package:sampleproject/user_storage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? userInfo;
  String? name = "NOMBRE";
  String? phone = "0981827483";
  String? email = "correo@algo.com";
  String? institution = "ESPOL";
  String? id = "0802286678";
  String? carreer = "COMPUTACION";
  List<dynamic>? languages = ["p1", "p2"];
  List<dynamic>? certifications = ["p3", "p2"];
  List<dynamic>? references = ["prueba", "p2"];
  final alertController = new TextEditingController();

  String parseList(List<dynamic>? lista) {
    String result = "";

    for (var item in lista!) {
      if (item == lista.last) {
        result += "$item";
      } else {
        result += "$item, ";
      }
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    getUsrInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50.0,
                        ),
                        child: Text(
                          "PERFIL",
                          style: const TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 45.0,
                      left: 40,
                      right: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nombre:",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          name!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Teléfono:",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          phone!,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Correo Electrónico:",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          email!,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Institución:",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          institution!,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Cédula:",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          id!,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Carrera:",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          carreer!,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Idiomas:",
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  parseList(languages),
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.black26,
                              onPressed: () {
                                showAlertDialog(context, "Idiomas");
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Certificaciones:",
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  parseList(certifications),
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.black26,
                              onPressed: () {
                                showAlertDialog(context, "Certificaciones");
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Referencias:",
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  parseList(references),
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Colors.black26,
                              onPressed: () {
                                showAlertDialog(context, "Referencias");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getUsrInfo() async {
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
      setState(() {
        name = '${userInfo!.firstName} ${userInfo!.lastName}';
        phone = userInfo!.cellphone;
        email = userInfo!.email;
        institution = userInfo!.institution;
        carreer = userInfo!.studyField;
        id = userInfo!.cardId;
        if(userInfo!.languages != null){
          languages = userInfo!.languages;
        }else{
          languages = [];
        }
        if(userInfo!.certifications != null){
          certifications = userInfo!.certifications;
        }else{
          certifications = [];
        }
        if(userInfo!.references != null){
          references = userInfo!.references;
        }else{
          references = [];
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  showAlertDialog(BuildContext context, var entrada) {
    // set up the buttons
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
        debugPrint(alertController.text);
        var list = alertController.text.split(',');
        if(entrada == 'Idiomas'){
          setState(() {
            userInfo!.languages = list;
          });
        }else if(entrada == 'Certificaciones'){
          setState(() {
            userInfo!.certifications = list;
          });
        }else if(entrada == 'Referencias'){
          setState(() {
            userInfo!.references = list;
          });
        }
        updateField();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Ingrese $entrada: "),
      content: TextFormField(controller: alertController),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> updateField() async {
    debugPrint(userInfo.toString());
    debugPrint('$kUrl/user/intern/${userInfo!.id!}/');
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
          'certifications':userInfo!.certifications,
          'languages':userInfo!.languages,
          'references':userInfo!.references
        });
        await getUsrInfo();
    } catch (e) {
      
      debugPrint(e.toString());
    }
    
  }
}
