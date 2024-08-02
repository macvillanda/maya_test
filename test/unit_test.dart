import 'package:flutter_test/flutter_test.dart';
import 'package:maya_test/constants/constants.dart';
import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/features/account/data/models/objects_model.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';
import 'package:maya_test/features/account/presentation/cubit/account/account.dart';
import 'package:maya_test/features/account/presentation/cubit/send_amount/send_amount.dart';
import 'package:maya_test/features/account/presentation/cubit/transactions/transactions_cubit.dart';

class ObjectsRepositoryTest implements ObjectsRepository {
  List<DataEntity> sampleItems = [];

  @override
  Future<Result<DataEntity>> addObject(ObjectsModel item) async {
    final newItem =
        DataEntity(amount: item.data.price, id: "", date: DateTime.now());
    return Success(data: newItem);
  }

  @override
  Future<Result<List<DataEntity>>> getObjects(List<String> ids) async {
    return Success(data: sampleItems);
  }
}

final UserAccount testAccount = UserAccount(data: []);

void main() {
  test("Test Full flow", () async {
    ObjectsRepositoryTest repository = ObjectsRepositoryTest();
    UserAccount userAccount = testAccount;
    userAccount.setDataItems(repository.sampleItems);
    AccountCubit cubit = AccountCubit();
    cubit.setDependecies(repository, userAccount);
    await cubit.getAll();
    expect(cubit.state.currentBalance, initialAmount);
    expect(cubit.state.isLoading, false);

    SendAmountCubit sendCubit = SendAmountCubit();
    sendCubit.setDependecies(repository, userAccount);
    await sendCubit.sendAmount(23.0);
    await cubit.getAll();
    expect(cubit.state.currentBalance, initialAmount - 23.0);

    await sendCubit.sendAmount(1000.0);
    // we should be showing an error here since the amount is greater than the current
    expect(sendCubit.state.error, isNotNull);
    // the amount should still be the same
    expect(cubit.state.currentBalance, initialAmount - 23.0);

    TransactionsCubit transCubit = TransactionsCubit();
    transCubit.setDependecies(userAccount);
    transCubit.getAll();
    expect(transCubit.state.items.length, 1);

    await sendCubit.sendAmount(100.0);
    await cubit.getAll();
    expect(cubit.state.currentBalance, initialAmount - 123.0);
  });
}
