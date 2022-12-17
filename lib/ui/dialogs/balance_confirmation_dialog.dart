import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/dialogs/balance_confirmation_viewmodel.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';
import 'package:stacked/stacked.dart';
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
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ViewModelBuilder<BalanceConfirmationViewModel>.reactive(
      viewModelBuilder: () => BalanceConfirmationViewModel(),
      builder: (context, model, child) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Balance has been changed. Would you like to record the changes (${request.data}) as a Transaction?",
                  ),
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildActionButton(
                        theme: customTheme,
                        label: "NO",
                        onTap: () => _handleAction(false),
                      ),
                      horizontalSpaceVeryTiny,
                      _buildActionButton(
                        theme: customTheme,
                        label: "YES",
                        onTap: () => _handleAction(true),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell _buildActionButton({
    required CustomTheme theme,
    required String label,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        padding: const EdgeInsets.all(8),
        child: Center(
          child: ThemeText.listItemSubTitle(
            label,
            color: theme.primaryAccent,
          ),
        ),
      ),
    );
  }
}
