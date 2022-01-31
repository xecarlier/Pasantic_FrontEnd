import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/routes/router.gr.dart';
import 'package:sampleproject/screens/menu/internship_model.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/size_data.dart';
import 'package:sampleproject/user_storage.dart';

class InternshipDetail extends StatefulWidget {
  int? id;

  InternshipDetail({this.id});

  @override
  _InternshipDetailState createState() => _InternshipDetailState();
}

class _InternshipDetailState extends State<InternshipDetail> {
  bool loading = true;
  late Internship internship;
  bool applied = false;

  String parseList(List<String> lista) {
    return lista.join("\n \n");
  }

  @override
  void initState() {
    super.initState();
    getInternship();
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                '${internship.name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: kPrimaryColor,
            ),
            body: SizedBox(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: <Widget>[
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
                                'Empresa: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                textScaleFactor: 1.4,
                              ),
                              Text(
                                internship.ownerName!,
                                textScaleFactor: 1.2,
                              ),
                              IconButton(onPressed: ()=>{
                                AutoRouter.of(context).push(EnterpriseRoute(id: internship.ownerEnterprise!))
                              }, icon: Icon(Icons.arrow_forward_ios)),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
                              ),
                              Text(
                                'Perfil: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                textScaleFactor: 1.4,
                              ),
                              Text(
                                internship.profile!,
                                textScaleFactor: 1.2,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
                              ),
                              Text(
                                'Duración: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                textScaleFactor: 1.4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    internship.startDate!,
                                    textScaleFactor: 1.2,
                                  ),
                                  Text(
                                    internship.endDate!,
                                    textScaleFactor: 1.2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
                              ),
                              Text(
                                'Tipo de jornada: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                textScaleFactor: 1.4,
                              ),
                              Text(
                                internship.typeOfWorkDay!,
                                textScaleFactor: 1.2,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
                              ),
                              Text(
                                'Descripción: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                                textScaleFactor: 1.4,
                              ),
                              Text(
                                internship.description!,
                                textScaleFactor: 1.2,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Requerimientos:',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                    textScaleFactor: 1.4,
                                  ),
                                  Text(
                                    parseList(internship.requirements!),
                                    textScaleFactor: 1.2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Desafios:',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                    textScaleFactor: 1.4,
                                  ),
                                  Text(
                                    parseList(internship.challenges!),
                                    textScaleFactor: 1.2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Beneficios:',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                    textScaleFactor: 1.4,
                                  ),
                                  Text(
                                    internship.haveRemuneration!
                                        ? 'Remuneración: \$${internship.remuneration!}'
                                        : 'Sin detalle',
                                    textScaleFactor: 1.2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(35),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: getProportionateScreenWidth(275),
                                    height: getProportionateScreenHeight(50),
                                    child: ElevatedButton(
                                      child: Text(
                                        'Aplicar',
                                        textScaleFactor: 1.4,
                                      ),
                                      onPressed: applied
                                          ? null
                                          : () {
                                              applyInternship();
                                            },
                                      style: ElevatedButton.styleFrom(
                                        primary: kPrimaryColor,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(25),
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
          )
        : Scaffold(
            body: Cargando(),
          );
  }

  Future<void> getInternship() async {
    try {
      var usrId = await UserSecureStorage.getUserId();
      final Response res = await dioConst.get('$kUrl/internship/${widget.id}/');
      debugPrint(res.data.toString());
      internship = Internship(
          id: res.data['id'],
          startDate: res.data['start_date'],
          endDate: res.data['end_date'],
          name: res.data['name'],
          description: res.data['description'],
          typeOfWorkDay: res.data['type_of_workDay'],
          requirements: res.data['requirements'] == null ||
                  res.data['requirements'].length < 1
              ? ["Sin detalle"]
              : List<String>.from(res.data['requirements']),
          challenges: res.data['challenges'] == null ||
                  res.data['challenges'].length < 1
              ? ["Sin detalle"]
              : List<String>.from(res.data['challenges']),
          profile: res.data['profile'],
          durationMonths: res.data['duration_months'],
          remuneration: res.data['remuneration'],
          haveRemuneration: res.data['have_remuneration'],
          ownerEnterprise: res.data['owner_enterprise'],
          ownerName: res.data['enterprise']);
      setState(() {
        loading = false;
        applied = res.data['postulants'].contains(usrId) ? true : false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> applyInternship() async {
    setState(() {
      loading = true;
    });
    try {
      var usrId = await UserSecureStorage.getUserId();
      final Response res = await dioConst.post('$kUrl/postulation/',
          data: {'internship': widget.id, 'postulant': usrId});
      setState(() {
        loading = false;
      });
      bool condition = res.statusCode == 201;
      String msg =
          condition ? 'Postulación generada con éxito' : 'Algo salió mal.';
      applied = condition ? true : false;
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Aplicación confirmada'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
