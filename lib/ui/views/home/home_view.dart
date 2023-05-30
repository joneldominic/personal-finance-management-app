import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/views/cashflow_card/cash_flow_card_view.dart';
import 'package:personal_finance_management_app/ui/views/transaction/recent_transactions/recent_transactions_view.dart';
import 'package:personal_finance_management_app/ui/views/account/accounts_card/accounts_card_view.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: const [
            AccountsCard(),
            CashFlowCardView(),
            RecentTransactionsView(),
          ],
        ),
      ),
    );
  }
}
