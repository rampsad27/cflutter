part of 'picker_bloc.dart';

@immutable
sealed class PickerEvent {}

final class FilePickerRequesteed extends PickerEvent {}

final class CameraPickerRequested extends PickerEvent {}
