import 'package:flutter/material.dart';
import 'package:sampleproject/screens/register/register_form.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final userController = TextEditingController();
  final cedulaController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final phoneController = TextEditingController();
  final uniController = TextEditingController();
  final carrerController = TextEditingController();
  final cityController = TextEditingController();
  final adressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registro', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
                hasScrollBody: false,
                child: RegisterForm(
                  nameController: nameController,
                  lastnameController: lastnameController,
                  userController: userController,
                  cedulaController: cedulaController,
                  mailController: mailController,
                  passwordController: passwordController,
                  passwordConfirmController: passwordConfirmController,
                  phoneController: phoneController,
                  uniController: uniController,
                  carrerController: carrerController,
                  cityController: cityController,
                  adressController: adressController,
                  formKey: _formKey,
                )),
          ],
        ),
      ),
    );
  }

}