import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/account_thumbnail.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:personal_finance_management_app/ui/views/account/accounts_card/accounts_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<AccountsCardViewModel>.nonReactive(
      viewModelBuilder: () => AccountsCardViewModel(),
      builder: (context, model, child) => Card(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              title: const ThemeText.cardTitle("Accounts"),
              trailing: IconButton(
                icon: Icon(
                  Icons.settings_rounded,
                  color: customTheme.actionButtonColor,
                ),
                iconSize: 20,
                onPressed: model.navigateToAccountSettings,
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
              children: <Widget>[
                const AccountThumbnail(
                  label: "Cash",
                  amount: "PHP 1,500.00",
                  color: Colors.red,
                ),
                const AccountThumbnail(
                  label: "BPI",
                  amount: "PHP 2,000.00",
                  color: Colors.amber,
                ),
                const AccountThumbnail(
                  label: "GCash",
                  amount: "PHP 5,155.00",
                  color: Colors.blue,
                ),
                const AccountThumbnail(
                  label: "CIMB",
                  amount: "PHP 2,202.00",
                  color: Colors.green,
                ),
                const AccountThumbnail(
                  label: "Dummy Account A",
                  amount: "PHP 5,202.00",
                  color: Colors.brown,
                ),
                const AccountThumbnail(
                  label: "Account B",
                  amount: "PHP 5,202.00",
                  color: Colors.deepPurple,
                ),
                GestureDetector(
                  onTap: model.navigateToAccountDetail,
                  child: const AccountThumbnail(isAddAccount: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
