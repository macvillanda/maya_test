import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maya_test/features/account/domain/entities/user_account.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<UserAccount>(UserAccount(data: []));
}
