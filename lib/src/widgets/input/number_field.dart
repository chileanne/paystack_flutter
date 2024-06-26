import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paystack_flutter_sa/src/common/card_utils.dart';
import 'package:paystack_flutter_sa/src/common/my_strings.dart';
import 'package:paystack_flutter_sa/src/models/card.dart';
import 'package:paystack_flutter_sa/src/widgets/common/input_formatters.dart';
import 'package:paystack_flutter_sa/src/widgets/input/base_field.dart';

class NumberField extends BaseTextField {
  NumberField({super.key, required PaymentCard? card, required super.controller, required FormFieldSetter<String> super.onSaved, required Widget super.suffix})
      : super(
          labelText: 'CARD NUMBER',
          hintText: '0000 0000 0000 0000',
          validator: (String? value) => validateCardNum(value, card),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(19), CardNumberInputFormatter()],
        );

  static String? validateCardNum(String? input, PaymentCard? card) {
    if (input == null || input.isEmpty) {
      return Strings.invalidNumber;
    }

    input = CardUtils.getCleanedNumber(input);

    return card!.validNumber(input) ? null : Strings.invalidNumber;
  }
}
