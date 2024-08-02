import 'package:bloc/bloc.dart';
import 'package:maya_test/constants/constants.dart';
import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/di.dart';
import 'package:maya_test/features/account/data/repositories/objects_respository_impl.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';
import 'package:maya_test/features/account/domain/usecases/objects_usecase.dart';
import 'package:maya_test/features/account/presentation/cubit/account/account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState());

  ObjectsRepository? _repository;
  UserAccount? _userAccount;

  void setDependecies(ObjectsRepository? repository, UserAccount? userAccount) {
    _repository = repository;
    _userAccount = userAccount;
  }

  Future<void> getAll() async {
    try {
      final userAcc = _userAccount ?? getIt<UserAccount>();

      if (userAcc.ids.isEmpty) {
        emit(state.copyWith(
          isLoading: false,
          error: null,
          currentBalance: initialAmount,
        ));
        return;
      }
      emit(state.copyWith(isLoading: true, currentBalance: 0));

      final result =
          await ObjectsUseCase(_repository ?? ObjectsRepositoryImpl()).call(
              params: userAcc.ids.isEmpty
                  ? ["9999"]
                  : userAcc
                      .ids); // just provide a number since an empty array would give the default api response
      if (result is Success) {
        final items = (result as Success<List<DataEntity>>).data;
        userAcc.setDataItems(items);
        final newBalance = userAcc.getCurrentBalance();
        emit(state.copyWith(
          isLoading: false,
          currentBalance: newBalance,
        ));
      } else {
        emit(state.copyWith(
            isLoading: false, error: (result as Error).exception));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: Exception(e.toString())));
    }
  }

  void toggleAmountVisibility() {
    emit(state.copyWith(isHidden: !state.isHidden));
  }
}
