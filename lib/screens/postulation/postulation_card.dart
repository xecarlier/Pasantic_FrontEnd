import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/size_data.dart';

class PostulationCard extends StatefulWidget {
  int id;
  String state;
  int postulant;
  int internship;
  String internshipName;
  String enterprise;

  Function? endFunc;

  PostulationCard(
      {required this.id,
      required this.state,
      required this.postulant,
      required this.internship,
      required this.internshipName,
      required this.enterprise,
      required this.endFunc});

  @override
  _PostulationCardState createState() => _PostulationCardState();
}

class _PostulationCardState extends State<PostulationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(145),
        width: getProportionateScreenWidth(290),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                widget.internshipName,
                textScaleFactor: 1.4,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey.shade700),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                widget.enterprise,
                textScaleFactor: 1.1,
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estado:',
                        textScaleFactor: 1.1,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '${widget.state}',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: {widget.state} == 'En proceso'
                              ? kSuccessColor
                              : kDangerColor,
                        ),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        child: Text('Terminar'),
                        onPressed: () {
                          widget.endFunc!(widget.id, widget.postulant,
                              widget.internship, widget.state);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
