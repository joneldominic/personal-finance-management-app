import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/services/account_service.dart';
import 'package:stacked/stacked.dart';

const String _accountBalanceStreamKey = 'account-balance-stream';
// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class HomeAppBarViewModel extends MultipleStreamViewModel {
  final _logger = getLogger('HomeAppBarViewModel');
  final _accountService = locator<AccountService>();

  @override
  Map<String, StreamData> get streamsMap => {
        _accountBalanceStreamKey: StreamData<double>(_accountService.accountBalanceStream()),
      };

  bool get accountBalanceReady => dataReady(_accountBalanceStreamKey);
  double get accountBalance => dataMap![_accountBalanceStreamKey] ?? 0;
}
