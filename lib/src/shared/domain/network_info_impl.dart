import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:projeto_sti3/src/shared/interface/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl();

  Future<bool> _verifyConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> get isConnected => _verifyConnection();
}
