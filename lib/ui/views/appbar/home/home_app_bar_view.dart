import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/views/appbar/home/home_app_bar_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeAppBarView extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeAppBarViewModel>.reactive(
        viewModelBuilder: () => HomeAppBarViewModel(),
        builder: (context, model, child) {
          return CustomAppBar(
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doubleToCurrencyFormatter(
                    currency: "₱",
                    value: model.accountBalance,
                  ),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.person_rounded),
                tooltip: 'Go to Profile',
                onPressed: () {},
              ),
            ],
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
