import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/features/account/data/models/objects_model.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';

abstract class ObjectsRepository {
  Future<Result<List<DataEntity>>> getObjects(List<String> ids);
  Future<Result<DataEntity>> addObject(ObjectsModel item);
}
