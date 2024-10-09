import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mpc_dart/mpc_dart.dart';
import 'package:mpc_dart/multi_mpc_dart.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<KeyPair> ecdsaResult = [];
  List<KeyPair> eddsaResult = [];
  String ecdsaAddress = '';
  String eddsaAddress = '';
  KeyPair? ecdsaKey;
  KeyPair? eddsaKey;
  String ecdsaSignature = '';
  String eddsaSignature = '';
  List<KeyPair> blsResult = [];
  String blsAddress = '';
  KeyPair? blsKey;
  String blsSignature = '';
  List<MultiKeypair> multiResult = [];
  String multiAddress = '';
  String multiSignature = '';
  String? multiKey;
  String multiSecretKey = '';
  String privateKey = '';
  String eddsaPrivateKey = '';
  String blsPrivateKey = '';
  Engine _engine = Engine.ECDSA;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
              title: const Text('Mpc example app'),
              bottom: const TabBar(tabs: [
                Tab(text: 'Multi Mpc'),
                Tab(text: 'Ecdsa'),
                Tab(text: 'Eddsa'),
                Tab(text: 'Bls')
              ])),
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () => _multiGenerate(),
                      child: const Text('Generate')),
                  Text(multiResult.toString()),
                  TextButton(
                      onPressed: _multiAddress, child: const Text('Address')),
                  Text(multiAddress),
                  TextButton(
                      onPressed: _multiRecover, child: const Text('Recover')),
                  Text(multiKey ?? 'Error'),
                  TextButton(onPressed: _multiSign, child: const Text('Sign')),
                  TextButton(
                      onPressed: _multiLocalSign,
                      child: const Text('Local Sign')),
                  Text(multiSignature),
                  TextButton(
                      onPressed: _multiSecretKey,
                      child: const Text('Secret key')),
                  Text(multiSecretKey)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () => _generate(),
                      child: const Text('Generate')),
                  Text(ecdsaResult.toString()),
                  TextButton(onPressed: _address, child: const Text('Address')),
                  Text(ecdsaAddress),
                  TextButton(onPressed: _recover, child: const Text('Recover')),
                  Text(ecdsaKey?.toJson() ?? 'Error'),
                  TextButton(onPressed: _sign, child: const Text('Sign')),
                  Text(ecdsaSignature),
                  TextButton(
                      onPressed: () => _privateKey(),
                      child: const Text('Private key')),
                  Text(privateKey)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () => _generate(engine: Engine.EDDSA),
                      child: const Text('Generate')),
                  Text(eddsaResult.toString()),
                  TextButton(
                      onPressed: () => _address(engine: Engine.EDDSA),
                      child: const Text('Address')),
                  Text(eddsaAddress),
                  TextButton(
                      onPressed: () => _recover(engine: Engine.EDDSA),
                      child: const Text('Recover')),
                  Text(eddsaKey?.toJson() ?? 'Error'),
                  TextButton(
                      onPressed: () => _sign(engine: Engine.EDDSA),
                      child: const Text('Sign')),
                  Text(eddsaSignature),
                  TextButton(
                      onPressed: () => _privateKey(engine: Engine.EDDSA),
                      child: const Text('Private key')),
                  Text(eddsaPrivateKey)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () => _generate(engine: Engine.BLS),
                      child: const Text('Generate')),
                  Text(blsResult.toString()),
                  TextButton(
                      onPressed: () => _address(engine: Engine.BLS),
                      child: const Text('Address')),
                  Text(blsAddress),
                  TextButton(
                      onPressed: () => _recover(engine: Engine.BLS),
                      child: const Text('Recover')),
                  Text(blsKey?.toJson() ?? 'Error'),
                  TextButton(
                      onPressed: () => _sign(engine: Engine.BLS),
                      child: const Text('Sign')),
                  Text(blsSignature),
                  TextButton(
                      onPressed: () => _privateKey(engine: Engine.BLS),
                      child: const Text('Private key')),
                  Text(blsPrivateKey)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _multiGenerate() async {
    final result = await MultiMpc.generate(1, 3, engine: _engine);
    setState(() {
      multiResult = result;
    });
  }

  _multiAddress() {
    setState(() {
      multiAddress = MultiMpc.address(multiResult[0]);
    });
  }

  _multiLocalSign() async {
    final msgs = [List<int>.filled(32, 1)];
    final params =
        MultiSignLocalParams(msgs, 1, [multiResult[0], multiResult[1]]);
    final signature = await MultiMpc.localSign(params, engine: _engine);
    setState(() {
      multiSignature = signature;
    });
  }

  _multiSign() async {
    final msgs = [List<int>.filled(32, 1)];
    final uuid = MultiMpc.uuid();
    final params = MultiSignParams(
        keypair: multiResult[0],
        msgs: msgs,
        rawMsg: '',
        url: 'http://192.168.52.19:8888',
        get: 'get',
        set: 'set',
        uid: uuid);
    final key = MultiMpc.auxToKeypair(multiResult[1]);
    final remoteSign = {
      'metadata': {
        'uid': uuid,
        'party_ind': 2,
        'engine': _engine.name,
      },
      'party_ind': 2,
      'key': jsonDecode(key)['aux']['key'],
      'raw_msg': "",
      'sign_msgs': msgs,
      'parameters': {
        'threshold': 1,
        'share_count': 3,
      },
      'round_timeout': null,
    };
    await http.post(Uri.parse('http://192.168.52.108:8888/sign'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(remoteSign));
    final signature = await MultiMpc.sign(params);
    setState(() {
      multiSignature = signature;
    });
  }

  _multiRecover() async {
    final result = await MultiMpc.recover(
        [multiResult[1], multiResult[2]], multiResult[0].aux);
    setState(() {
      multiKey = result.sk;
    });
  }

  _multiSecretKey() async {
    final result = await MultiMpc.secretKey([multiResult[1], multiResult[2]]);
    setState(() {
      multiSecretKey = result;
    });
  }

  _generate({Engine engine = Engine.ECDSA}) {
    setState(() {
      switch (engine) {
        case Engine.ECDSA:
          ecdsaResult = Ecdsa.generate(1, 3);
          break;
        case Engine.EDDSA:
          eddsaResult = Eddsa.generate(1, 3);
          break;
        case Engine.BLS:
          blsResult = Bls.generate(1, 3);
          break;
      }
    });
    return null;
  }

  _address({Engine engine = Engine.ECDSA}) {
    setState(() {
      switch (engine) {
        case Engine.ECDSA:
          ecdsaAddress = Ecdsa.address(ecdsaResult[0]);
          break;
        case Engine.EDDSA:
          eddsaAddress = Eddsa.address(eddsaResult[0]);
          break;
        case Engine.BLS:
          blsAddress = Bls.address(blsResult[0]);
          break;
        default:
      }
    });
  }

  _recover({Engine engine = Engine.ECDSA}) {
    setState(() {
      switch (engine) {
        case Engine.ECDSA:
          ecdsaKey = Ecdsa.recover([ecdsaResult[0], ecdsaResult[1]]);
          break;
        case Engine.EDDSA:
          eddsaKey = Eddsa.recover([eddsaResult[0], eddsaResult[1]]);
          break;
        case Engine.BLS:
          blsKey = Bls.recover([blsResult[0], blsResult[1]]);
          break;
        default:
      }
    });
  }

  _privateKey({Engine engine = Engine.ECDSA}) {
    setState(() {
      switch (engine) {
        case Engine.ECDSA:
          privateKey = Ecdsa.privateKey([ecdsaResult[0], ecdsaResult[1]]);
          break;
        case Engine.EDDSA:
          eddsaPrivateKey = Eddsa.privateKey([eddsaResult[0], eddsaResult[1]]);
          break;
        case Engine.BLS:
          blsPrivateKey = Bls.privateKey([blsResult[0], blsResult[1]]);
          break;
        default:
      }
    });
  }

  _sign({Engine engine = Engine.ECDSA}) {
    setState(() {
      final msgs = [List<int>.filled(32, 1)];
      switch (engine) {
        case Engine.ECDSA:
          ecdsaSignature = Ecdsa.sign(SignParams(msgs, 1, ecdsaResult));
          break;
        case Engine.EDDSA:
          eddsaSignature = Eddsa.sign(SignParams(msgs, 1, eddsaResult));
          break;
        case Engine.BLS:
          blsSignature = Bls.sign(SignParams(msgs, 1, blsResult));
          break;
        default:
      }
    });
  }
}
