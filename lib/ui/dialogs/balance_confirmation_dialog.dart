import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/ui/dialogs/base_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

class BalanceConfirmationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BalanceConfirmationDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  void _handleAction(value) => completer(
        DialogResponse(
          confirmed: value,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      content: Text(
        "Balance has been changed. Would you like to record the changes (${request.data}) as a Transaction?",
      ),
      optionALabel: "NO",
      onTapOptionA: () => _handleAction(false),
      optionBLabel: "YES",
      onTapOptionB: () => _handleAction(true),
    );
  }
}
