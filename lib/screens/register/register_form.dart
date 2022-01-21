import 'package:flutter/material.dart';
import 'package:sampleproject/constants.dart';
import 'package:sampleproject/defaults/default_button.dart';
import 'package:sampleproject/defaults/default_input.dart';
import 'package:sampleproject/size_data.dart';
import 'package:sampleproject/validator.dart';

class RegisterForm extends StatefulWidget {
  TextEditingController nameController;
  TextEditingController lastnameController;
  TextEditingController userController;
  TextEditingController cedulaController;
  TextEditingController mailController;
  TextEditingController passwordController;
  TextEditingController passwordConfirmController;
  TextEditingController phoneController;
  TextEditingController uniController;
  TextEditingController carrerController;
  TextEditingController cityController;
  TextEditingController adressController;
  GlobalKey<FormState> formKey;

  RegisterForm(
      {required this.nameController,
      required this.lastnameController,
      required this.userController,
      required this.cedulaController,
      required this.mailController,
      required this.passwordController,
      required this.passwordConfirmController,
      required this.phoneController,
      required this.uniController,
      required this.carrerController,
      required this.cityController,
      required this.adressController,
      required this.formKey});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
DateTime? _bornDate;

  bool validateForm() {
    if (Validator.validateUsername(widget.userController.text) == null &&
        Validator.validateCedula(widget.cedulaController.text) == null &&
        Validator.validateMail(widget.mailController.text) == null &&
        Validator.validatePassword(widget.passwordController.text) ==
            null &&
        widget.passwordConfirmController.text
                .compareTo(widget.passwordController.text) ==
            0) {
      return true;
    } else {
      return false;
    }
  }

  void showErrorSnack(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: kDangerColor,
      duration: const Duration(milliseconds: 1500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(40)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.nameController,
            isContrasena: false,
            validacion: Validator.validateNombreLargo,
            label: "Nombres",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.lastnameController,
            isContrasena: false,
            validacion: Validator.validateNombreLargo,
            label: "Apellidos",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.mailController,
            isContrasena: false,
            validacion: Validator.validateMail,
            label: "Correo Electrónico",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.userController,
            isContrasena: false,
            validacion: Validator.validateUsername,
            label: "Nombre de Usuario",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.passwordController,
            isContrasena: true,
            validacion: Validator.validatePassword,
            label: "Contraseña",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.passwordConfirmController,
            isContrasena: true,
            validacion: (confpassword) {
              if (confpassword.compareTo(widget.passwordController.text) !=
                  0) {
                return "Ingrese la misma contraseña";
              }
            },
            label: "Confirmar contraseña",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.cedulaController,
            isContrasena: false,
            validacion: Validator.validateCedula,
            label: "Cédula",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.phoneController,
            isContrasena: false,
            validacion: Validator.validatePhone,
            label: "Teléfono",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.uniController,
            isContrasena: false,
            validacion: Validator.validateNombreLargo,
            label: "Institución",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.carrerController,
            isContrasena: false,
            validacion: Validator.validateNombreLargo,
            label: "Carrera",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.cityController,
            isContrasena: false,
            validacion: Validator.validateNombreLargo,
            label: "Ciudad",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(50)),
          child: DefaultInput(
            controller: widget.adressController,
            isContrasena: false,
            validacion: Validator.validateNombreLargo,
            label: "Dirección",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: OutlinedButton.icon(
                icon: const IconTheme(
                  data: IconThemeData(color: Colors.black45),
                  child: Icon(Icons.date_range),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize:
                      Size.fromHeight(getProportionateScreenHeight(50)),
                  side: const BorderSide(
                    color: Colors.black45,
                  ),
                ),
                onPressed: () => pickDate(context),
                label: Text(
                  getDateText(),
                  style: const TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(60)),
          child: DefaultButton(
            func: () => {
              if (validateForm())
                {
                  debugPrint(
                      '''${widget.nameController.text} ${widget.lastnameController.text} ${widget.userController.text} 
                      ${widget.cedulaController.text} ${widget.mailController.text} ${widget.passwordController.text} 
                      ${widget.passwordConfirmController.text} ${widget.phoneController.text} ${widget.uniController.text} 
                      ${widget.carrerController.text} ${widget.cityController.text} ${widget.adressController.text} ${this.getDateText()}''')
                }
              else
                {showErrorSnack(context, 'Los datos ingresados no son válidos')}
            },
            label: "Registrarse",
            colorFondo: kPrimaryColor,
            colorTexto: kPrimaryLightColor,
          ),
        ),
      ]),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime(DateTime.now().year - 5);
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: initialDate,
    );
    if (newDate == null) return;
    setState(() => _bornDate = newDate);
  }

  String getDateText() {
    if (_bornDate == null) {
      return 'Fecha de Nacimiento';
    } else {
      return '${_bornDate!.month}-${_bornDate!.day}-${_bornDate!.year}';
    }
  }
}