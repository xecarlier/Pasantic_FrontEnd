class Validator{
  static String? validateContrasena(String? contrasena) {
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
        : "Por favor ingrese un nombre de usuario válido";
  }
}