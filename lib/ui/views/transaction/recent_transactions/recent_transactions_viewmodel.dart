import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:personal_finance_management_app/data/models/transaction/transaction.dart';
import 'package:personal_finance_management_app/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _recentTransactionsStreamKey = 'recent-transactions-stream';

class RecentTransactionsViewModel extends MultipleStreamViewModel {
  final _logger = getLogger('TransactionListViewModel');
  final _navigationService = locator<NavigationService>();
  final _transactionService = locator<TransactionService>();

  void navigateToTransactionDetailEditMode(Transaction? transaction) {
    _logger.i('argument: NONE');

    _navigationService.navigateToTransactionDetailView(
      transaction: transaction,
    );
  }

  @override
  Map<String, StreamData> get streamsMap => {
        _recentTransactionsStreamKey:
            StreamData<List<Transaction>>(_transactionService.recentTransactionCollectionStream()),
      };

  bool get recentTransactionsReady => dataReady(_recentTransactionsStreamKey);
  List<Transaction> get recentTransactions => dataMap![_recentTransactionsStreamKey] ?? [];
}
