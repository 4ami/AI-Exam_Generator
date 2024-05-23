import 'dart:async';
import 'dart:developer';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TEST extends StatefulWidget {
  const TEST({super.key});

  @override
  State<TEST> createState() => _TESTState();
}

Uint8List? fileBytes;

Future<void> get() async {
  Uri uri = Uri.parse('http://localhost:8000/api/v1/question_bank');
  http.Response res = await http.get(uri);
  if (res.statusCode == 200) {
    fileBytes = res.bodyBytes;
  }
}

void store() {
  final html.Blob blob = html.Blob([fileBytes]);
  final String url = html.Url.createObjectUrlFromBlob(blob);
  final anch = html.AnchorElement(href: url)
    ..target = 'blank'
    ..download = 'Testing.docx';

  anch.click();
  html.Url.revokeObjectUrl(url);
}

class _TESTState extends State<TEST> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  log("Start");
                  setState(() {
                    isLoading = true;
                  });
                  await get();
                  setState(() {
                    isLoading = false;
                  });
                  log("Complete");
                  log(fileBytes.toString());
                },
                child: const Text('GET'),
              ),
              TextButton(
                onPressed: () {
                  if (fileBytes == null) {
                    log("Empty!");
                    return;
                  }

                  store();
                },
                child: const Text('Download'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
