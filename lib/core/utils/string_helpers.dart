double parseAmountStringToDouble(String value) {
  return double.parse(value.replaceAll(RegExp(r'[^0-9-.]+'), ''));
}
