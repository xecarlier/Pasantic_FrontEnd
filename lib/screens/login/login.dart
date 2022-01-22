import 'package:flutter/material.dart';
import 'package:sampleproject/screens/login/login_form.dart';

import '../../size_data.dart';

class Login extends StatefulWidget {
  const Login({ Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool recuerdame = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    SizeData().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(children: _botones(),)
            )
          ]
        )
      ),
    );
  }

  List<Widget> _botones() {
    return [
      SizedBox(height: getProportionateScreenHeight(50),),
      SizedBox(
        child: Image.asset(
          "assets/img/internship-icon.png",
        ),
        height: getProportionateScreenHeight(100),
      ),
      Text("Pasantic", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
      SizedBox(height: getProportionateScreenHeight(50),),
      SizedBox(
        child: FormularioLogin(
          usernameController: usernameController,
          passwordController: passwordController,
          formKey: _formKey,
        ),
        height: getProportionateScreenHeight(730),
      ),
    ];
  }
}