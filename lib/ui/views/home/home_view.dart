import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/components/main_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: model.doSomething,
        ),
        appBar: const MainAppBar(),
        body: Center(
            child: Container(
          color: Color(0xff424242),
          height: 100,
          width: 100,
        )),
      ),
    );
  }
}
