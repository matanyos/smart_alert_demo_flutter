import 'package:encrypt/encrypt.dart' as encryptor;

class Encryptor {
  final key = encryptor.Key.fromUtf8('9a4c0a59aa0d43ae818587db9bb1279d');
  final iv = encryptor.IV.fromLength(8);

  String encrypt({required String value}) {
    return encryptor.Encrypter(encryptor.AES(key)).encrypt(value, iv: iv).base64;
  }

  String decrypt({required String value}) {

    return encryptor.Encrypter(encryptor.AES(key)).decrypt64(value, iv: iv);
  }
}
