import '../../../app/setup_locator.dart';
import '../../../network_module/http_base.dart';

class AuthRepository {
  void addBearerToken(String token) {
    getIt.get<HttpBase>().setBearerToken(token);
  }
}
