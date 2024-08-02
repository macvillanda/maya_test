import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default(false) bool isLoading,
    @Default(0.0) double currentBalance,
    @Default(false) bool isHidden,
    Exception? error,
  }) = _AccountState;
}
