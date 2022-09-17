import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/ui/components/transaction_list_item.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_list/transaction_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final List<String> descriptions = <String>[
      'Birthday',
      'Badminton Tournament Registration',
      'FullScale Salary',
      'Grocery',
      'Birthday',
      'Badminton Tournament Registration',
      'FullScale Salary',
      'Grocery',
      'Birthday',
      'Badminton Tournament Registration',
      'FullScale Salary',
      'Grocery',
    ];

    final List<String> accountNames = <String>[
      'Cash',
      'Cash',
      'BPI',
      'Cash',
      'Cash',
      'Cash',
      'BPI',
      'Cash',
      'Cash',
      'Cash',
      'BPI',
      'Cash',
    ];

    final List<String> amounts = <String>[
      '"PHP 5,000.00"',
      '"PHP 800.00"',
      '"PHP 60,000.00"',
      '"PHP 2,000.00"',
      '"PHP 5,000.00"',
      '"PHP 800.00"',
      '"PHP 60,000.00"',
      '"PHP 2,000.00"',
      '"PHP 5,000.00"',
      '"PHP 800.00"',
      '"PHP 60,000.00"',
      '"PHP 2,000.00"',
    ];

    final List<TransactionType> transactionTypes = <TransactionType>[
      TransactionType.expense,
      TransactionType.expense,
      TransactionType.income,
      TransactionType.expense,
      TransactionType.expense,
      TransactionType.expense,
      TransactionType.income,
      TransactionType.expense,
      TransactionType.expense,
      TransactionType.expense,
      TransactionType.income,
      TransactionType.expense,
    ];

    final List<String> timeStamps = <String>[
      "Today",
      "Sept. 2, 2022",
      "Aug. 30, 2022",
      "Aug. 24, 2022",
      "Today",
      "Sept. 2, 2022",
      "Aug. 30, 2022",
      "Aug. 24, 2022",
      "Today",
      "Sept. 2, 2022",
      "Aug. 30, 2022",
      "Aug. 24, 2022",
    ];

    return ViewModelBuilder<TransactionListViewModel>.nonReactive(
      viewModelBuilder: () => TransactionListViewModel(),
      builder: (context, model, child) => Container(
        color: customTheme.contrastBackgroundColor,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 90),
          physics: const BouncingScrollPhysics(),
          itemCount: descriptions.length,
          itemBuilder: (BuildContext context, int index) {
            return TransactionListItem(
              description: descriptions[index],
              accountName: accountNames[index],
              amount: amounts[index],
              transactionType: transactionTypes[index],
              timeStamp: timeStamps[index],
              onTap: model.navigateToTransactionDetailEditMode,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
