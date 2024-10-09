import 'package:flutter_test/flutter_test.dart';
import 'package:mpc_dart/src/utils.dart';

void main() {
  test('publickey to address', () {
    const publicKey =
        "0x021eddb2c99ba20c66c5f1a866af86dffe4c5a563919d43216ace6f781b129b467";
    final address = publicKeyToAddress(publicKey);
    expect(address, '0x02bd2596b2c37dec780fc495615e9eafcd65888f');
  });
}
