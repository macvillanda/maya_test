import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maya_test/constants/constants.dart';
import 'package:maya_test/core/helpers/result.dart';
import 'package:maya_test/features/account/data/models/objects_model.dart';

class ObjectsServiceApi {
  final Dio _dio;

  ObjectsServiceApi(this._dio);

  Future<Result<List<ObjectsModel>>> getObjects(List<String> ids) async {
    const String url = "$appBaseURL/objects";
    try {
      final response = await _dio.get(url, queryParameters: {"id": ids});
      if (response.statusCode == 200) {
        final list = response.data;
        if (list is List) {
          final objects = list.map((e) => ObjectsModel.fromJson(e));
          return Success(data: objects.toList());
        }
        return const Success(data: []);
      } else {
        return Error(exception: Exception(response.data.toString()));
      }
    } on Exception catch (error) {
      if (error is DioException) {
        final message = error.response?.data["error"];
        if (message != null) {
          return Error(exception: Exception(message));
        }
      }
      return Error(exception: error);
    }
  }

  Future<Result<ObjectsModel>> addObject(ObjectsModel item) async {
    const String url = "$appBaseURL/objects";
    try {
      final response = await _dio.post(url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: item.toJson());
      if (response.statusCode == 200) {
        return Success(data: ObjectsModel.fromJson(response.data));
      } else {
        return Error(exception: Exception(response.data.toString()));
      }
    } on Exception catch (error) {
      if (error is DioException) {
        final message = error.response?.data["error"];
        if (message != null) {
          return Error(exception: Exception(message));
        }
      }

      return Error(exception: error);
    }
  }
}
