import 'dart:convert';
import 'dart:io';

import 'package:paystack_flutter_sa/src/common/paystack.dart';

mixin BaseApiService {
  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    HttpHeaders.userAgentHeader: PaystackPlugin.platformInfo.userAgent,
    HttpHeaders.acceptHeader: 'application/json',
    'X-Paystack-Build': PaystackPlugin.platformInfo.paystackBuild,
    'X-PAYSTACK-USER-AGENT':
        jsonEncode({'lang': Platform.isIOS ? 'objective-c' : 'kotlin'}),
    'bindings_version': PaystackPlugin.platformInfo.paystackBuild,
    'X-FLUTTER-USER-AGENT': PaystackPlugin.platformInfo.userAgent
  };
  final String baseUrl = 'https://standard.paystack.co';
}
