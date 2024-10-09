// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class Output {
  bool success;
  String result;
  String error;
  Output(this.success, this.result, this.error);
}

class Result {
  String? error;
  late String success;
  late String result;
  Result(this.success, this.result);
}

class Coordinate {
  late String x;
  late String y;
  Coordinate(this.x, this.y);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'x': x,
      'y': y,
    };
  }

  factory Coordinate.fromMap(Map<String, dynamic> map) {
    return Coordinate(
      map['x'],
      map['y'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinate.fromJson(String source) =>
      Coordinate.fromMap(json.decode(source) as Map<String, dynamic>);
}

class KeyPair {
  late String seed_i;
  late String x_i;
  late Map<String, dynamic> y;
  late int party_ind;
  late int threshold;
  late int share_count;
  KeyPair(
    this.seed_i,
    this.x_i,
    this.y,
    this.party_ind,
    this.threshold,
    this.share_count,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seed_i': seed_i,
      'x_i': x_i,
      'y': y,
      'party_ind': party_ind,
      'threshold': threshold,
      'share_count': share_count,
    };
  }

  factory KeyPair.fromMap(Map<String, dynamic> map) {
    return KeyPair(
      map['seed_i'] ?? '',
      map['x_i'],
      map['y'],
      map['party_ind'],
      map['threshold'],
      map['share_count'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KeyPair.fromJson(String source) =>
      KeyPair.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SignParams {
  late List<List<int>> msgs;
  late int t;
  late List<KeyPair> keys;
  SignParams(this.msgs, this.t, this.keys);

  @override
  String toString() => 'SignParams(msgs: $msgs, t: $t, keys: $keys)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msgs': msgs,
      't': t,
      'keys': [for (final k in keys) k.toMap()],
    };
  }

  factory SignParams.fromMap(Map<String, dynamic> map) {
    return SignParams(
      map['msgs'],
      map['t'],
      [for (final k in map['keys']) KeyPair.fromMap(k)],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignParams.fromJson(String source) =>
      SignParams.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MultiKeypair {
  late String sk;
  late String pk;
  late int partyInd;
  late int threshold;
  late int sharCount;
  late Map<String, dynamic> aux;
  MultiKeypair({
    required this.sk,
    required this.pk,
    required this.partyInd,
    required this.threshold,
    required this.sharCount,
    required this.aux,
  });

  String get seed {
    return sk.length == 66 ? '' : '0x${sk.substring(66)}';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sk': sk.substring(0, 66)});
    result.addAll({'pk': pk});
    result.addAll({'party_ind': partyInd});
    result.addAll({'threshold': threshold});
    result.addAll({'share_count': sharCount});
    result.addAll({'seed': seed});
    result.addAll({'aux': aux});
    return result;
  }

  factory MultiKeypair.fromMap(Map<String, dynamic> map) {
    var seed = (map['seed'] ?? '') as String;
    if (seed.startsWith('0x')) seed = seed.substring(2);
    return MultiKeypair(
      sk: (map['sk'] as String) + seed,
      pk: map['pk'] as String,
      partyInd: map['party_ind'] as int,
      threshold: map['threshold'] as int,
      sharCount: map['share_count'] as int,
      aux: map['aux'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultiKeypair.fromJson(String source) =>
      MultiKeypair.fromMap(json.decode(source));
}

class MultiSignParams {
  late MultiKeypair keypair;
  late List<List<int>> msgs;
  late String rawMsg;
  late String url;
  late String get;
  late String set;
  String? token;
  String? uid;
  MultiSignParams({
    required this.keypair,
    required this.msgs,
    required this.rawMsg,
    required this.url,
    required this.get,
    required this.set,
    this.uid,
    this.token,
  });
}

class MultiSignLocalParams {
  late List<List<int>> msgs;
  late int t;
  late List<MultiKeypair> keys;
  MultiSignLocalParams(this.msgs, this.t, this.keys);

  @override
  String toString() => 'SignParams(msgs: $msgs, t: $t, keys: $keys)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msgs': msgs,
      't': t,
      'keys': [for (final k in keys) k.toMap()],
    };
  }

  factory MultiSignLocalParams.fromMap(Map<String, dynamic> map) {
    return MultiSignLocalParams(
      map['msgs'],
      map['t'],
      [for (final k in map['keys']) MultiKeypair.fromMap(k)],
    );
  }

  String toJson() => json.encode(toMap());

  factory MultiSignLocalParams.fromJson(String source) =>
      MultiSignLocalParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
