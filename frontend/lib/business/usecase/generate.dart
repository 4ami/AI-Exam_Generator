import 'dart:typed_data';

import 'package:frontend/business/model/request.dart';

abstract class Generate {
  const Generate();

  Future<Uint8List> generate({
    required GenerateRequest request,
    required Map<String, Uint8List> content,
  });
}
