# mpc_dart
Mpc for dart

[![Pub Version](https://img.shields.io/pub/v/mpc_dart?color=blueviolet)](https://pub.dev/packages/mpc_dart)

## Usage
```dart
import 'package:mpc_dart/mpc_dart.dart';

/// Generate
final shares = Ecdsa.generate(1, 3);
/// Get address
final address = Ecdsa.address()
/// Recover
final share = Ecdsa.recover(shares[0], shares[1])
assert(share == share[2])
/// Sign
final msgs = [List<int>.filled(32, 1)];
final signature = Ecdsa.sign(SignParams(msgs, 1, ecdsaResult));
```

## Release

1. Update version in pubspec.yaml.
2. Run `./compress.sh verison`.
3. Add changelogs.
4. Add tag and push to github.