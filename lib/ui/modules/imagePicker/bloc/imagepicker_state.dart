part of 'imagepicker_bloc.dart';

@immutable
sealed class ImageAndFilePickerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ImageAndFilePickerInitial extends ImageAndFilePickerState {}

final class ImageAndFilePickerLoadInProgress extends ImageAndFilePickerState {}

final class ImageAndFilePickerFailure extends ImageAndFilePickerState {
  final String errorMessage;

  ImageAndFilePickerFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class ImageAndFilePickerFilePicked extends ImageAndFilePickerState {
  final File? pickedFile;

  ImageAndFilePickerFilePicked({this.pickedFile});

  @override
  List<Object?> get props => [pickedFile];
}

@immutable
sealed class TakePictureState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class TakePictureInitial extends TakePictureState {}

final class TakePictureLoadInProgress extends TakePictureState {}

final class TakePictureFailure extends TakePictureState {
  final String errorMessage;

  TakePictureFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class TakePicturePicked extends TakePictureState {
  final File? pickedImage;

  TakePicturePicked({this.pickedImage});

  @override
  List<Object?> get props => [pickedImage];
}
