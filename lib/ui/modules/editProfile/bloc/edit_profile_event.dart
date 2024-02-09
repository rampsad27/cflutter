part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

final class EditProfileDataRequested extends EditProfileEvent {
  final String name;
  final String username;

  const EditProfileDataRequested({required this.name, required this.username});
}

class CheckEditProfileData extends EditProfileEvent {
  @override
  List<Object> get props => [];
}
