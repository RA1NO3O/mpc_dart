import 'dart:convert';

import 'package:ffi/ffi.dart';
import 'package:mpc_dart/mpc_dart.dart';
import 'package:mpc_dart/src/ffi/ffi.dart';
import 'package:mpc_dart/src/types/data.dart';
import 'package:mpc_dart/src/types/response.dart';
import 'package:mpc_dart/src/utils.dart';

class Eddsa {
  static List<KeyPair> generate(int thread, int total) {
    final result = eddsa_generate(
        thread.toString().toNativeUtf8(), total.toString().toNativeUtf8());
    final keys =
        Response.fromJson(result.cast<Utf8>().toDartString()).handleResponse();
    return [for (final k in jsonDecode(keys)) KeyPair.fromMap(k)];
  }

  static String sign(SignParams params) {
    final result = eddsa_sign(params.toJson().toNativeUtf8());
    final signature =
        Response.fromJson(result.cast<Utf8>().toDartString()).handleResponse();
    return listToHex(List<int>.from(jsonDecode(signature)[0]));
  }

  static String address(KeyPair key) {
    final result = eddsa_address(key.toJson().toNativeUtf8());
    final pubkey =
        Response.fromJson(result.cast<Utf8>().toDartString()).handleResponse();
    return pubkey;
  }

  static String privateKey(List<KeyPair> keys) {
    final result = eddsa_secret_key(
        jsonEncode([for (final k in keys) k.toMap()]).toNativeUtf8());
    return Response.fromJson(result.cast<Utf8>().toDartString())
        .handleResponse();
  }

  static KeyPair recover(List<KeyPair> keys) {
    final result = eddsa_recover(
        jsonEncode([for (final k in keys) k.toMap()]).toNativeUtf8());
    final key =
        Response.fromJson(result.cast<Utf8>().toDartString()).handleResponse();
    return KeyPair.fromMap(jsonDecode(key)[0]);
  }
}
