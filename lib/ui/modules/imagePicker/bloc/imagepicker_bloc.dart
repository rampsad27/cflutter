import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'imagepicker_event.dart';
part 'imagepicker_state.dart';

class ImageAndFilePickerBloc
    extends Bloc<ImageAndFilePickerEvent, ImageAndFilePickerState> {
  ImageAndFilePickerBloc() : super(ImageAndFilePickerInitial()) {
    on<ImageAndFilePickUpRequested>((event, emit) async {
      emit(ImageAndFilePickerLoadInProgress());
      try {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'pdf', 'doc'],
        );
        if (result != null) {
          File file = File(result.files.single.path!);
          emit(ImageAndFilePickerFilePicked(pickedFile: file));
        } else {
          // User canceled the picker
          emit(ImageAndFilePickerFailure(
              errorMessage:
                  "Process Cancelled by user or Did not pick any file"));
        }
      } catch (e) {
        log(e.toString());
        emit(ImageAndFilePickerFailure(errorMessage: e.toString()));
      }
    });

    on<TakePictureRequested>((event, emit) async {
      emit(ImageAndFilePickerLoadInProgress());
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? result =
            await picker.pickImage(source: ImageSource.camera);
        if (result != null) {
          emit(TakePicturePicked(pickedImage: File(result.path)));
        } else {
          emit(ImageAndFilePickerFailure(
              errorMessage: "User canceled the action"));
        }
      } catch (e) {
        emit(ImageAndFilePickerFailure(errorMessage: e.toString()));
      }
    });
  }
}
