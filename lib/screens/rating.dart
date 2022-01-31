import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_button.dart';
import 'package:sampleproject/size_data.dart';

class RatingForm extends StatefulWidget {
  int reviewer;
  int ownerId;
  RatingForm({required this.reviewer, required this.ownerId});

  @override
  _RatingFormState createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  int? reviewId;
  var rating = 3;
  TextEditingController commentCtrl = TextEditingController();

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
                children: [
                  SizedBox(height: getProportionateScreenHeight(80),),
                  Center(
                    child: Text('¡Califica tu experiencia!',
                      textScaleFactor: 1.8,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(50),),
                  RatingBar.builder(
                    minRating: 1,
                    itemSize: 50.0,
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.yellow.shade600,),
                    updateOnDrag: true,
                    onRatingUpdate: (rating) => setState(() {
                      this.rating = rating.toInt();
                    }),
                  ),
                  SizedBox(height: getProportionateScreenHeight(50),),
                  SizedBox(
                    width: getProportionateScreenWidth(270),
                    child: TextFormField(
                      controller: commentCtrl,
                      obscureText: false,
                      maxLines: 10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF2F6F5),
                          labelText: 'Ingrese su reseña aquí!',
                          border: const OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenWidth(10),
                              horizontal: getProportionateScreenHeight(5))),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(75),),
                  DefaultButton(label: 'Publicar', func: () async{
                    await postReview();
                    if(this.reviewId!=null){
                      AutoRouter.of(context).pop();
                    }
                  }, colorFondo: kPrimaryColor,),
                  SizedBox(height: getProportionateScreenHeight(25),),
                  DefaultButton(label: 'Ignorar', func: ()=>{AutoRouter.of(context).pop()}, colorFondo: kDangerColor),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postReview() async {
    try {
      final Response response = await dioConst.post('$kUrl/organization/review/',
        data: {
          'description':this.commentCtrl.text,
          'rating':this.rating,
          'owner_enterprise':widget.ownerId,
          'reviewer':widget.reviewer,
          'active':true,
        });
      debugPrint(response.data.toString());
      setState(() {
        reviewId = response.data['id'] as int;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}