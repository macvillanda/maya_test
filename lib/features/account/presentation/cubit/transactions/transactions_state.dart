import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maya_test/features/account/domain/entities/transaction_item_entity.dart';

part 'transactions_state.freezed.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState({
    @Default(false) bool isLoading,
    @Default([]) List<TransactionItemEntity> items,
    Exception? error,
  }) = _TransactionsState;
}
