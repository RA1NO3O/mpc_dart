// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:mpc_dart/mpc_dart.dart';
import 'package:mpc_dart/src/ffi/ffi.dart';
import 'package:mpc_dart/src/types/response.dart';
import 'package:mpc_dart/src/utils.dart';
import 'package:uuid/uuid.dart';

const uuID = Uuid();

enum Engine { ECDSA, BLS, EDDSA }

class MultiMpc {
  static Future<List<MultiKeypair>> generate(int thread, int total,
      {Engine engine = Engine.ECDSA}) async {
    final data = {
      'uid': uuid(),
      't': thread,
      'n': total,
      'engine': engine.name,
    };
    final result = await compute(_multiGenerate, jsonEncode(data));
    final keys = Response.fromJson(result).handleResponse();
    return [for (final k in jsonDecode(keys)) MultiKeypair.fromMap(k)];
  }

  static String uuid() {
    return uuID.v4();
  }

  static Future<String> sign(MultiSignParams params) async {
    final data = {
      'url': params.url,
      'get': params.get,
      'set': params.set,
      'raw_msg': params.rawMsg,
      'uid': params.uid ?? uuid(),
      'keypairs': [params.keypair.toMap()],
      'sign_msgs': params.msgs,
      'authority': params.token ?? ''
    };
    final result = await compute(_multiSign, jsonEncode(data));
    final signature = Response.fromJson(result).handleResponse();
    return listToHex(List<int>.from(jsonDecode(signature)[0]));
  }

  static Future<String> localSign(MultiSignLocalParams params,
      {Engine engine = Engine.ECDSA}) async {
    final keys = [for (final key in params.keys) key.toMap()];
    final localKeysResult = await _toLocalKeys(jsonEncode(keys));
    final response = Response.fromJson(localKeysResult).handleResponse();
    final localKeys = [
      for (final key in jsonDecode(response)) KeyPair.fromJson(key)
    ];
    final signParams = SignParams(params.msgs, params.t, localKeys);
    switch (engine) {
      case Engine.ECDSA:
        return Ecdsa.sign(signParams);
      case Engine.EDDSA:
        return Eddsa.sign(signParams);
      default:
        throw Exception('Unsupported engine');
    }
  }

  static String address(MultiKeypair key) {
    final input = key.toJson();
    final result = eth_address_for_multi_key(input.toNativeUtf8());
    return Response.fromJson(result.cast<Utf8>().toDartString())
        .handleResponse();
  }

  static Future<MultiKeypair> recover(
      List<MultiKeypair> keys, Map<String, dynamic> aux) async {
    final params = {
      'keypairs': [for (final k in keys) k.toMap()],
      'recover_aux': [aux]
    };
    final result = await compute(_multiRecover, jsonEncode(params));
    final key = Response.fromJson(result).handleResponse();
    return MultiKeypair.fromMap(jsonDecode(key)[0]);
  }

  static Future<String> secretKey(List<MultiKeypair> keys,
      [Engine engine = Engine.ECDSA]) async {
    final params = [for (final k in keys) k.toMap()];
    final result = await compute(_secretKey, jsonEncode(params));
    return Response.fromJson(result).handleResponse();
  }

  static String auxToKeypair(MultiKeypair keypair) {
    final result = aux_to_raw(
        keypair.seed.toNativeUtf8(),
        keypair.sk.substring(0, 66).toNativeUtf8(),
        jsonEncode(keypair.aux).toNativeUtf8());
    return Response.fromJson(result.cast<Utf8>().toDartString())
        .handleResponse();
  }
  
  static _multiGenerate(String data) {
    final result = multi_generate_local(data.toNativeUtf8());
    return result.cast<Utf8>().toDartString();
  }

  static _multiRecover(String data) {
    final result = multi_recover(data.toNativeUtf8());
    return result.cast<Utf8>().toDartString();
  }

  static _multiSign(String data) {
    final result = multi_sign_remote(data.toNativeUtf8());
    return result.cast<Utf8>().toDartString();
  }

  static _toLocalKeys(String data) {
    final result = to_local_keys(data.toNativeUtf8());
    return result.cast<Utf8>().toDartString();
  }

  static _secretKey(String data) {
    final reuslt = merge_sk(data.toNativeUtf8());
    return reuslt.cast<Utf8>().toDartString();
  }
}
