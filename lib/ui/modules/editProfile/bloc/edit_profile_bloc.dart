import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ig/ui/modules/loginauth/repository/profile_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  ProfileRepository profileRepository;

  EditProfileBloc({required this.profileRepository})
      : super(EditProfileDataInitial()) {
    on<EditProfileDataRequested>((event, emit) async {
      emit(EditProfileDataProgress());
      await Future.delayed(const Duration(seconds: 2));
      await profileRepository.saveUserProfileInfo(event.name, event.username);
      add(CheckEditProfileData());
      // add(EditProfileDataRequested());
    });
    on<CheckEditProfileData>((event, emit) async {
      emit(EditProfileDataProgress());
      await Future.delayed(const Duration(seconds: 2));
      // bool isLoggedIn = await authenticationRepository.isUserLoggedIn();
      var temp = profileRepository.getUserProfileInfo();
      emit(EditProfileDataSuccess(name: temp.name));
    });
  }
}
