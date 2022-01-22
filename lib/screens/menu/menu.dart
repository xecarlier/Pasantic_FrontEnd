import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/screens/menu/internship_card.dart';
import 'package:sampleproject/screens/menu/internship_model.dart';

class InternshipList extends StatefulWidget {
  const InternshipList({ Key? key }) : super(key: key);

  @override
  _InternshipListState createState() => _InternshipListState();
}

class _InternshipListState extends State<InternshipList> {
  bool loading = true;
  List<Internship> internships = [];

  
 
  @override
  void initState() {
    super.initState();
    getInternships();
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
                children: buildList(),
              )
            )
          ]
        )
      : Cargando()
    );
  }

  Future<void> getInternships() async {
    dynamic next = -1;
    try {
      while(next!=null){
        final Response response = await dioConst.get('$kUrl/internship/', 
                                      );

        debugPrint(response.data.toString());
        next = response.data['next'];
        for (var res in response.data['results']) {
          Internship internship = Internship(
            id: res['id'],
            name: res['name'],
            description: res['description'],
            typeOfWorkDay: res['type_of_workDay'],
            requirements: res['requirements'],
            challenges: res['challenges'],
            profile: res['profile'],
            startDate: res['start_date'],
            endDate: res['end_date'],
            durationMonths: res['duration_months'],
            remuneration: res['remuneration'],
            ownerEnterprise: res['owner_enterprise']
          );

          internship.setOwnerName();
          internships.add(internship);
        }
      }
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<Widget> buildList() {
    List<Widget> res = [];
    for (var internship in internships){
      res.add(InternshipCard(
        id: internship.id!, 
        name: internship.name!, 
        durationMonths: internship.durationMonths!, 
        ownerName: internship.ownerName!)
      );
    }
    return res;
  }
}