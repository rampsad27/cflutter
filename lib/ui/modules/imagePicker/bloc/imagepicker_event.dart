part of 'imagepicker_bloc.dart';

@immutable
sealed class ImageAndFilePickerEvent {}

sealed class TakePictureEvent {}

final class ImageAndFilePickUpRequested extends ImageAndFilePickerEvent {}

final class TakePictureRequested extends ImageAndFilePickerEvent {}
