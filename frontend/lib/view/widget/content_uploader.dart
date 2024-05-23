// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:typed_data';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/bloc/event/content_events.dart';

class ContentUploader extends StatelessWidget {
  const ContentUploader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          FilePickerResult? picker = await FilePickerWeb.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['pptx', 'pdf'],
            allowMultiple: true,
            onFileLoading: (FilePickerStatus status) =>
                log("File Picker Status: $status"),
          );
          if (picker != null && picker.files.isNotEmpty) {
            //to send all files [for file in files add file to request]
            Map<String, Uint8List> files = {};
            for (PlatformFile file in picker.files) {
              files[file.name] = file.bytes!;
            }
            if (context.read<ContentBloc>().state.content.isEmpty) {
              context.read<ContentBloc>().add(ContentsPicked(content: files));
            } else {
              context.read<ContentBloc>().add(AddFile(files: files));
            }
          }
        } catch (e) {
          log("Upload Exception: ${e.toString()}");
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .48,
        height: 350,
        decoration: _decoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.upload_file_outlined,
                size: 100,
                color: Colors.white54,
              ),
              _hint(context)
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: _border(),
    );
  }

  Border _border() {
    return Border.all(
      width: 3,
      color: Colors.white54,
      strokeAlign: BorderSide.strokeAlignOutside,
    );
  }

  Text _hint(BuildContext context) {
    return Text(
      "Upload Course content (PPTX/PDF).",
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.white54,
            fontFamily: 'EXO-R',
          ),
    );
  }
}
