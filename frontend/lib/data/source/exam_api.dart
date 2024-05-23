import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class ExamAPI {
  const ExamAPI();
  String get api =>
      'http://${dotenv.get('API')}${dotenv.get('API_VERSION')}${dotenv.get('GPT_ENDPOINT')}';
}
