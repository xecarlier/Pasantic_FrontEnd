import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/size_data.dart';

class FriendCard extends StatefulWidget {
  int id;
  String name;

  FriendCard(
      {required this.id,
      required this.name});

  @override
  _FriendCardState createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: getProportionateScreenHeight(90),
        width: getProportionateScreenWidth(290),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    textScaleFactor: 1.4,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                  ),
                  IconButton(onPressed: () =>{
                        debugPrint('detalle ${widget.id}')
                        //TODO: navegar al detalle de la pasantía
                      }, icon: Icon(Icons.cancel, color: kDangerColor,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}