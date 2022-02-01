import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/screens/user/user_model.dart';
import 'package:sampleproject/size_data.dart';

class FriendProfile extends StatefulWidget {
  int? id;

  FriendProfile({required this.id});

  @override
  _FriendProfileState createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  bool loading = true;
  late User? friend;

  String parseList(List<dynamic>? lista) {
    return lista != null ? lista.join("\n") : "Sin detalle";
  }

  @override
  void initState() {
    super.initState();
    getFriend();
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '${friend?.username}',
                textScaleFactor: 1.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: kPrimaryColor),
            ),
            body: SizedBox(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 30,
                        left: 40,
                        right: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nombre:",
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            '${friend?.firstName} ${friend?.lastName}',
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
                            '${friend?.cellphone}',
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
                            '${friend?.email}',
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
                            '${friend?.institution}',
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
                            '${friend?.cardId}',
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
                            '${friend?.studyField}',
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                                parseList(friend?.languages),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                                parseList(friend?.certifications),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                                parseList(friend?.references),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Cargando(),
          );
  }

  Future<void> getFriend() async {
    try {
      final Response res =
          await dioConst.get('$kUrl/user/intern/${widget.id}/');
      debugPrint(res.data.toString());
      setState(() {
        friend = User(
            id: res.data['id'],
            cardId: res.data['card_id'],
            city: res.data['city'],
            bornDate: res.data['born_date'],
            address: res.data['address'],
            bio: res.data['bio'],
            institution: res.data['institution'],
            studyField: res.data['study_field'],
            certifications: res.data['certifications'],
            languages: res.data['languages'],
            references: res.data['references'],
            friends: res.data['friends'],
            user: res.data['user'],
            firstName: res.data['user_data']['first_name'],
            lastName: res.data['user_data']['last_name'],
            email: res.data['user_data']['email'],
            username: res.data['user_data']['username'],
            cellphone: res.data['cellphone']);
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
