import 'package:dalel/core/database/cashe/cash_helper.dart';
import 'package:dalel/core/services/service_locator.dart';

void onBordingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnBordingVisited", value: true);
}
