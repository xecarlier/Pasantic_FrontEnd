class Validator{
  static String? validatePassword(String? contrasena) {
    if (contrasena!.length < 8) {
      return "La contraseña debe tener mínimo 8 caracteres";
      // ignore: unnecessary_raw_strings
    } else if (!RegExp(r'[A-Z]').hasMatch(contrasena)) {
      return "La contraseña debe incluir por lo menos 1 Mayúscula";
      // ignore: unnecessary_raw_strings
    } else if (!RegExp(r'[a-z]').hasMatch(contrasena)) {
      return "La contraseña debe incluir por lo menos 1 Minúscula";
      // ignore: unnecessary_raw_strings
    } else if (!RegExp(r'[0-9]').hasMatch(contrasena)) {
      return "La contraseña debe incluir por lo menos 1 número";
    } else {
      return null;
    }
  }

  static String? validateUsername(String? username) {
    return ((5 < username!.length) && (username.length < 20))
        ? null
        : "Ingresar al menos 5 y menos de 20 caracteres";
  }

  static String? validateNombreLargo(String? name) {
    return ((5 < name!.length) && (name.length < 30))
        ? null
        : "Por favor ingrese texto entre 5 y 30 caracteres";
  }

  static String? validateMail(String? correo) {
    return (RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(correo!))
        ? null
        : "Por favor ingrese un correo válido";
  }

  static String? validateCedula(String? cedula) {
    return ((cedula!.length == 10) &&
            (RegExp(r'^[0-9]+$').hasMatch(cedula)))
        ? null
        : "Por favor ingrese cédula válida";
  }

  static String? validatePhone(String? num){
    return (RegExp(r'^\+\d{2,3}\d{9}$').hasMatch(num!))? null : "Ingrese un teléfono válido, Ej: +593947397245";
  }
}