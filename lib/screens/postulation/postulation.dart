import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/user_storage.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/screens/postulation/postulation_card.dart';
import 'package:sampleproject/screens/postulation/postulation_model.dart';
import 'package:sampleproject/size_data.dart';

class PostulationList extends StatefulWidget {
  const PostulationList({Key? key}) : super(key: key);

  @override
  _PostulationListState createState() => _PostulationListState();
}

class _PostulationListState extends State<PostulationList> {
  bool loading = true;
  List<Postulation> postulations = [];
  List<Widget> contenido = [];

  @override
  void initState() {
    super.initState();
    getPostulations();
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
                        SizedBox(
                          width: getProportionateScreenWidth(290),
                          child: Container(
                            child: Text('Postulaciones',
                                textScaleFactor: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                                textAlign: TextAlign.center),
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

  Future<void> getPostulations() async {
    dynamic next = -1;
    var usrId = await UserSecureStorage.getUserId();
    setState(() {
      postulations = [];
    });
    try {
      while (next != null) {
        final Response response = await dioConst.get(
          '$kUrl/postulation/?postulant=$usrId',
        );

        debugPrint(response.data.toString());
        next = response.data['next'];
        for (var res in response.data['results']) {
          Postulation postulation = Postulation(
              id: res['id'],
              state: res['state'] == true ? 'En proceso' : 'Terminado',
              postulant: res['postulant'],
              internship: res['internship'],
              internshipName: res['internship_data']['name'],
              enterprise: res['internship_data']['enterprise']);

          postulations.add(postulation);
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
    for (var postulation in postulations) {
      res.add(PostulationCard(
          id: postulation.id!,
          state: postulation.state!,
          postulant: postulation.postulant!,
          internship: postulation.internship!,
          internshipName: postulation.internshipName!,
          enterprise: postulation.enterprise!,
          endFunc: endPostulation));
    }
    setState(() {
      contenido = res;
    });
  }

  Future<void> endPostulation(
      int id, int postulant, int internship, String state) async {
    debugPrint('$kUrl/postulation/$id/');
    try {
      final Response response =
          await dioConst.put('$kUrl/postulation/$id/', data: {
        'id': id,
        'postulant': postulant,
        'internship': internship,
        'state': state == 'En proceso' ? false : true,
      });
      await getPostulations();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
