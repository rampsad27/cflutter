part of 'imagepicker_bloc.dart';

@immutable
sealed class ImageAndFilePickerEvent {}

final class ImageAndFilePickUpRequested extends ImageAndFilePickerEvent {}
