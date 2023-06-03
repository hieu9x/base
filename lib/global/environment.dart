import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get authUrl {
    return dotenv.get('AUTH_URL');
  }

  static String get baseUrl {
    return dotenv.get('BASE_URL');
  }

  static String get baseUpload {
    return dotenv.get('BASE_UPLOAD');
  }

  static String get apiUpload {
    return dotenv.get('API_UPLOAD');
  }

  static String get clientId {
    return dotenv.get('CLIENT_ID');
  }

  static String get clientSecret {
    return dotenv.get('CLIENT_SECRET');
  }
}

extension EnvExt on String {
  String get fileName {
    if (this == 'DEV') {
      // environment for dev
      return '.env';
    }
    return '.env.prod';
  }
}
