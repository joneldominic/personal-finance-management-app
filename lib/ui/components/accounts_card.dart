import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/account_thumbnail.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text(
              'Accounts',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              Icons.edit,
              size: 18,
              color: customTheme.primaryTextColor,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            childAspectRatio: 2.22,
            children: const <Widget>[
              AccountThumbnail(
                label: "Cash",
                amount: "PHP 1,500.00",
                color: Colors.red,
              ),
              AccountThumbnail(
                label: "BPI",
                amount: "PHP 2,000.00",
                color: Colors.amber,
              ),
              AccountThumbnail(
                label: "GCash",
                amount: "PHP 5,155.00",
                color: Colors.blue,
              ),
              AccountThumbnail(
                label: "CIMB",
                amount: "PHP 2,202.00",
                color: Colors.green,
              ),
              AccountThumbnail(
                label: "Dummy Account A",
                amount: "PHP 5,202.00",
                color: Colors.brown,
              ),
              AccountThumbnail(
                label: "Account B",
                amount: "PHP 5,202.00",
                color: Colors.deepPurple,
              ),
              AccountThumbnail(isAddAccount: true),
            ],
          ),
        ],
      ),
    );
  }
}
