// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AccountNameValueKey = 'accountName';
const String TransactionTypeValueKey = 'transactionType';
const String AmountValueKey = 'amount';
const String CategoryValueKey = 'category';
const String NotesValueKey = 'notes';

final Map<String, String> TransactionTypeValueToTitleMap = {
  'income': 'Income',
  'expense': 'Expense',
  'transfer': 'Transfer',
};
final Map<String, String> CategoryValueToTitleMap = {};

final Map<String, TextEditingController>
    _TransactionDetailsViewTextEditingControllers = {};

final Map<String, FocusNode> _TransactionDetailsViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _TransactionDetailsViewTextValidations = {
  AccountNameValueKey: null,
  AmountValueKey: null,
  NotesValueKey: null,
};

mixin $TransactionDetailsView on StatelessWidget {
  TextEditingController get accountNameController =>
      _getFormTextEditingController(AccountNameValueKey);
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);
  TextEditingController get notesController =>
      _getFormTextEditingController(NotesValueKey);
  FocusNode get accountNameFocusNode => _getFormFocusNode(AccountNameValueKey);
  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);
  FocusNode get notesFocusNode => _getFormFocusNode(NotesValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_TransactionDetailsViewTextEditingControllers.containsKey(key)) {
      return _TransactionDetailsViewTextEditingControllers[key]!;
    }
    _TransactionDetailsViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TransactionDetailsViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TransactionDetailsViewFocusNodes.containsKey(key)) {
      return _TransactionDetailsViewFocusNodes[key]!;
    }
    _TransactionDetailsViewFocusNodes[key] = FocusNode();
    return _TransactionDetailsViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    accountNameController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));
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
          AmountValueKey: amountController.text,
          NotesValueKey: notesController.text,
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
        AmountValueKey: _getValidationMessage(AmountValueKey),
        NotesValueKey: _getValidationMessage(NotesValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _TransactionDetailsViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _TransactionDetailsViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _TransactionDetailsViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TransactionDetailsViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TransactionDetailsViewTextEditingControllers.clear();
    _TransactionDetailsViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get accountNameValue =>
      this.formValueMap[AccountNameValueKey] as String?;
  String? get transactionTypeValue =>
      this.formValueMap[TransactionTypeValueKey] as String?;
  String? get amountValue => this.formValueMap[AmountValueKey] as String?;
  String? get categoryValue => this.formValueMap[CategoryValueKey] as String?;
  String? get notesValue => this.formValueMap[NotesValueKey] as String?;

  bool get hasAccountName => this.formValueMap.containsKey(AccountNameValueKey);
  bool get hasTransactionType =>
      this.formValueMap.containsKey(TransactionTypeValueKey);
  bool get hasAmount => this.formValueMap.containsKey(AmountValueKey);
  bool get hasCategory => this.formValueMap.containsKey(CategoryValueKey);
  bool get hasNotes => this.formValueMap.containsKey(NotesValueKey);

  bool get hasAccountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey]?.isNotEmpty ?? false;
  bool get hasTransactionTypeValidationMessage =>
      this.fieldsValidationMessages[TransactionTypeValueKey]?.isNotEmpty ??
      false;
  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;
  bool get hasCategoryValidationMessage =>
      this.fieldsValidationMessages[CategoryValueKey]?.isNotEmpty ?? false;
  bool get hasNotesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey]?.isNotEmpty ?? false;

  String? get accountNameValidationMessage =>
      this.fieldsValidationMessages[AccountNameValueKey];
  String? get transactionTypeValidationMessage =>
      this.fieldsValidationMessages[TransactionTypeValueKey];
  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
  String? get categoryValidationMessage =>
      this.fieldsValidationMessages[CategoryValueKey];
  String? get notesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey];
}

extension Methods on FormViewModel {
  void setTransactionType(String transactionType) {
    this.setData(
        this.formValueMap..addAll({TransactionTypeValueKey: transactionType}));
  }

  void setCategory(String category) {
    this.setData(this.formValueMap..addAll({CategoryValueKey: category}));
  }

  setAccountNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountNameValueKey] = validationMessage;
  setTransactionTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TransactionTypeValueKey] =
          validationMessage;
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;
  setCategoryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryValueKey] = validationMessage;
  setNotesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NotesValueKey] = validationMessage;
}