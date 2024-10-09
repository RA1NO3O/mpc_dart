#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

const char *eth_get_encryption_public_key(const char *secret);

const char *eth_encrypt(const char *message, const char *receiver_pubkey);

const char *eth_decrypt(const char *encrypted_message, const char *decrypt_sk);

const char *bls_generate(const char *t, const char *n);

const char *bls_sign(const char *param);

const char *bls_recover(const char *param);

const char *bls_secret_key(const char *param);

const char *bls_pubkey(const char *param);

const char *ecdsa_generate(const char *t, const char *n);

const char *ecdsa_sign(const char *param);

const char *ecdsa_recover(const char *param);

const char *ecdsa_secret_key(const char *param);

const char *ecdsa_address(const char *param);

const char *eddsa_generate(const char *t, const char *n);

const char *eddsa_sign(const char *param);

const char *eddsa_recover(const char *param);

const char *eddsa_secret_key(const char *param);

const char *eddsa_address(const char *param);

const char *schnorr_generate(const char *t, const char *n);

const char *schnorr_sign(const char *param);

const char *schnorr_recover(const char *param);

const char *schnorr_secret_key(const char *param);

const char *starknet_generate(const char *t, const char *n);

const char *starknet_sign(const char *param);

const char *starknet_recover(const char *param);

const char *starknet_secret_key(const char *param);

const char *starknet_address(const char *param);

const char *multi_generate_local(const char *param);

const char *multi_sign_remote(const char *param);

const char *multi_recover(const char *param);

const char *eth_address_for_multi_key(const char *param);

const char *aux_to_raw(const char *seed, const char *sk, const char *aux);

/**
 * this function only allows for export.
 */
const char *merge_sk(const char *param);

const char *to_local_keys(const char *param);

