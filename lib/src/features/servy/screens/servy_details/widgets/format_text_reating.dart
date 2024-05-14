import 'package:flutter/services.dart';

class RangeInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final int value = int.tryParse(newValue.text) ?? min;
    if (value < min) {
      return const TextEditingValue().copyWith(text: '$min');
    } else if (value > max) {
      return const TextEditingValue().copyWith(text: '$max');
    }
    return newValue;
  }
}
