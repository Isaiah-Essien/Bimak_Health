import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';

//This class manages the network connectivity status
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initializes the network manager and sets up a stream to continually check the connection state
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      _updateConnectionStatus(
          results.first); // Handle the first result from the list
    });
  }

  ///Update the connection status based on the change in the connectivity and show a relevant message
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      MLoaders.customToast(message: 'No Internet Connection');
    }
  }

  ///Check the internet connection status
  ///Return `true` if connected, and `false` if not
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (e) {
      return false;
    }
  }

  ///Dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
