// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CategoryNameValueKey = 'categoryName';
const String CategoryNatureValueKey = 'categoryNature';

final Map<String, String> CategoryNatureValueToTitleMap = {
  'none': 'None',
  'need': 'Need',
  'want': 'Want',
};

final Map<String, TextEditingController>
    _CategoryDetailViewTextEditingControllers = {};

final Map<String, FocusNode> _CategoryDetailViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CategoryDetailViewTextValidations = {
  CategoryNameValueKey: null,
};

mixin $CategoryDetailView on StatelessWidget {
  TextEditingController get categoryNameController =>
      _getFormTextEditingController(CategoryNameValueKey);
  FocusNode get categoryNameFocusNode =>
      _getFormFocusNode(CategoryNameValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CategoryDetailViewTextEditingControllers.containsKey(key)) {
      return _CategoryDetailViewTextEditingControllers[key]!;
    }
    _CategoryDetailViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CategoryDetailViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CategoryDetailViewFocusNodes.containsKey(key)) {
      return _CategoryDetailViewFocusNodes[key]!;
    }
    _CategoryDetailViewFocusNodes[key] = FocusNode();
    return _CategoryDetailViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    categoryNameController.addListener(() => _updateFormData(model));
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
          CategoryNameValueKey: categoryNameController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        CategoryNameValueKey: _getValidationMessage(CategoryNameValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CategoryDetailViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_CategoryDetailViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CategoryDetailViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CategoryDetailViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CategoryDetailViewTextEditingControllers.clear();
    _CategoryDetailViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get categoryNameValue =>
      this.formValueMap[CategoryNameValueKey] as String?;
  String? get categoryNatureValue =>
      this.formValueMap[CategoryNatureValueKey] as String?;

  bool get hasCategoryName =>
      this.formValueMap.containsKey(CategoryNameValueKey);
  bool get hasCategoryNature =>
      this.formValueMap.containsKey(CategoryNatureValueKey);

  bool get hasCategoryNameValidationMessage =>
      this.fieldsValidationMessages[CategoryNameValueKey]?.isNotEmpty ?? false;
  bool get hasCategoryNatureValidationMessage =>
      this.fieldsValidationMessages[CategoryNatureValueKey]?.isNotEmpty ??
      false;

  String? get categoryNameValidationMessage =>
      this.fieldsValidationMessages[CategoryNameValueKey];
  String? get categoryNatureValidationMessage =>
      this.fieldsValidationMessages[CategoryNatureValueKey];
}

extension Methods on FormViewModel {
  void setCategoryNature(String categoryNature) {
    this.setData(
        this.formValueMap..addAll({CategoryNatureValueKey: categoryNature}));
  }

  setCategoryNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryNameValueKey] = validationMessage;
  setCategoryNatureValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryNatureValueKey] = validationMessage;
}
