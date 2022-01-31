import 'package:flutter/material.dart';
import 'package:sampleproject/screens/enterprise/review_model.dart';
import 'package:sampleproject/size_data.dart';

class ReviewCard extends StatefulWidget {
  String author;
  Review review;

  ReviewCard(
      {required this.author,
      required this.review});

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.author,
                    textScaleFactor: 1.4,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey.shade700),
                  ),
                  Row(children: buildContent(),)
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.review.description!,
                    textScaleFactor: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  List<Widget> buildContent() {
    List<Widget> list = [];
    for(var i = 0; i < widget.review.rating!; i++){
      list.add(Icon(Icons.star, color: Colors.yellow.shade600,));
    }
    for(var i = widget.review.rating!; i < 5; i++){
      list.add(Icon(Icons.star_border));
    }
    return list;
  }
}
