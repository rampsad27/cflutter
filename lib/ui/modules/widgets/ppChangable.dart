import 'package:flutter/material.dart';
import 'package:ig/ui/modules/imagePicker/bloc/imagepicker_bloc.dart';

ImageProvider<Object> getAvatarImage(dynamic state) {
  if (state is ImageAndFilePickerFilePicked) {
    return FileImage(state.pickedFile!);
  } else if (state is TakePicturePicked) {
    return FileImage(state.pickedImage!);
  } else {
    // Default avatar image
    return const NetworkImage(
        "https://imgupscaler.com/images/samples/animal-after.webp");
  }
}
