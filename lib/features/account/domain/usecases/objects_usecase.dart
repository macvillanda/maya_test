import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/core/helpers/use_case.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';

class ObjectsUseCase
    implements UseCase<Result<List<DataEntity>>, List<String>> {
  final ObjectsRepository _repository;

  ObjectsUseCase(this._repository);

  @override
  Future<Result<List<DataEntity>>> call(
      {List<String> params = const []}) async {
    try {
      final getObjects = await _repository.getObjects(params);

      return getObjects;
    } catch (e) {
      return Future.error(Error(exception: (e as Error).exception));
    }
  }
}
