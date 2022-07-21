import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const tokenKey = "token";

class TokenService {
  final FlutterSecureStorage storage;
  final _tokenStreamController = StreamController<String?>();

  TokenService({
    required this.storage,
  });

  Future<String?> getToken() async {
    return storage.read(key: tokenKey);
  }

  Future<void> saveToken(String token) async {
    _tokenStreamController.add(token);
    return storage.write(key: tokenKey, value: token);
  }

  Future<void> deleteToken() async {
    _tokenStreamController.add(null);
    return storage.delete(key: tokenKey);
  }

  Stream<String?> get tokenStream => _tokenStreamController.stream;
}
