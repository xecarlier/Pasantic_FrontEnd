import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final name = "NOMBRE";
  final phone = "0981827483";
  final email = "correo@algo.com";
  final institution = "ESPOL";
  final id = "0802286678";
  final carreer = "COMPUTACION";
  final languages = ["p1", "p2"];
  final certifications = ["p3", "p2"];
  final references = ["prueba", "p2"];
  final alertController = new TextEditingController();

  String parseList(List<String>? lista) {
    String result = "";

    for (var item in lista!) {
      if (item == lista!.last) {
        result += "$item";
      } else {
        result += "$item, ";
      }
    }
    return result;
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
                          name,
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
                          phone,
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
                          email,
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
                          institution,
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
                          id,
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
                          carreer,
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

  showAlertDialog(BuildContext context, var entrada) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        alertController.text = "";
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        debugPrint(alertController.text);
        Navigator.of(context).pop();

      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Ingrese $entrada: "),
      content: TextFormField(controller: alertController),
      actions: [
        cancelButton,
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
}
