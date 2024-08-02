import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:maya_test/core/helpers/double_formatter.dart';
import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/di.dart';
import 'package:maya_test/features/account/data/models/objects_model.dart';
import 'package:maya_test/features/account/data/repositories/objects_respository_impl.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';
import 'package:maya_test/features/account/domain/usecases/object_add_usecase.dart';
import 'package:maya_test/features/account/presentation/cubit/send_amount/send_amount_state.dart';

class SendAmountCubit extends Cubit<SendAmountState> {
  SendAmountCubit() : super(const SendAmountState());

  ObjectsRepository? _repository;
  UserAccount? _userAccount;

  void setDependecies(ObjectsRepository? repository, UserAccount? userAccount) {
    _repository = repository;
    _userAccount = userAccount;
  }

  Future<void> sendAmount(double amount) async {
    emit(state.copyWith(isLoading: true, sentAmount: null, error: null));
    try {
      final userAcc = _userAccount ?? getIt<UserAccount>();

      if (amount > userAcc.getCurrentBalance()) {
        emit(state.copyWith(
            isLoading: false,
            error: Exception(
                "Insufficient funds ${userAcc.getCurrentBalance().currencyFormatted()}"),
            sentAmount: null));
        return;
      }

      final item = ObjectsModel(
        id: "",
        name: "mayatest",
        data: ObjectsData(
          date: DateFormat('MM-dd-yyyy').format(DateTime.now()),
          price: amount,
          type: 1,
        ),
      );
      final result =
          await ObjectAddUseCase(_repository ?? ObjectsRepositoryImpl())
              .call(params: item);

      if (result is Success) {
        final resultData = (result as Success<DataEntity>).data;
        userAcc.addItem(resultData);
        emit(state.copyWith(
            isLoading: false, error: null, sentAmount: resultData));
      } else {
        emit(state.copyWith(
            isLoading: false,
            error: (result as Error).exception,
            sentAmount: null));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        sentAmount: null,
        error: Exception(e.toString()),
      ));
    }
  }
}
