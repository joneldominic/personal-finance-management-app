import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/data/dao/cashflow_dao_impl.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';
import 'package:personal_finance_management_app/data/repositories/cashflow_repository.dart';
import 'package:stacked/stacked.dart';

class CashFlowService with ReactiveServiceMixin {
  final _logger = getLogger('CashFlowService');
  final _cashFlowRepository = CashFlowRepository(cashFlowDao: CashFlowDaoImpl());

  Future<CashFlow> initCashFlow() async {
    _logger.i('argument: NONE');
    return _cashFlowRepository.initCashFlow();
  }

  Future<CashFlow> updateCashFlowDaysCount(CashFlow cashFlow) async {
    _logger.i('argument: $cashFlow');
    return _cashFlowRepository.updateCashFlowDaysCount(cashFlow);
  }

  Stream<CashFlow?> watchCashFlow() async* {
    _logger.i('argument: NONE');
    yield* _cashFlowRepository.watchCashFlow();
  }
}
