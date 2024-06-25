import 'package:paystack_flutter/src/common/my_strings.dart';

class PaystackException implements Exception {
  String? message;

  PaystackException(this.message);

  @override
  String toString() {
    if (message == null) return Strings.unKnownError;
    return message!;
  }
}

class AuthenticationException extends PaystackException {
  AuthenticationException(String super.message);
}

class CardException extends PaystackException {
  CardException(String super.message);
}

class ChargeException extends PaystackException {
  ChargeException(super.message);
}

class InvalidAmountException extends PaystackException {
  int amount = 0;

  InvalidAmountException(this.amount)
      : super('$amount is not a valid '
            'amount. only positive non-zero values are allowed.');
}

class InvalidEmailException extends PaystackException {
  String? email;

  InvalidEmailException(this.email) : super('$email  is not a valid email');
}

class PaystackSdkNotInitializedException extends PaystackException {
  PaystackSdkNotInitializedException(String super.message);
}

class ProcessingException extends ChargeException {
  ProcessingException() : super('A transaction is currently processing, please wait till it concludes before attempting a new charge.');
}
