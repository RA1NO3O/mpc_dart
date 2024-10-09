import 'dart:convert';

import 'package:mpc_dart/src/types/error.dart';

class InitParams {}

class Response {
  final bool success;
  final String result;
  final String error;
  Response({
    required this.success,
    required this.result,
    required this.error,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'result': result,
      'error': error,
    };
  }

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      success: map['success'] ?? false,
      result: map['result'] ?? '',
      error: map['error'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Response.fromJson(String source) =>
      Response.fromMap(json.decode(source));
}

extension ResponseExtension on Response {
  String handleResponse() {
    if (success) {
      return result;
    }
    throw MpcServiceError(error);
  }
}
