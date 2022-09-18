import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_management_app/core/enums/category_nature.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key? key,
    required this.categoryName,
    required this.color,
    required this.categoryNature,
    required this.onPressed,
  }) : super(key: key);

  final String categoryName;
  final Color color;
  final CategoryNature categoryNature;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: color,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            toBeginningOfSentenceCase(
              EnumToString.convertToString(categoryNature),
            )!,
            style: TextStyle(
              fontSize: 12,
              color: customTheme.customLightGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit_rounded,
          color: customTheme.actionButtonColor,
        ),
        iconSize: 20,
        onPressed: onPressed,
      ),
    );
  }
}