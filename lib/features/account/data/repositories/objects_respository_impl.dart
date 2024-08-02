import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/di.dart';
import 'package:maya_test/features/account/data/datasources/remote/objects_service_api.dart';
import 'package:maya_test/features/account/data/models/objects_model.dart';
import 'package:maya_test/features/account/domain/entities/data_entity.dart';
import 'package:maya_test/features/account/domain/repositories/objects_repository.dart';

class ObjectsRepositoryImpl implements ObjectsRepository {
  final apiService = ObjectsServiceApi(getIt<Dio>());
  final dateFormat = DateFormat("MM-dd-yyyy");
  @override
  Future<Result<List<DataEntity>>> getObjects(List<String> ids) async {
    final result = await apiService.getObjects(ids);
    if (result is Success<List<ObjectsModel>>) {
      final dataList = result.data;

      final resultData = dataList.map((data) {
        final objectDate = dateFormat.parse(data.data.date);
        return DataEntity(
          id: data.id,
          amount: data.data.price,
          date: objectDate,
        );
      });
      return Success(data: resultData.toList());
    }
    return Error(exception: (result as Error).exception);
  }

  @override
  Future<Result<DataEntity>> addObject(ObjectsModel item) async {
    final result = await apiService.addObject(item);
    if (result is Success<ObjectsModel>) {
      final objectDate = dateFormat.parse(result.data.data.date);
      final entity = DataEntity(
        id: result.data.id,
        amount: result.data.data.price,
        date: objectDate,
      );
      return Success(data: entity);
    }
    return Error(exception: (result as Error).exception);
  }
}
