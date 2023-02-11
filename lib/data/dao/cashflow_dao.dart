import 'package:isar/isar.dart';
import 'package:personal_finance_management_app/data/models/cashflow/cashflow.dart';

abstract class CashFlowDao {
  Future<CashFlow> createCashFlow(CashFlow cashFlow);
  Future<CashFlow?> getCashFlowById(Id id);
  Future<CashFlow> updateCashFlow(CashFlow cashFlow);
  Stream<CashFlow?> watchCashFlowById(Id id);
}
