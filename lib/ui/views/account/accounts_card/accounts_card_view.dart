import 'package:flutter/material.dart';
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

    final isSingleAccountSelected =
        mainViewModel.accounts.where((acc) => acc.isSelected!).length == 1;

    return ViewModelBuilder<AccountsCardViewModel>.reactive(
      viewModelBuilder: () => AccountsCardViewModel(),
      onModelReady: (model) {
        model.clearFilter();
      },
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
                  childAspectRatio: 2.01,
                ),
                itemCount: mainViewModel.accounts.length + 1,
                itemBuilder: (context, index) {
                  if (index > mainViewModel.accounts.length - 1) {
                    return AccountThumbnail(
                      isAddAccount: true,
                      onTap: model.navigateToAccountDetail,
                    );
                  }

                  final account = mainViewModel.accounts[index];
                  return AccountThumbnail(
                    account: account,
                    onTap: () => model.selectAccount(account),
                    onLongPress: () => model.multiSelectAccount(account),
                  );
                },
              ),
            ),
            if (model.isFiltered) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (isSingleAccountSelected) ...[
                          _buildTextButton(
                            theme: customTheme,
                            onTap: () => model.handUpdateBalance(),
                            title: 'UPDATE BALANCE',
                          ),
                        ],
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: _buildTextButton(
                              theme: customTheme,
                              onTap: () => model.clearFilter(),
                              title: 'CLEAR FILTER',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  InkWell _buildTextButton({
    required CustomTheme theme,
    required String title,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 8,
        ),
        child: ThemeText.listItemSubTitle(
          title,
          color: theme.primaryAccent,
        ),
      ),
    );
  }
}
