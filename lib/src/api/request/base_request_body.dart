import 'package:paystack_flutter/src/common/paystack.dart';

abstract class BaseRequestBody {
  final fieldDevice = 'device';
  String? _device;

  BaseRequestBody() {
    _setDeviceId();
  }

  Map<String, String?> paramsMap();

  String? get device => _device;

  _setDeviceId() {
    String deviceId = PaystackPlugin.platformInfo.deviceId;
    _device = deviceId;
  }
}
