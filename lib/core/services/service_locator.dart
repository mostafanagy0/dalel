import 'package:dalel/core/database/cashe/cash_helper.dart';
import 'package:dalel/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
