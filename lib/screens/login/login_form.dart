import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_button.dart';
import 'package:sampleproject/defaults/default_input.dart';
import 'package:sampleproject/defaults/default_loading.dart';
import 'package:sampleproject/routes/router.gr.dart';
import 'package:sampleproject/size_data.dart';
import 'package:sampleproject/validator.dart';

class FormularioLogin extends StatefulWidget {
  TextEditingController usuarioController;
  TextEditingController contrasenaController;
  Function recuerdameCallback;
  bool recuerdame;
  GlobalKey<FormState> formKey;
  FormularioLogin(
      {required this.usuarioController,
      required this.contrasenaController,
      required this.recuerdame,
      required this.formKey,
      required this.recuerdameCallback});

  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  bool recuerdame = false;
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
                  controller: widget.usuarioController,
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
              controller: widget.contrasenaController,
              isContrasena: true,
              label: "Contraseña",
              validacion: Validator.validateContrasena,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          _recuerdame(),
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
                  func: () => {
                    logIn(context),
                    AutoRouter.of(context).push(HomeRoute())
                  },
                  label: "Inicia Sesion",
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
    await Future.delayed(const Duration(seconds: 3));
    //TODO: Añadir comunicación por api
    setState(() {
      loading = false;
    });
  }

  Widget _recuerdame() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: widget.recuerdame,
            activeColor: kPrimaryColor,
            onChanged: widget.recuerdameCallback as void Function(bool?)?),
        const Text("Recuerdame")
      ],
    );
  }
}