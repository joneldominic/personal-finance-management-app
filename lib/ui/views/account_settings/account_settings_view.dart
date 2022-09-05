import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: customTheme.appBarBackgroundColor,
        title: const Text("Account Settings"),
      ),
      body: const Text("Account Settings View"),
    );
  }
}
