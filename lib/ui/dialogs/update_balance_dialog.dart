import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/currency_formatter.dart';
import 'package:personal_finance_management_app/core/utils/string_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/data/models/account/account.dart';
import 'package:personal_finance_management_app/ui/dialogs/base_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

class UpdateBalanceDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  final TextEditingController _balanceController = TextEditingController();
  final FocusNode _balanceFieldFocusNode = FocusNode();

  UpdateBalanceDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  void _handleAction({required value, data}) => completer(
        DialogResponse(
          confirmed: value,
          data: data,
        ),
      );

  @override
  Widget build(BuildContext context) {
    Account account = request.data;

    final symbol = account.currency ?? "₱";
    final currencyInputFormatter = CurrencyInputFormatter(symbol: symbol);
    final balance = doubleToCurrencyFormatter(
      currency: symbol,
      value: account.balance!,
    );

    _balanceController.text = "$symbol 0.00";
    _balanceFieldFocusNode.requestFocus();

    return BaseDialog(
      content: Column(
        children: [
          Row(
            children: [
              Text("Update ${account.name} Balance"),
            ],
          ),
          verticalSpaceSmallPlus,
          TextField(
            decoration: InputDecoration(
              labelText: "New account balance",
              helperText: "Previous Balance: $balance",
            ),
            controller: _balanceController,
            keyboardType: TextInputType.number,
            inputFormatters: [currencyInputFormatter],
            focusNode: _balanceFieldFocusNode,
          ),
        ],
      ),
      optionALabel: "CANCEL",
      onTapOptionA: () => _handleAction(value: false),
      optionBLabel: "CONFIRM",
      onTapOptionB: () => _handleAction(
        value: true,
        data: parseAmountStringToDouble(_balanceController.text),
      ),
    );
  }
}
