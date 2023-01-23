// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String CategoryNameValueKey = 'categoryName';
const String CategoryNatureValueKey = 'categoryNature';
const String ColorValueKey = 'color';

final Map<String, String> CategoryNatureValueToTitleMap = {
  'none': 'None',
  'need': 'Need',
  'want': 'Want',
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

final Map<String, TextEditingController> _CategoryDetailViewTextEditingControllers = {};

final Map<String, FocusNode> _CategoryDetailViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CategoryDetailViewTextValidations = {
  CategoryNameValueKey: null,
};

mixin $CategoryDetailView on StatelessWidget {
  TextEditingController get categoryNameController =>
      _getFormTextEditingController(CategoryNameValueKey);
  FocusNode get categoryNameFocusNode => _getFormFocusNode(CategoryNameValueKey);

  TextEditingController _getFormTextEditingController(String key, {String? initialValue}) {
    if (_CategoryDetailViewTextEditingControllers.containsKey(key)) {
      return _CategoryDetailViewTextEditingControllers[key]!;
    }
    _CategoryDetailViewTextEditingControllers[key] = TextEditingController(text: initialValue);
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
  void _updateValidationData(FormViewModel model) => model.setValidationMessages({
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
  bool get isFormValid => this.fieldsValidationMessages.values.every((element) => element == null);
  String? get categoryNameValue => this.formValueMap[CategoryNameValueKey] as String?;
  String? get categoryNatureValue => this.formValueMap[CategoryNatureValueKey] as String?;
  String? get colorValue => this.formValueMap[ColorValueKey] as String?;

  bool get hasCategoryName => this.formValueMap.containsKey(CategoryNameValueKey);
  bool get hasCategoryNature => this.formValueMap.containsKey(CategoryNatureValueKey);
  bool get hasColor => this.formValueMap.containsKey(ColorValueKey);

  bool get hasCategoryNameValidationMessage =>
      this.fieldsValidationMessages[CategoryNameValueKey]?.isNotEmpty ?? false;
  bool get hasCategoryNatureValidationMessage =>
      this.fieldsValidationMessages[CategoryNatureValueKey]?.isNotEmpty ?? false;
  bool get hasColorValidationMessage =>
      this.fieldsValidationMessages[ColorValueKey]?.isNotEmpty ?? false;

  String? get categoryNameValidationMessage => this.fieldsValidationMessages[CategoryNameValueKey];
  String? get categoryNatureValidationMessage =>
      this.fieldsValidationMessages[CategoryNatureValueKey];
  String? get colorValidationMessage => this.fieldsValidationMessages[ColorValueKey];
}

extension Methods on FormViewModel {
  void setCategoryNature(String categoryNature) {
    this.setData(this.formValueMap..addAll({CategoryNatureValueKey: categoryNature}));
  }

  void setColor(String color) {
    this.setData(this.formValueMap..addAll({ColorValueKey: color}));
  }

  setCategoryNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryNameValueKey] = validationMessage;
  setCategoryNatureValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryNatureValueKey] = validationMessage;
  setColorValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ColorValueKey] = validationMessage;
}
