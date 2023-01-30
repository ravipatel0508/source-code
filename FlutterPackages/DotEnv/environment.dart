import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  //load environment variables
  Future<void> init() async {
    String envFileName = '.env';
    await dotenv.load(fileName: envFileName);
  }

  // function to get data
  static String getEnv(String key) => dotenv.env[key].toString();

  // Direct access to the environment variables
  static String get baseUrl => getEnv('BASE_URL');
}
