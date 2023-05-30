import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';
import 'package:personal_finance_management_app/services/cashflow_service.dart';
import 'package:stacked/stacked.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services

class CashFlowCardViewModel extends StreamViewModel<CashFlow?> {
  final _logger = getLogger('CashFlowCardViewModel');
  final _cashFlowService = locator<CashFlowService>();

  CashFlow cashFlow = CashFlow(id: CASH_FLOW_ID);

  @override
  Stream<CashFlow?> get stream => _cashFlowService.watchCashFlow();

  @override
  void onData(CashFlow? data) {
    _logger.i('argument: ${data.toString()}');
    cashFlow = data ?? CashFlow(id: CASH_FLOW_ID);
    notifyListeners();
  }
}
