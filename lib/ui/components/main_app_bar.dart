import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: customTheme.appBarBackgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "PHP 160,120.00",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Overall Balance",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person_rounded),
          tooltip: 'Go to Profile',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Should go to Profile Screen'),
              ),
            );
          },
        ),
      ],
    );
  }
}
