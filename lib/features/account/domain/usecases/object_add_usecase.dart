import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/core/helpers/use_case.dart';
import 'package:maya_test/features/account/data/models/objects_model.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';

class ObjectAddUseCase implements UseCase<Result<DataEntity>, ObjectsModel> {
  final ObjectsRepository _repository;

  ObjectAddUseCase(this._repository);

  @override
  Future<Result<DataEntity>> call({ObjectsModel? params}) async {
    if (params != null) {
      return await _repository.addObject(params);
    }

    return Error(exception: Exception("no parameters provided"));
  }
}
