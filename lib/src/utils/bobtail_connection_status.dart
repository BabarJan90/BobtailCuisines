import 'dart:async'; //For StreamController/Stream
import 'package:connectivity_plus/connectivity_plus.dart';

class BobtailConnectionStatus {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final BobtailConnectionStatus _singleton = BobtailConnectionStatus._internal();
  BobtailConnectionStatus._internal();

  //This is what's used to retrieve the instance through the app
  static BobtailConnectionStatus getInstance() => _singleton;

  //This tracks the current connection status
  bool hasConnection = false;
  StreamController connectionChangeController = StreamController.broadcast();
  final Connectivity _connectivity = Connectivity();

  Future<bool> isConnectedToInternet({bool isFromSync = false}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return await checkConnection(connectivityResult, isFromSync: isFromSync);
  }

  Stream get connectionChange => connectionChangeController.stream;
  Future<bool> checkConnection(ConnectivityResult connectivityResult, {bool? isFromSync}) async {
    if (connectivityResult == ConnectivityResult.mobile) {
      hasConnection = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      hasConnection = true;
    } else {
      hasConnection = false;
    }
    return hasConnection;
  }
}
