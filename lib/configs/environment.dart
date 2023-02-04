import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.production" : ".env";
  static String get jsonPlaceHolderUrl => dotenv.env['JPH_URL']!;
  static String get itBookApi => dotenv.env['ITBOOK_API']!;
  static String get edspertApi => dotenv.env['EDSPERT_API']!;
  static String get edspertKey => dotenv.env['EDSPERT_KEY']!;
}
