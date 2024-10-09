import 'dart:typed_data';
import 'package:pointycastle/digests/keccak.dart';

List<int> hexToList(String hashHex) {
  var input = hashHex;
  if (hashHex.startsWith('0x')) input = hashHex.substring(2);
  final hash = List<int>.generate(input.length ~/ 2,
      (i) => int.parse(input.substring(i * 2, i * 2 + 2), radix: 16));
  return hash;
}

String listToHex(List<int> bytes, {bool withPrefix = true}) {
  StringBuffer buffer = StringBuffer();
  for (int part in bytes) {
    if (part & 0xff != part) {
      throw const FormatException("Non-byte integer detected");
    }
    buffer.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
  }
  return (withPrefix ? '0x' : '') + buffer.toString();
}

String publicKeyToAddress(String publicKey) {
  final KeccakDigest keccakDigest = KeccakDigest(256);
  final key = hexToList(publicKey).sublist(1);
  keccakDigest.reset();
  final result = keccakDigest.process(Uint8List.fromList(key));
  return listToHex(result.sublist(12, 32));
}
