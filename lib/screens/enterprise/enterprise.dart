import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/screens/enterprise/enterprise_model.dart';
import 'package:sampleproject/screens/enterprise/review_card.dart';
import 'package:sampleproject/screens/enterprise/review_model.dart';
import 'package:sampleproject/size_data.dart';

class Enterprise extends StatefulWidget {
  int id;
  Key? key;
  Enterprise({required this.id, this.key});

  @override
  _EnterpriseState createState() => _EnterpriseState();
}

class _EnterpriseState extends State<Enterprise> {
  bool ready = false;
  EnterpriseM? enterpriseInfo;
  String? name = "Nombre";
  String? phone = "0981827483";
  String? email = "correo@algo.com";
  String? description =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
  String? website = "www.empresa.com";
  double? latitude = -2.16;
  double? longitude = -79.89;
  CameraPosition? pos =
      CameraPosition(target: LatLng(-2.16, -79.89), zoom: 11.5);
  Marker? marca = Marker(
    markerId: const MarkerId('marca'),
    infoWindow: InfoWindow(title: 'marca'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(-2.16, -79.89),
  );
  List<Review> reviews = [];

  @override
  void initState() {
    super.initState();
    getEnterprInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: ready == false
          ? Cargando()
          : SizedBox(
              width: double.infinity,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                description!,
                                textAlign: TextAlign.center,
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
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
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
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
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
                                "Sitio Web:",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                website!,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Ubicación:",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: getProportionateScreenWidth(300),
                                    height: getProportionateScreenHeight(300),
                                    child: GoogleMap(
                                      initialCameraPosition: pos!,
                                      myLocationButtonEnabled: false,
                                      markers: {marca!},
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "Reseñas:",
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.left,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: reviewList(),
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

  Future<void> getEnterprInfo() async {
    try {
      final Response resEnterpriseData = await dioConst.get(
        '$kUrl/organization/enterprise/${widget.id}/',
      );
      debugPrint(resEnterpriseData.data.toString());
      setState(() {
        enterpriseInfo = EnterpriseM(
          id: resEnterpriseData.data['id'],
          name: resEnterpriseData.data['name'],
          description: resEnterpriseData.data['description'],
          website: resEnterpriseData.data['web_site'],
          latitude: double.parse(resEnterpriseData.data['latitude']),
          longitude: double.parse(resEnterpriseData.data['longitude']),
          contactId: resEnterpriseData.data['contact'],
        );
      });
      final Response resContactData = await dioConst.get(
        '$kUrl/user/agent/${enterpriseInfo!.contactId!}/',
      );
      debugPrint(resContactData.data.toString());
      setState(() {
        enterpriseInfo!.email = resContactData.data['user_data']['email'];
        enterpriseInfo!.cellphone = resContactData.data['cellphone'];
        debugPrint(enterpriseInfo.toString());
        name = enterpriseInfo!.name;
        phone = enterpriseInfo!.cellphone;
        email = enterpriseInfo!.email;
        description = enterpriseInfo!.description;
        website = enterpriseInfo!.website;
        latitude = enterpriseInfo!.latitude;
        longitude = enterpriseInfo!.longitude;
        marca = Marker(
          markerId: const MarkerId('marca'),
          infoWindow: InfoWindow(title: name),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: LatLng(latitude!, longitude!),
        );
        pos = CameraPosition(target: LatLng(latitude!, longitude!), zoom: 11.5);
      });
      dynamic next = -1;
      while (next != null) {
        final Response resReviewData = await dioConst.get(
          '$kUrl/organization/review/',
        );
        debugPrint(resReviewData.data.toString());
        next = resReviewData.data['next'];
        for (var res in resReviewData.data['results']) {
          debugPrint(res.toString());
          if (res['owner_enterprise'] == widget.id) {
            debugPrint(res.toString());
            var usrId = res['reviewer'];
            debugPrint(usrId.toString());
            final Response resUserData = await dioConst.get(
              '$kUrl/user/intern/$usrId/',
            );
            debugPrint(resUserData.data.toString());
            Review rev = Review(
                description: res['description'],
                owner: res['owner_enterprise'],
                rating: res['rating'],
                reviewer: res['reviewer'],
                reviewerName: resUserData.data['user_data']['username']);
            debugPrint(rev.toString());
            reviews.add(rev);
          }
        }
      }
      setState(() {
        ready = true;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<Widget> reviewList() {
    List<Widget> list = [];
    for (var rev in reviews) {
      list.add(ReviewCard(author: rev.reviewerName!, review: rev));
    }
    return list;
  }
}
