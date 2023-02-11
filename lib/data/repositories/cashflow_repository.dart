import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/core/utils/app_constants.dart';
import 'package:personal_finance_management_app/data/dao/cashflow_dao.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';

class CashFlowRepository {
  final _logger = getLogger('CashFlowRepository');
  final CashFlowDao cashFlowDao;

  CashFlowRepository({required this.cashFlowDao});

  Future<CashFlow> initCashFlow() async {
    _logger.i('argument: NONE');

    final cashflow = CashFlow(id: CASH_FLOW_ID);
    return cashFlowDao.createCashFlow(cashflow);
  }

  Stream<CashFlow?> watchCashFlow() async* {
    _logger.i('argument: NONE');
    yield* cashFlowDao.watchCashFlowById(CASH_FLOW_ID);
  }
}
