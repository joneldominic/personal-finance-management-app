import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/ui/components/account_thumbnail.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:personal_finance_management_app/ui/views/account/accounts_card/accounts_card_viewmodel.dart';
import 'package:personal_finance_management_app/ui/views/main/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;
    final mainViewModel = getParentViewModel<MainViewModel>(context);

    return ViewModelBuilder<AccountsCardViewModel>.reactive(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.22,
                ),
                itemCount: mainViewModel.accounts.length + 1,
                itemBuilder: (context, index) {
                  if (index > mainViewModel.accounts.length - 1) {
                    return GestureDetector(
                      onTap: model.navigateToAccountDetail,
                      child: const AccountThumbnail(isAddAccount: true),
                    );
                  }

                  return AccountThumbnail(
                    label: mainViewModel.accounts[index].name,
                    amount: doubleToCurrencyFormatter(
                      currency: mainViewModel.accounts[index].currency ?? "PHP",
                      value: mainViewModel.accounts[index].balance!,
                    ),
                    color: Color(
                      int.parse(
                        mainViewModel.accounts[index].color!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
