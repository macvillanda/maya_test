import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:maya_test/di.dart';
import 'package:maya_test/features/account/domain/entities/transaction_item_entity.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';
import 'package:maya_test/features/account/presentation/cubit/transactions/transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(const TransactionsState());

  UserAccount? _userAccount;

  void setDependecies(UserAccount? userAccount) {
    _userAccount = userAccount;
  }

  void getAll() {
    final user = _userAccount ?? getIt<UserAccount>();
    DateFormat formatter = DateFormat("MMMM dd yyyy");

    final allItems = user.data.map((item) {
      final dateString = formatter.format(item.date);
      return TransactionItemEntity(date: dateString, amount: item.amount);
    }).toList();

    emit(state.copyWith(items: allItems));
  }
}
