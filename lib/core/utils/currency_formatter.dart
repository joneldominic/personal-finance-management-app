// Credit to https://github.com/yshean/input_formatting_demo
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/core/utils/text_manipulation_utils.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final int decimalPlaces;
  final bool allowNegative;
  final String symbol;

  final NumberFormat _formatter;

  CurrencyInputFormatter({
    this.decimalPlaces = 2,
    this.allowNegative = true,
    this.symbol = "PHP",
  }) : _formatter = NumberFormat.currency(
          decimalDigits: decimalPlaces,
          locale: 'en_PH',
          symbol: "$symbol ",
        );

  String reformat(String text) {
    bool hasOneDecimal = text.contains(RegExp(r"^\d+\.\d{1}$"));
    String newText = hasOneDecimal ? "${text}0" : text;

    return formatEditUpdate(
      const TextEditingValue(),
      TextEditingValue(
        text: newText,
        selection: TextSelection(
          baseOffset: text.length,
          extentOffset: text.length,
        ),
      ),
    ).text;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return textManipulation(
      oldValue,
      newValue,
      textInputFormatter: allowNegative
          ? FilteringTextInputFormatter.allow(RegExp('[0-9-]+'))
          : FilteringTextInputFormatter.digitsOnly,
      // because FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]+')), does not work
      // https://github.com/flutter/flutter/issues/21874
      formatPattern: (String filteredString) {
        if (allowNegative) {
          // filter negative sign in the middle
          // this will also remove redundant negative signs
          if ('-'.allMatches(filteredString).length >= 1) {
            print(filteredString);
            filteredString = (filteredString.startsWith('-') ? '-' : '') +
                filteredString.replaceAll('-', '');
          }
        }

        if (filteredString.isEmpty) return '';
        num number;
        number = int.tryParse(filteredString) ?? 0;
        if (decimalPlaces > 0) {
          number /= pow(10, decimalPlaces);
        }
        final result = _formatter.format(number);

        // Fix the -0+ and similar issues
        if (allowNegative) {
          if (filteredString == '-' ||
              RegExp(r'-0?0+$').hasMatch(filteredString)) {
            return '-';
          }
        }

        return result;
      },
    );
  }
}
