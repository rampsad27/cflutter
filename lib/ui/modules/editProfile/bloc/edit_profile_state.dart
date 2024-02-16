part of 'edit_profile_bloc.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileDataInitial extends EditProfileState {}

final class EditProfileDataProgress extends EditProfileState {}

final class EditProfileDataFailure extends EditProfileState {
  final String message;
  const EditProfileDataFailure({required this.message});
}

final class EditProfileDataSuccess extends EditProfileState {
  final String name;
  final String username;

  const EditProfileDataSuccess({required this.name, required this.username});
  @override
  List<Object> get props => [name, username];
}
