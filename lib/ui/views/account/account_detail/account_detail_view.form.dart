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
const String NewBalanceValueKey = 'newBalance';
const String ColorValueKey = 'color';

final Map<String, String> CurrencyValueToTitleMap = {
  'PHP': 'PHP',
  'USD': 'USD',
};
final Map<String, String> ColorValueToTitleMap = {
  '0xFFFF4081': '0xFFFF4081',
  '0xFFF50057': '0xFFF50057',
  '0xFFC51162': '0xFFC51162',
  '0xFFFF5252': '0xFFFF5252',
  '0xFFFF1744': '0xFFFF1744',
  '0xFFD50000': '0xFFD50000',
  '0xFFFF6E40': '0xFFFF6E40',
  '0xFFFF3D00': '0xFFFF3D00',
  '0xFFDD2C00': '0xFFDD2C00',
  '0xFFFFAB40': '0xFFFFAB40',
  '0xFFFF9100': '0xFFFF9100',
  '0xFFFF6D00': '0xFFFF6D00',
  '0xFFFFD740': '0xFFFFD740',
  '0xFFFFC400': '0xFFFFC400',
  '0xFFFFAB00': '0xFFFFAB00',
  '0xFFFFFF00': '0xFFFFFF00',
  '0xFFFFEA00': '0xFFFFEA00',
  '0xFFFFD600': '0xFFFFD600',
  '0xFFEEFF41': '0xFFEEFF41',
  '0xFFC6FF00': '0xFFC6FF00',
  '0xFFAEEA00': '0xFFAEEA00',
  '0xFFB2FF59': '0xFFB2FF59',
  '0xFF76FF03': '0xFF76FF03',
  '0xFF64DD17': '0xFF64DD17',
  '0xFF69F0AE': '0xFF69F0AE',
  '0xFF00E676': '0xFF00E676',
  '0xFF00C853': '0xFF00C853',
  '0xFF40C4FF': '0xFF40C4FF',
  '0xFF00B0FF': '0xFF00B0FF',
  '0xFF0091EA': '0xFF0091EA',
  '0xFF448AFF': '0xFF448AFF',
  '0xFF2979FF': '0xFF2979FF',
  '0xFF2962FF': '0xFF2962FF',
  '0xFF536DFE': '0xFF536DFE',
  '0xFF3D5AFE': '0xFF3D5AFE',
  '0xFF304FFE': '0xFF304FFE',
  '0xFFE040FB': '0xFFE040FB',
  '0xFFD500F9': '0xFFD500F9',
  '0xFFAA00FF': '0xFFAA00FF',
  '0xFF7C4DFF': '0xFF7C4DFF',
  '0xFF651FFF': '0xFF651FFF',
  '0xFF6200EA': '0xFF6200EA',
  '0xFF8D6E63': '0xFF8D6E63',
  '0xFF795548': '0xFF795548',
  '0xFF6D4C41': '0xFF6D4C41',
  '0xFFBDBDBD': '0xFFBDBDBD',
  '0xFF757575': '0xFF757575',
  '0xFF616161': '0xFF616161',
};

final Map<String, TextEditingController>
    _AccountDetailViewTextEditingControllers = {};

final Map<String, FocusNode> _AccountDetailViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AccountDetailViewTextValidations = {
  AccountNameValueKey: null,
  BalanceValueKey: null,
  NewBalanceValueKey: null,
};

mixin $AccountDetailView on StatelessWidget {
  TextEditingController get accountNameController =>
      _getFormTextEditingController(AccountNameValueKey);
  TextEditingController get balanceController =>
      _getFormTextEditingController(BalanceValueKey);
  TextEditingController get newBalanceController =>
      _getFormTextEditingController(NewBalanceValueKey);
  FocusNode get accountNameFocusNode => _getFormFocusNode(AccountNameValueKey);
  FocusNode get balanceFocusNode => _getFormFocusNode(BalanceValueKey);
  FocusNode get newBalanceFocusNode => _getFormFocusNode(NewBalanceValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AccountDetailViewTextEditingControllers.containsKey(key)) {
      return _AccountDetailViewTextEditingControllers[key]!;
    }
    _AccountDetailViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AccountDetailViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AccountDetailViewFocusNodes.containsKey(key)) {
      return _AccountDetailViewFocusNodes[key]!;
    }
    _AccountDetailViewFocusNodes[key] = FocusNode();
    return _AccountDetailViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    accountNameController.addListener(() => _updateFormData(model));
    balanceController.addListener(() => _updateFormData(model));
    newBalanceController.addListener(() => _updateFormData(model));
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
          NewBalanceValueKey: newBalanceController.text,
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
        NewBalanceValueKey: _getValidationMessage(NewBalanceValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AccountDetailViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_AccountDetailViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AccountDetailViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AccountDetailViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AccountDetailViewTextEditingControllers.clear();
    _AccountDetailViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get accountNameValue =>
      this.formValueMap[AccountNameValueKey] as String?;
  String? get currencyValue => this.formValueMap[CurrencyValueKey] as String?;
  String? get balanceValue => this.formValueMap[BalanceValueKey] as String?;
  String? get newBalanceValue =>
      this.formValueMap[NewBalanceValueKey] as String?;
  String? get colorValue => this.formValueMap[ColorValueKey] as String?;

  bool get hasAccountName => this.formValueMap.containsKey(AccountNameValueKey);
  bool get hasCurrency => this.formValueMap.containsKey(CurrencyValueKey);
  bool get hasBalance => this.formValueMap.containsKey(BalanceValueKey);
  bool get hasNewBalance => this.formValueMap.containsKey(NewBalanceValueKey);
  bool get hasColor => this.formValueMap.containsKey(ColorValueKey);

  bool get hasAccountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey]?.isNotEmpty ?? false;
  bool get hasCurrencyValidationMessage =>
      this.fieldsValidationMessages[CurrencyValueKey]?.isNotEmpty ?? false;
  bool get hasBalanceValidationMessage =>
      this.fieldsValidationMessages[BalanceValueKey]?.isNotEmpty ?? false;
  bool get hasNewBalanceValidationMessage =>
      this.fieldsValidationMessages[NewBalanceValueKey]?.isNotEmpty ?? false;
  bool get hasColorValidationMessage =>
      this.fieldsValidationMessages[ColorValueKey]?.isNotEmpty ?? false;

  String? get accountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey];
  String? get currencyValidationMessage =>
      this.fieldsValidationMessages[CurrencyValueKey];
  String? get balanceValidationMessage =>
      this.fieldsValidationMessages[BalanceValueKey];
  String? get newBalanceValidationMessage =>
      this.fieldsValidationMessages[NewBalanceValueKey];
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
  setNewBalanceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewBalanceValueKey] = validationMessage;
  setColorValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ColorValueKey] = validationMessage;
}
