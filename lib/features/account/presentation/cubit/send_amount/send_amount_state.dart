import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';

part 'send_amount_state.freezed.dart';

@freezed
class SendAmountState with _$SendAmountState {
  const factory SendAmountState({
    @Default(false) bool isLoading,
    DataEntity? sentAmount,
    Exception? error,
  }) = _SendAmountState;
}
