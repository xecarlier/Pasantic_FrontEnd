
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _usrStorage = FlutterSecureStorage();

  static const _keyUserId = 'userId';
  static const _keyToken = 'token';

  static Future setUserId(int id) async =>
    await _usrStorage.write(key: _keyUserId, value: id.toString());

  static Future setToken(String token) async =>
    await _usrStorage.write(key: _keyToken, value: token);

  static Future<String?> getToken() async{
    return await _usrStorage.read(key: _keyToken);
  }

  static Future<int?> getUserId() async{
    final id = await _usrStorage.read(key: _keyUserId);
    return int.parse(id!);
  }
}