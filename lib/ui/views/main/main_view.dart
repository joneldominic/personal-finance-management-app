import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/assets/custom_icons.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/ui/components/main_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/transaction_item.dart';
import 'package:personal_finance_management_app/ui/components/transactions.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    const int defaultViewIndex = 1;

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (model) => model.setIndex(defaultViewIndex),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: model.doSomething,
        ),
        appBar: const MainAppBar(),
        body: _getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: _getBottomNavItems(customTheme),
          currentIndex: model.currentIndex,
          selectedItemColor: customTheme.primaryAccent,
          unselectedItemColor: Colors.white,
          backgroundColor: customTheme.appBarBackgroundColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: model.setIndex,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _getBottomNavItems(CustomTheme customTheme) {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(CustomIcons.transactions, size: 18),
        label: 'Transactions',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
  }

  Widget _getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const Transactions();
      case 1:
        return const HomeView();
      case 2:
        return const Text(
          'Index 2: Settings',
        );
      default:
        throw NullThrownError();
    }
  }
}
