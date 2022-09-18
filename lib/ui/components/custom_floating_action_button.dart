import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return FloatingActionButton.extended(
      icon: icon,
      label: Text(label),
      backgroundColor: customTheme.primaryAccent,
      foregroundColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
