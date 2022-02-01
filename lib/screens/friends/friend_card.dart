import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/routes/router.gr.dart';
import 'package:sampleproject/size_data.dart';

class FriendCard extends StatefulWidget {
  int id;
  String name;
  Function? deleteFunc;

  FriendCard({required this.id, required this.name, this.deleteFunc});

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
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => {
                          debugPrint('perfil amigo ${widget.id}'),
                          AutoRouter.of(context)
                              .push(FriendProfileRoute(id: widget.id))
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: kSuccessColor,
                        ),
                        label: Text(''),
                      ),
                      IconButton(
                        onPressed: () => {
                          debugPrint('detalle ${widget.id}'),
                          widget.deleteFunc!(widget.id)
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: kDangerColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
