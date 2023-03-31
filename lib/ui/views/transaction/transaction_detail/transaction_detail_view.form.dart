// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AccountIdValueKey = 'accountId';
const String DestinationAccountIdValueKey = 'destinationAccountId';
const String TransactionTypeValueKey = 'transactionType';
const String AmountValueKey = 'amount';
const String CategoryIdValueKey = 'categoryId';
const String NotesValueKey = 'notes';

final Map<String, String> AccountIdValueToTitleMap = {};
final Map<String, String> DestinationAccountIdValueToTitleMap = {};
final Map<String, String> TransactionTypeValueToTitleMap = {
  'income': 'Income',
  'expense': 'Expense',
  'transfer': 'Transfer',
};
final Map<String, String> CategoryIdValueToTitleMap = {};

final Map<String, TextEditingController>
    _TransactionDetailViewTextEditingControllers = {};

final Map<String, FocusNode> _TransactionDetailViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _TransactionDetailViewTextValidations = {
  AmountValueKey: null,
  NotesValueKey: null,
};

mixin $TransactionDetailView on StatelessWidget {
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);
  TextEditingController get notesController =>
      _getFormTextEditingController(NotesValueKey);
  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);
  FocusNode get notesFocusNode => _getFormFocusNode(NotesValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_TransactionDetailViewTextEditingControllers.containsKey(key)) {
      return _TransactionDetailViewTextEditingControllers[key]!;
    }
    _TransactionDetailViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TransactionDetailViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TransactionDetailViewFocusNodes.containsKey(key)) {
      return _TransactionDetailViewFocusNodes[key]!;
    }
    _TransactionDetailViewFocusNodes[key] = FocusNode();
    return _TransactionDetailViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
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
        AmountValueKey: _getValidationMessage(AmountValueKey),
        NotesValueKey: _getValidationMessage(NotesValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _TransactionDetailViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _TransactionDetailViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _TransactionDetailViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TransactionDetailViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TransactionDetailViewTextEditingControllers.clear();
    _TransactionDetailViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get accountIdValue => this.formValueMap[AccountIdValueKey] as String?;
  String? get destinationAccountIdValue =>
      this.formValueMap[DestinationAccountIdValueKey] as String?;
  String? get transactionTypeValue =>
      this.formValueMap[TransactionTypeValueKey] as String?;
  String? get amountValue => this.formValueMap[AmountValueKey] as String?;
  String? get categoryIdValue =>
      this.formValueMap[CategoryIdValueKey] as String?;
  String? get notesValue => this.formValueMap[NotesValueKey] as String?;

  bool get hasAccountId => this.formValueMap.containsKey(AccountIdValueKey);
  bool get hasDestinationAccountId =>
      this.formValueMap.containsKey(DestinationAccountIdValueKey);
  bool get hasTransactionType =>
      this.formValueMap.containsKey(TransactionTypeValueKey);
  bool get hasAmount => this.formValueMap.containsKey(AmountValueKey);
  bool get hasCategoryId => this.formValueMap.containsKey(CategoryIdValueKey);
  bool get hasNotes => this.formValueMap.containsKey(NotesValueKey);

  bool get hasAccountIdValidationMessage =>
      this.fieldsValidationMessages[AccountIdValueKey]?.isNotEmpty ?? false;
  bool get hasDestinationAccountIdValidationMessage =>
      this.fieldsValidationMessages[DestinationAccountIdValueKey]?.isNotEmpty ??
      false;
  bool get hasTransactionTypeValidationMessage =>
      this.fieldsValidationMessages[TransactionTypeValueKey]?.isNotEmpty ??
      false;
  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;
  bool get hasCategoryIdValidationMessage =>
      this.fieldsValidationMessages[CategoryIdValueKey]?.isNotEmpty ?? false;
  bool get hasNotesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey]?.isNotEmpty ?? false;

  String? get accountIdValidationMessage =>
      this.fieldsValidationMessages[AccountIdValueKey];
  String? get destinationAccountIdValidationMessage =>
      this.fieldsValidationMessages[DestinationAccountIdValueKey];
  String? get transactionTypeValidationMessage =>
      this.fieldsValidationMessages[TransactionTypeValueKey];
  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
  String? get categoryIdValidationMessage =>
      this.fieldsValidationMessages[CategoryIdValueKey];
  String? get notesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey];
}

extension Methods on FormViewModel {
  void setAccountId(String accountId) {
    this.setData(this.formValueMap..addAll({AccountIdValueKey: accountId}));
  }

  void setDestinationAccountId(String destinationAccountId) {
    this.setData(this.formValueMap
      ..addAll({DestinationAccountIdValueKey: destinationAccountId}));
  }

  void setTransactionType(String transactionType) {
    this.setData(
        this.formValueMap..addAll({TransactionTypeValueKey: transactionType}));
  }

  void setCategoryId(String categoryId) {
    this.setData(this.formValueMap..addAll({CategoryIdValueKey: categoryId}));
  }

  setAccountIdValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountIdValueKey] = validationMessage;
  setDestinationAccountIdValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DestinationAccountIdValueKey] =
          validationMessage;
  setTransactionTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TransactionTypeValueKey] =
          validationMessage;
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;
  setCategoryIdValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryIdValueKey] = validationMessage;
  setNotesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NotesValueKey] = validationMessage;
}
