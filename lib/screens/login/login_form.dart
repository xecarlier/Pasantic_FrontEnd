import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_button.dart';
import 'package:sampleproject/defaults/default_input.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/routes/router.gr.dart';
import 'package:sampleproject/size_data.dart';
import 'package:sampleproject/user_storage.dart';
import 'package:sampleproject/validator.dart';

class FormularioLogin extends StatefulWidget {
  TextEditingController usernameController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;
  FormularioLogin(
      {required this.usernameController,
      required this.passwordController,
      required this.formKey});

  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  int userId = -9;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: DefaultInput(
                  controller: widget.usernameController,
                  isContrasena: false,
                  label: "Usuario",
                  validacion: Validator.validateUsername,
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: DefaultInput(
              controller: widget.passwordController,
              isContrasena: true,
              label: "Contraseña",
              validacion: Validator.validatePassword,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(50),),
          SizedBox(
        height: getProportionateScreenHeight(270),
        child: Column(
          children: [
            if (loading) Cargando(),
            if (!loading)
              SizedBox(
                height: getProportionateScreenHeight(60),
                width: getProportionateScreenWidth(250),
                child: DefaultButton(
                  func: () async => {
                    await logIn(context),
                    setState(() {
                      loading = false;
                    }),
                    if(userId!=-9){
                      AutoRouter.of(context).push(HomeRoute())
                    }
                  },
                  label: "Inicia Sesión",
                  colorFondo: loading ? kDisableColor : kPrimaryColor,
                ),
              ),
            SizedBox(height: getProportionateScreenHeight(30),),
            SizedBox(
              height: getProportionateScreenHeight(60),
              width: getProportionateScreenWidth(250),
              child: DefaultButton(
                func: () => {context.router.push(const RegisterRoute())},
                label: "Registrarse",
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }

  Future<void> logIn(BuildContext context) async {
    setState(() {
      loading = true;
    });
    try {
      final Response response = await dioConst.post('$kUrl/user/login/',
        data: {
          'username':widget.usernameController.text,
          'password':widget.passwordController.text
        });
      setState(() {
        userId = response.data['intern'] as int;
      });
      UserSecureStorage.setUserId(userId);
      UserSecureStorage.setToken(response.data['token'] as String);
      debugPrint(userId.toString());
    } catch (e) {
      debugPrint(e.toString());
    } 
  }

  
}