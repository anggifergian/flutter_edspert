import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env";
  static String get apiUrl => dotenv.env['API_URL']!;
  static String get jsonPlaceHolderUrl => dotenv.env['JPH_URL']!;
  static String get itBookApi => dotenv.env['ITBOOK_API']!;
}
