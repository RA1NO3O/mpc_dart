/// bindings for `libmpc`

import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;

// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names
final DynamicLibrary _dl = _open();
/// Reference to the Dynamic Library, it should be only used for low-level access
final DynamicLibrary dl = _dl;
DynamicLibrary _open() {
  if (Platform.isAndroid) return DynamicLibrary.open('libmpc.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `Java_org_CrossApp_hellocpp_Mpc_auxToRaw`.
int Java_org_CrossApp_hellocpp_Mpc_auxToRaw(
  int env,
  int JClass,
  int seed,
  int sk,
  int aux,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_auxToRaw(env, JClass, seed, sk, aux);
}
final _Java_org_CrossApp_hellocpp_Mpc_auxToRaw_Dart _Java_org_CrossApp_hellocpp_Mpc_auxToRaw = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_auxToRaw_C, _Java_org_CrossApp_hellocpp_Mpc_auxToRaw_Dart>('Java_org_CrossApp_hellocpp_Mpc_auxToRaw');
typedef _Java_org_CrossApp_hellocpp_Mpc_auxToRaw_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 seed,
  Int32 sk,
  Int32 aux,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_auxToRaw_Dart = int Function(
  int env,
  int JClass,
  int seed,
  int sk,
  int aux,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_generate`.
int Java_org_CrossApp_hellocpp_Mpc_generate(
  int env,
  int JClass,
  int param,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_generate(env, JClass, param);
}
final _Java_org_CrossApp_hellocpp_Mpc_generate_Dart _Java_org_CrossApp_hellocpp_Mpc_generate = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_generate_C, _Java_org_CrossApp_hellocpp_Mpc_generate_Dart>('Java_org_CrossApp_hellocpp_Mpc_generate');
typedef _Java_org_CrossApp_hellocpp_Mpc_generate_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 param,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_generate_Dart = int Function(
  int env,
  int JClass,
  int param,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_localBlsSign`.
int Java_org_CrossApp_hellocpp_Mpc_localBlsSign(
  int env,
  int JClass,
  int java_pattern,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_localBlsSign(env, JClass, java_pattern);
}
final _Java_org_CrossApp_hellocpp_Mpc_localBlsSign_Dart _Java_org_CrossApp_hellocpp_Mpc_localBlsSign = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_localBlsSign_C, _Java_org_CrossApp_hellocpp_Mpc_localBlsSign_Dart>('Java_org_CrossApp_hellocpp_Mpc_localBlsSign');
typedef _Java_org_CrossApp_hellocpp_Mpc_localBlsSign_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 java_pattern,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_localBlsSign_Dart = int Function(
  int env,
  int JClass,
  int java_pattern,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign`.
int Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign(
  int env,
  int JClass,
  int java_pattern,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign(env, JClass, java_pattern);
}
final _Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign_Dart _Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign_C, _Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign_Dart>('Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign');
typedef _Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 java_pattern,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_localEcdsaSign_Dart = int Function(
  int env,
  int JClass,
  int java_pattern,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_localEddsaSign`.
int Java_org_CrossApp_hellocpp_Mpc_localEddsaSign(
  int env,
  int JClass,
  int java_pattern,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_localEddsaSign(env, JClass, java_pattern);
}
final _Java_org_CrossApp_hellocpp_Mpc_localEddsaSign_Dart _Java_org_CrossApp_hellocpp_Mpc_localEddsaSign = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_localEddsaSign_C, _Java_org_CrossApp_hellocpp_Mpc_localEddsaSign_Dart>('Java_org_CrossApp_hellocpp_Mpc_localEddsaSign');
typedef _Java_org_CrossApp_hellocpp_Mpc_localEddsaSign_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 java_pattern,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_localEddsaSign_Dart = int Function(
  int env,
  int JClass,
  int java_pattern,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign`.
int Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign(
  int env,
  int JClass,
  int java_pattern,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign(env, JClass, java_pattern);
}
final _Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign_Dart _Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign_C, _Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign_Dart>('Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign');
typedef _Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 java_pattern,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_localSchnorrSign_Dart = int Function(
  int env,
  int JClass,
  int java_pattern,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_localStarknetSign`.
int Java_org_CrossApp_hellocpp_Mpc_localStarknetSign(
  int env,
  int JClass,
  int java_pattern,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_localStarknetSign(env, JClass, java_pattern);
}
final _Java_org_CrossApp_hellocpp_Mpc_localStarknetSign_Dart _Java_org_CrossApp_hellocpp_Mpc_localStarknetSign = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_localStarknetSign_C, _Java_org_CrossApp_hellocpp_Mpc_localStarknetSign_Dart>('Java_org_CrossApp_hellocpp_Mpc_localStarknetSign');
typedef _Java_org_CrossApp_hellocpp_Mpc_localStarknetSign_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 java_pattern,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_localStarknetSign_Dart = int Function(
  int env,
  int JClass,
  int java_pattern,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_privateKey`.
int Java_org_CrossApp_hellocpp_Mpc_privateKey(
  int env,
  int JClass,
  int java_pattern,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_privateKey(env, JClass, java_pattern);
}
final _Java_org_CrossApp_hellocpp_Mpc_privateKey_Dart _Java_org_CrossApp_hellocpp_Mpc_privateKey = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_privateKey_C, _Java_org_CrossApp_hellocpp_Mpc_privateKey_Dart>('Java_org_CrossApp_hellocpp_Mpc_privateKey');
typedef _Java_org_CrossApp_hellocpp_Mpc_privateKey_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 java_pattern,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_privateKey_Dart = int Function(
  int env,
  int JClass,
  int java_pattern,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_recover`.
int Java_org_CrossApp_hellocpp_Mpc_recover(
  int env,
  int JClass,
  int param,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_recover(env, JClass, param);
}
final _Java_org_CrossApp_hellocpp_Mpc_recover_Dart _Java_org_CrossApp_hellocpp_Mpc_recover = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_recover_C, _Java_org_CrossApp_hellocpp_Mpc_recover_Dart>('Java_org_CrossApp_hellocpp_Mpc_recover');
typedef _Java_org_CrossApp_hellocpp_Mpc_recover_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 param,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_recover_Dart = int Function(
  int env,
  int JClass,
  int param,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_remoteSign`.
int Java_org_CrossApp_hellocpp_Mpc_remoteSign(
  int env,
  int JClass,
  int param,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_remoteSign(env, JClass, param);
}
final _Java_org_CrossApp_hellocpp_Mpc_remoteSign_Dart _Java_org_CrossApp_hellocpp_Mpc_remoteSign = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_remoteSign_C, _Java_org_CrossApp_hellocpp_Mpc_remoteSign_Dart>('Java_org_CrossApp_hellocpp_Mpc_remoteSign');
typedef _Java_org_CrossApp_hellocpp_Mpc_remoteSign_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 param,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_remoteSign_Dart = int Function(
  int env,
  int JClass,
  int param,
);

/// C function `Java_org_CrossApp_hellocpp_Mpc_toLocalKeys`.
int Java_org_CrossApp_hellocpp_Mpc_toLocalKeys(
  int env,
  int JClass,
  int java_pattern,
) {
  return _Java_org_CrossApp_hellocpp_Mpc_toLocalKeys(env, JClass, java_pattern);
}
final _Java_org_CrossApp_hellocpp_Mpc_toLocalKeys_Dart _Java_org_CrossApp_hellocpp_Mpc_toLocalKeys = _dl.lookupFunction<_Java_org_CrossApp_hellocpp_Mpc_toLocalKeys_C, _Java_org_CrossApp_hellocpp_Mpc_toLocalKeys_Dart>('Java_org_CrossApp_hellocpp_Mpc_toLocalKeys');
typedef _Java_org_CrossApp_hellocpp_Mpc_toLocalKeys_C = Int32 Function(
  Int32 env,
  Int32 JClass,
  Int32 java_pattern,
);
typedef _Java_org_CrossApp_hellocpp_Mpc_toLocalKeys_Dart = int Function(
  int env,
  int JClass,
  int java_pattern,
);

/// C function `aux_to_raw`.
Pointer<ffi.Utf8> aux_to_raw(
  Pointer<ffi.Utf8> seed,
  Pointer<ffi.Utf8> sk,
  Pointer<ffi.Utf8> aux,
) {
  return _aux_to_raw(seed, sk, aux);
}
final _aux_to_raw_Dart _aux_to_raw = _dl.lookupFunction<_aux_to_raw_C, _aux_to_raw_Dart>('aux_to_raw');
typedef _aux_to_raw_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> seed,
  Pointer<ffi.Utf8> sk,
  Pointer<ffi.Utf8> aux,
);
typedef _aux_to_raw_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> seed,
  Pointer<ffi.Utf8> sk,
  Pointer<ffi.Utf8> aux,
);

/// C function `bls_generate`.
Pointer<ffi.Utf8> bls_generate(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
) {
  return _bls_generate(t, n);
}
final _bls_generate_Dart _bls_generate = _dl.lookupFunction<_bls_generate_C, _bls_generate_Dart>('bls_generate');
typedef _bls_generate_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);
typedef _bls_generate_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);

/// C function `bls_pubkey`.
Pointer<ffi.Utf8> bls_pubkey(
  Pointer<ffi.Utf8> param,
) {
  return _bls_pubkey(param);
}
final _bls_pubkey_Dart _bls_pubkey = _dl.lookupFunction<_bls_pubkey_C, _bls_pubkey_Dart>('bls_pubkey');
typedef _bls_pubkey_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _bls_pubkey_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `bls_recover`.
Pointer<ffi.Utf8> bls_recover(
  Pointer<ffi.Utf8> param,
) {
  return _bls_recover(param);
}
final _bls_recover_Dart _bls_recover = _dl.lookupFunction<_bls_recover_C, _bls_recover_Dart>('bls_recover');
typedef _bls_recover_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _bls_recover_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `bls_secret_key`.
Pointer<ffi.Utf8> bls_secret_key(
  Pointer<ffi.Utf8> param,
) {
  return _bls_secret_key(param);
}
final _bls_secret_key_Dart _bls_secret_key = _dl.lookupFunction<_bls_secret_key_C, _bls_secret_key_Dart>('bls_secret_key');
typedef _bls_secret_key_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _bls_secret_key_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `bls_sign`.
Pointer<ffi.Utf8> bls_sign(
  Pointer<ffi.Utf8> param,
) {
  return _bls_sign(param);
}
final _bls_sign_Dart _bls_sign = _dl.lookupFunction<_bls_sign_C, _bls_sign_Dart>('bls_sign');
typedef _bls_sign_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _bls_sign_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `ecdsa_address`.
Pointer<ffi.Utf8> ecdsa_address(
  Pointer<ffi.Utf8> param,
) {
  return _ecdsa_address(param);
}
final _ecdsa_address_Dart _ecdsa_address = _dl.lookupFunction<_ecdsa_address_C, _ecdsa_address_Dart>('ecdsa_address');
typedef _ecdsa_address_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _ecdsa_address_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `ecdsa_generate`.
Pointer<ffi.Utf8> ecdsa_generate(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
) {
  return _ecdsa_generate(t, n);
}
final _ecdsa_generate_Dart _ecdsa_generate = _dl.lookupFunction<_ecdsa_generate_C, _ecdsa_generate_Dart>('ecdsa_generate');
typedef _ecdsa_generate_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);
typedef _ecdsa_generate_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);

/// C function `ecdsa_recover`.
Pointer<ffi.Utf8> ecdsa_recover(
  Pointer<ffi.Utf8> param,
) {
  return _ecdsa_recover(param);
}
final _ecdsa_recover_Dart _ecdsa_recover = _dl.lookupFunction<_ecdsa_recover_C, _ecdsa_recover_Dart>('ecdsa_recover');
typedef _ecdsa_recover_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _ecdsa_recover_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `ecdsa_secret_key`.
Pointer<ffi.Utf8> ecdsa_secret_key(
  Pointer<ffi.Utf8> param,
) {
  return _ecdsa_secret_key(param);
}
final _ecdsa_secret_key_Dart _ecdsa_secret_key = _dl.lookupFunction<_ecdsa_secret_key_C, _ecdsa_secret_key_Dart>('ecdsa_secret_key');
typedef _ecdsa_secret_key_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _ecdsa_secret_key_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `ecdsa_sign`.
Pointer<ffi.Utf8> ecdsa_sign(
  Pointer<ffi.Utf8> param,
) {
  return _ecdsa_sign(param);
}
final _ecdsa_sign_Dart _ecdsa_sign = _dl.lookupFunction<_ecdsa_sign_C, _ecdsa_sign_Dart>('ecdsa_sign');
typedef _ecdsa_sign_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _ecdsa_sign_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `eddsa_address`.
Pointer<ffi.Utf8> eddsa_address(
  Pointer<ffi.Utf8> param,
) {
  return _eddsa_address(param);
}
final _eddsa_address_Dart _eddsa_address = _dl.lookupFunction<_eddsa_address_C, _eddsa_address_Dart>('eddsa_address');
typedef _eddsa_address_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _eddsa_address_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `eddsa_generate`.
Pointer<ffi.Utf8> eddsa_generate(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
) {
  return _eddsa_generate(t, n);
}
final _eddsa_generate_Dart _eddsa_generate = _dl.lookupFunction<_eddsa_generate_C, _eddsa_generate_Dart>('eddsa_generate');
typedef _eddsa_generate_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);
typedef _eddsa_generate_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);

/// C function `eddsa_recover`.
Pointer<ffi.Utf8> eddsa_recover(
  Pointer<ffi.Utf8> param,
) {
  return _eddsa_recover(param);
}
final _eddsa_recover_Dart _eddsa_recover = _dl.lookupFunction<_eddsa_recover_C, _eddsa_recover_Dart>('eddsa_recover');
typedef _eddsa_recover_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _eddsa_recover_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `eddsa_secret_key`.
Pointer<ffi.Utf8> eddsa_secret_key(
  Pointer<ffi.Utf8> param,
) {
  return _eddsa_secret_key(param);
}
final _eddsa_secret_key_Dart _eddsa_secret_key = _dl.lookupFunction<_eddsa_secret_key_C, _eddsa_secret_key_Dart>('eddsa_secret_key');
typedef _eddsa_secret_key_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _eddsa_secret_key_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `eddsa_sign`.
Pointer<ffi.Utf8> eddsa_sign(
  Pointer<ffi.Utf8> param,
) {
  return _eddsa_sign(param);
}
final _eddsa_sign_Dart _eddsa_sign = _dl.lookupFunction<_eddsa_sign_C, _eddsa_sign_Dart>('eddsa_sign');
typedef _eddsa_sign_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _eddsa_sign_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `eth_address_for_multi_key`.
Pointer<ffi.Utf8> eth_address_for_multi_key(
  Pointer<ffi.Utf8> param,
) {
  return _eth_address_for_multi_key(param);
}
final _eth_address_for_multi_key_Dart _eth_address_for_multi_key = _dl.lookupFunction<_eth_address_for_multi_key_C, _eth_address_for_multi_key_Dart>('eth_address_for_multi_key');
typedef _eth_address_for_multi_key_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _eth_address_for_multi_key_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `eth_decrypt`.
Pointer<ffi.Utf8> eth_decrypt(
  Pointer<ffi.Utf8> encrypted_message,
  Pointer<ffi.Utf8> decrypt_sk,
) {
  return _eth_decrypt(encrypted_message, decrypt_sk);
}
final _eth_decrypt_Dart _eth_decrypt = _dl.lookupFunction<_eth_decrypt_C, _eth_decrypt_Dart>('eth_decrypt');
typedef _eth_decrypt_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> encrypted_message,
  Pointer<ffi.Utf8> decrypt_sk,
);
typedef _eth_decrypt_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> encrypted_message,
  Pointer<ffi.Utf8> decrypt_sk,
);

/// C function `eth_encrypt`.
Pointer<ffi.Utf8> eth_encrypt(
  Pointer<ffi.Utf8> message,
  Pointer<ffi.Utf8> receiver_pubkey,
) {
  return _eth_encrypt(message, receiver_pubkey);
}
final _eth_encrypt_Dart _eth_encrypt = _dl.lookupFunction<_eth_encrypt_C, _eth_encrypt_Dart>('eth_encrypt');
typedef _eth_encrypt_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> message,
  Pointer<ffi.Utf8> receiver_pubkey,
);
typedef _eth_encrypt_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> message,
  Pointer<ffi.Utf8> receiver_pubkey,
);

/// C function `eth_get_encryption_public_key`.
Pointer<ffi.Utf8> eth_get_encryption_public_key(
  Pointer<ffi.Utf8> secret,
) {
  return _eth_get_encryption_public_key(secret);
}
final _eth_get_encryption_public_key_Dart _eth_get_encryption_public_key = _dl.lookupFunction<_eth_get_encryption_public_key_C, _eth_get_encryption_public_key_Dart>('eth_get_encryption_public_key');
typedef _eth_get_encryption_public_key_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> secret,
);
typedef _eth_get_encryption_public_key_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> secret,
);

/// <p class="para-brief"> this function only allows for export.</p>
Pointer<ffi.Utf8> merge_sk(
  Pointer<ffi.Utf8> param,
) {
  return _merge_sk(param);
}
final _merge_sk_Dart _merge_sk = _dl.lookupFunction<_merge_sk_C, _merge_sk_Dart>('merge_sk');
typedef _merge_sk_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _merge_sk_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `multi_generate_local`.
Pointer<ffi.Utf8> multi_generate_local(
  Pointer<ffi.Utf8> param,
) {
  return _multi_generate_local(param);
}
final _multi_generate_local_Dart _multi_generate_local = _dl.lookupFunction<_multi_generate_local_C, _multi_generate_local_Dart>('multi_generate_local');
typedef _multi_generate_local_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _multi_generate_local_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `multi_recover`.
Pointer<ffi.Utf8> multi_recover(
  Pointer<ffi.Utf8> param,
) {
  return _multi_recover(param);
}
final _multi_recover_Dart _multi_recover = _dl.lookupFunction<_multi_recover_C, _multi_recover_Dart>('multi_recover');
typedef _multi_recover_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _multi_recover_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `multi_sign_remote`.
Pointer<ffi.Utf8> multi_sign_remote(
  Pointer<ffi.Utf8> param,
) {
  return _multi_sign_remote(param);
}
final _multi_sign_remote_Dart _multi_sign_remote = _dl.lookupFunction<_multi_sign_remote_C, _multi_sign_remote_Dart>('multi_sign_remote');
typedef _multi_sign_remote_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _multi_sign_remote_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `schnorr_generate`.
Pointer<ffi.Utf8> schnorr_generate(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
) {
  return _schnorr_generate(t, n);
}
final _schnorr_generate_Dart _schnorr_generate = _dl.lookupFunction<_schnorr_generate_C, _schnorr_generate_Dart>('schnorr_generate');
typedef _schnorr_generate_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);
typedef _schnorr_generate_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);

/// C function `schnorr_recover`.
Pointer<ffi.Utf8> schnorr_recover(
  Pointer<ffi.Utf8> param,
) {
  return _schnorr_recover(param);
}
final _schnorr_recover_Dart _schnorr_recover = _dl.lookupFunction<_schnorr_recover_C, _schnorr_recover_Dart>('schnorr_recover');
typedef _schnorr_recover_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _schnorr_recover_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `schnorr_secret_key`.
Pointer<ffi.Utf8> schnorr_secret_key(
  Pointer<ffi.Utf8> param,
) {
  return _schnorr_secret_key(param);
}
final _schnorr_secret_key_Dart _schnorr_secret_key = _dl.lookupFunction<_schnorr_secret_key_C, _schnorr_secret_key_Dart>('schnorr_secret_key');
typedef _schnorr_secret_key_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _schnorr_secret_key_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `schnorr_sign`.
Pointer<ffi.Utf8> schnorr_sign(
  Pointer<ffi.Utf8> param,
) {
  return _schnorr_sign(param);
}
final _schnorr_sign_Dart _schnorr_sign = _dl.lookupFunction<_schnorr_sign_C, _schnorr_sign_Dart>('schnorr_sign');
typedef _schnorr_sign_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _schnorr_sign_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `starknet_address`.
Pointer<ffi.Utf8> starknet_address(
  Pointer<ffi.Utf8> param,
) {
  return _starknet_address(param);
}
final _starknet_address_Dart _starknet_address = _dl.lookupFunction<_starknet_address_C, _starknet_address_Dart>('starknet_address');
typedef _starknet_address_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _starknet_address_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `starknet_generate`.
Pointer<ffi.Utf8> starknet_generate(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
) {
  return _starknet_generate(t, n);
}
final _starknet_generate_Dart _starknet_generate = _dl.lookupFunction<_starknet_generate_C, _starknet_generate_Dart>('starknet_generate');
typedef _starknet_generate_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);
typedef _starknet_generate_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> t,
  Pointer<ffi.Utf8> n,
);

/// C function `starknet_recover`.
Pointer<ffi.Utf8> starknet_recover(
  Pointer<ffi.Utf8> param,
) {
  return _starknet_recover(param);
}
final _starknet_recover_Dart _starknet_recover = _dl.lookupFunction<_starknet_recover_C, _starknet_recover_Dart>('starknet_recover');
typedef _starknet_recover_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _starknet_recover_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `starknet_secret_key`.
Pointer<ffi.Utf8> starknet_secret_key(
  Pointer<ffi.Utf8> param,
) {
  return _starknet_secret_key(param);
}
final _starknet_secret_key_Dart _starknet_secret_key = _dl.lookupFunction<_starknet_secret_key_C, _starknet_secret_key_Dart>('starknet_secret_key');
typedef _starknet_secret_key_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _starknet_secret_key_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `starknet_sign`.
Pointer<ffi.Utf8> starknet_sign(
  Pointer<ffi.Utf8> param,
) {
  return _starknet_sign(param);
}
final _starknet_sign_Dart _starknet_sign = _dl.lookupFunction<_starknet_sign_C, _starknet_sign_Dart>('starknet_sign');
typedef _starknet_sign_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _starknet_sign_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);

/// C function `to_local_keys`.
Pointer<ffi.Utf8> to_local_keys(
  Pointer<ffi.Utf8> param,
) {
  return _to_local_keys(param);
}
final _to_local_keys_Dart _to_local_keys = _dl.lookupFunction<_to_local_keys_C, _to_local_keys_Dart>('to_local_keys');
typedef _to_local_keys_C = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
typedef _to_local_keys_Dart = Pointer<ffi.Utf8> Function(
  Pointer<ffi.Utf8> param,
);
