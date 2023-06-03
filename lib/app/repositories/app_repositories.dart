import 'package:base/app/models/general_model.dart';

import '../../global/constant/constants.dart';
import '../../network_module/http_base.dart';
import '../setup_locator.dart';

class AppRepositories {
  Future<ResultModel> updateDevice(
      {required String deviceId, required String fcmToken, required String appVersion}) async {
    try {
      final body = {"notify_token": fcmToken, "app_version": appVersion};
      dynamic data = await getIt<HttpBase>().patchData('${ApiPath.profileDeviceMe}/$deviceId', body);
      return ResultModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
