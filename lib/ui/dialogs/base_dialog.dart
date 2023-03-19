import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class BaseDialog extends StatelessWidget {
  final Widget content;
  final String optionALabel;
  final Function() onTapOptionA;
  final String optionBLabel;
  final Function() onTapOptionB;

  const BaseDialog({
    Key? key,
    required this.content,
    required this.optionALabel,
    required this.onTapOptionA,
    required this.optionBLabel,
    required this.onTapOptionB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                content,
                verticalSpaceRegular,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildActionButton(
                      theme: customTheme,
                      label: optionALabel,
                      onTap: () => onTapOptionA(),
                    ),
                    horizontalSpaceVeryTiny,
                    _buildActionButton(
                      theme: customTheme,
                      label: optionBLabel,
                      onTap: () => onTapOptionB(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _buildActionButton({
    required CustomTheme theme,
    required String label,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: ThemeText.listItemSubTitle(
            label,
            color: theme.primaryAccent,
          ),
        ),
      ),
    );
  }
}
