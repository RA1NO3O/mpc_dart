import Flutter
import UIKit

public class SwiftMpcDartPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mpc_dart", binaryMessenger: registrar.messenger())
    let instance = SwiftMpcDartPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
  public func enforceBundling() {
    ecdsa_generate(nil, nil)
    ecdsa_sign(nil)
    ecdsa_recover(nil)
    ecdsa_secret_key(nil)
    ecdsa_address(nil)
    bls_generate(nil, nil)
    bls_sign(nil)
    bls_recover(nil)
    bls_secret_key(nil)
    bls_pubkey(nil)
    multi_generate_local(nil)
    multi_sign_remote(nil)
    multi_recover(nil)
    eth_address_for_multi_key(nil)
    aux_to_raw(nil, nil, nil)
    merge_sk(nil)
    to_local_keys(nil)
  } 
}
