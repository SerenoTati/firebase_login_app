import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_login/app/modules/login/infra/drivers/internet_driver.dart';

class InternetDriverImpl implements InternetDriver {
  final Connectivity internerDriverObject;

  InternetDriverImpl({required this.internerDriverObject});
  @override
  Future<bool> isOnline() async {
    var res = await internerDriverObject.checkConnectivity();
    if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
