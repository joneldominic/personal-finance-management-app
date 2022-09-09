// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AccountNameValueKey = 'accountName';
const String CurrencyValueKey = 'currency';
const String BalanceValueKey = 'balance';
const String ColorValueKey = 'color';

final Map<String, String> CurrencyValueToTitleMap = {
  'PHP': 'PHP',
  'USD': 'USD',
};
final Map<String, String> ColorValueToTitleMap = {
  '0xff74fe07': '0xff74fe07',
  '0xfff03b8a': '0xfff03b8a',
};

final Map<String, TextEditingController>
    _AccountDetailsViewTextEditingControllers = {};

final Map<String, FocusNode> _AccountDetailsViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AccountDetailsViewTextValidations = {
  AccountNameValueKey: null,
  BalanceValueKey: null,
};

mixin $AccountDetailsView on StatelessWidget {
  TextEditingController get accountNameController =>
      _getFormTextEditingController(AccountNameValueKey);
  TextEditingController get balanceController =>
      _getFormTextEditingController(BalanceValueKey);
  FocusNode get accountNameFocusNode => _getFormFocusNode(AccountNameValueKey);
  FocusNode get balanceFocusNode => _getFormFocusNode(BalanceValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AccountDetailsViewTextEditingControllers.containsKey(key)) {
      return _AccountDetailsViewTextEditingControllers[key]!;
    }
    _AccountDetailsViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AccountDetailsViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AccountDetailsViewFocusNodes.containsKey(key)) {
      return _AccountDetailsViewFocusNodes[key]!;
    }
    _AccountDetailsViewFocusNodes[key] = FocusNode();
    return _AccountDetailsViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    accountNameController.addListener(() => _updateFormData(model));
    balanceController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AccountNameValueKey: accountNameController.text,
          BalanceValueKey: balanceController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        AccountNameValueKey: _getValidationMessage(AccountNameValueKey),
        BalanceValueKey: _getValidationMessage(BalanceValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AccountDetailsViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_AccountDetailsViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AccountDetailsViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AccountDetailsViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AccountDetailsViewTextEditingControllers.clear();
    _AccountDetailsViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get accountNameValue =>
      this.formValueMap[AccountNameValueKey] as String?;
  String? get currencyValue => this.formValueMap[CurrencyValueKey] as String?;
  String? get balanceValue => this.formValueMap[BalanceValueKey] as String?;
  String? get colorValue => this.formValueMap[ColorValueKey] as String?;

  bool get hasAccountName => this.formValueMap.containsKey(AccountNameValueKey);
  bool get hasCurrency => this.formValueMap.containsKey(CurrencyValueKey);
  bool get hasBalance => this.formValueMap.containsKey(BalanceValueKey);
  bool get hasColor => this.formValueMap.containsKey(ColorValueKey);

  bool get hasAccountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey]?.isNotEmpty ?? false;
  bool get hasCurrencyValidationMessage =>
      this.fieldsValidationMessages[CurrencyValueKey]?.isNotEmpty ?? false;
  bool get hasBalanceValidationMessage =>
      this.fieldsValidationMessages[BalanceValueKey]?.isNotEmpty ?? false;
  bool get hasColorValidationMessage =>
      this.fieldsValidationMessages[ColorValueKey]?.isNotEmpty ?? false;

  String? get accountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey];
  String? get currencyValidationMessage =>
      this.fieldsValidationMessages[CurrencyValueKey];
  String? get balanceValidationMessage =>
      this.fieldsValidationMessages[BalanceValueKey];
  String? get colorValidationMessage =>
      this.fieldsValidationMessages[ColorValueKey];
}

extension Methods on FormViewModel {
  void setCurrency(String currency) {
    this.setData(this.formValueMap..addAll({CurrencyValueKey: currency}));
  }

  void setColor(String color) {
    this.setData(this.formValueMap..addAll({ColorValueKey: color}));
  }

  setAccountNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountNameValueKey] = validationMessage;
  setCurrencyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CurrencyValueKey] = validationMessage;
  setBalanceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BalanceValueKey] = validationMessage;
  setColorValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ColorValueKey] = validationMessage;
}
