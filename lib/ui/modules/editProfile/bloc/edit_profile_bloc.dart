import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ig/repository/profile_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  ProfileRepository profileRepository;

  EditProfileBloc({required this.profileRepository})
      : super(EditProfileDataInitial()) {
    on<EditProfileDataRequested>((event, emit) async {
      emit(EditProfileDataProgress());
      try {
        if (event.name.isNotEmpty) {
          name = event.name;
        }
        if (event.username.isNotEmpty) {
          username = event.username;
        }
        if (event.username.isNotEmpty) {
          username = event.username;
        }
        //   await ProfileRepository.saveUserProfileInfo(name, username);
        //   emit(const EditProfileDataSuccess());
        //   add(const EditProfileDataRequested());

        // await Future.delayed(const Duration(seconds: 2));
        await profileRepository.saveUserProfileInfo(name, username);
        add(CheckEditProfileData());
        // add(EditProfileDataRequested());
      } catch (e) {
        emit(EditProfileDataFailure(message: e.toString()));
      }
    });
    on<CheckEditProfileData>((event, emit) async {
      emit(EditProfileDataProgress());
      await Future.delayed(const Duration(seconds: 1));
      // bool isLoggedIn = await authenticationRepository.isUserLoggedIn();
      var temp = profileRepository.getUserProfileInfo();
      emit(EditProfileDataSuccess(name: temp.name, username: temp.username));
    });
  }
  String name = "";
  String username = "";
}
