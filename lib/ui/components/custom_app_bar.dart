import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
  }) : super(key: key);

  final Widget? title;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: customTheme.appBarBackgroundColor,
      title: title,
      leading: leading,
      actions: actions,
    );
  }
}
