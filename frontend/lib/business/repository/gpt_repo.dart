import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:frontend/business/model/request.dart';
import 'package:frontend/business/usecase/generate.dart';
import 'package:frontend/data/source/exam_api.dart';
// ignore: library_prefixes
import 'package:http/http.dart' as HTTP;

abstract class GPTREPO extends ExamAPI {
  const GPTREPO();
}

class GPTGenerate extends GPTREPO implements Generate {
  const GPTGenerate();

  @override
  Future<Uint8List> generate({
    required GenerateRequest request,
    required Map<String, Uint8List> content,
  }) async {
    Uri uri = Uri.parse(super.api);
    HTTP.MultipartRequest req = HTTP.MultipartRequest('POST', uri);
    req.fields['request'] = jsonEncode(request.toJSON());

    content.forEach((key, value) {
      req.files
          .add(HTTP.MultipartFile.fromBytes('content', value, filename: key));
    });

    log('Request:');
    var jsonElement = request.toJSON();
    jsonElement.forEach((key, value) => debugPrint('$key:\n$value'));
    log('Content');
    log(req.files.toString());

    try {
      HTTP.StreamedResponse response = await req.send();

      if (response.statusCode != 201) throw Exception('API Call Faield');

      BytesBuilder builder = BytesBuilder();

      await for (var chunk in response.stream) {
        builder.add(chunk);
      }

      return builder.takeBytes();
    } catch (e) {
      log('GPT Generate Repository:\n${e.toString()}');
      rethrow;
    }
  }
}
