import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paystack_flutter_sa/src/common/my_strings.dart';
import 'package:paystack_flutter_sa/src/models/card.dart';
import 'package:paystack_flutter_sa/src/widgets/input/base_field.dart';

class CVCField extends BaseTextField {
  CVCField({
    super.key,
    required PaymentCard? card,
    required FormFieldSetter<String> super.onSaved,
  }) : super(
          labelText: 'CVV',
          hintText: '123',
          validator: (String? value) => validateCVC(value, card),
          initialValue: card != null && card.cvc != null ? card.cvc.toString() : null,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
          ],
        );

  static String? validateCVC(String? value, PaymentCard? card) {
    if (value == null || value.trim().isEmpty) return Strings.invalidCVC;

    return card!.validCVC(value) ? null : Strings.invalidCVC;
  }
}
