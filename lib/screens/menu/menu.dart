import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_input.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/screens/menu/internship_card.dart';
import 'package:sampleproject/screens/menu/internship_model.dart';
import 'package:sampleproject/size_data.dart';

class InternshipList extends StatefulWidget {
  const InternshipList({Key? key}) : super(key: key);

  @override
  _InternshipListState createState() => _InternshipListState();
}

class _InternshipListState extends State<InternshipList> {
  bool loading = true;
  TextEditingController searchController = new TextEditingController();
  List<Internship> internships = [];
  List<Widget> contenido = [];

  @override
  void initState() {
    super.initState();
    getInternships();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: !loading
            ? CustomScrollView(slivers: [
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: getProportionateScreenHeight(40),
                                width: getProportionateScreenWidth(210),
                                child: DefaultInput(
                                    controller: searchController,
                                    isContrasena: false,
                                    label: 'Buscar...')),
                            TextButton.icon(
                                onPressed: buildList,
                                icon: Icon(
                                  Icons.search,
                                  color: kDisableColor,
                                ),
                                label: Text(''))
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(290),
                          child: Container(
                            child: Text(
                              'Resultados',
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Column(
                          children: contenido,
                        )
                      ],
                    ))
              ])
            : Cargando());
  }

  Future<void> getInternships() async {
    dynamic next = -1;
    try {
      while (next != null) {
        final Response response = await dioConst.get(
          '$kUrl/internship/',
        );

        debugPrint(response.data.toString());
        next = response.data['next'];
        for (var res in response.data['results']) {
          Internship internship = Internship(
              id: res['id'],
              name: res['name'],
              description: res['description'],
              typeOfWorkDay: res['type_of_workDay'],
              requirements:
                  res['requirements'] == null || res['requirements'].length < 1
                      ? ["Sin detalle"]
                      : List<String>.from(res['requirements']),
              challenges:
                  res['challenges'] == null || res['challenges'].length < 1
                      ? ["Sin detalle"]
                      : List<String>.from(res['challenges']),
              profile: res['profile'],
              startDate: res['start_date'],
              endDate: res['end_date'],
              durationMonths: res['duration_months'],
              remuneration: res['remuneration'],
              ownerEnterprise: res['owner_enterprise'],
              ownerName: res['enterprise']);
          internships.add(internship);
        }
      }
      setState(() {
        loading = false;
      });
      buildList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void buildList() {
    List<Widget> res = [];
    setState(() {
      contenido = [];
    });
    debugPrint(searchController.text);
    for (var internship in internships) {
      if (searchController.text == '') {
        res.add(InternshipCard(
            id: internship.id!,
            name: internship.name!,
            durationMonths: internship.durationMonths!,
            ownerName: internship.ownerName!));
      } else if (internship.name!
          .toLowerCase()
          .contains(searchController.text.toLowerCase())) {
        res.add(InternshipCard(
            id: internship.id!,
            name: internship.name!,
            durationMonths: internship.durationMonths!,
            ownerName: internship.ownerName!));
      }
    }
    setState(() {
      contenido = res;
    });
  }
}
