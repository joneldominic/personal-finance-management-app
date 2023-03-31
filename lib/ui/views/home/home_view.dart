import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/cash_flow_card.dart';
import 'package:personal_finance_management_app/ui/views/transaction/recent_transactions/recent_transactions_view.dart';
import 'package:personal_finance_management_app/ui/views/account/accounts_card/accounts_card_view.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  static const snackBarDuration = Duration(seconds: 2);

  final snackBar = const SnackBar(
    content: Text(
      "Press Back again to quit the app",
      textAlign: TextAlign.center,
    ),
    duration: snackBarDuration,
  );

  DateTime backButtonPressTime = DateTime.utc(1989, DateTime.november, 9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () => handleWillPop(context),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  children: const [
                    AccountsCard(),
                    CashFlowCard(),
                    RecentTransactionsView(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

  Future<bool> handleWillPop(BuildContext context) async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        now.difference(backButtonPressTime) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }

    return true;
  }
}
