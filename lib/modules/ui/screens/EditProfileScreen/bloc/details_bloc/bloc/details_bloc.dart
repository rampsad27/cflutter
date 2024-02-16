import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/models/user_details_model.dart';

import 'package:instagram_app/modules/ui/screens/EditProfileScreen/bloc/details_bloc/repository/details_repository.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc({required this.detailsAuthRepository}) : super(DetailsInitial()) {
    on<DetailsSaveRequested>((event, emit) async {
      emit(DetailsLoadInProgress());
      try {
        if (event.name.isNotEmpty) {
          name = event.name;
        }
        if (event.username.isNotEmpty) {
          username = event.username;
        }
        await detailsAuthRepository.saveDetailsInfo(name, username, event.bio);
        emit(const DetailsLoadSuccess(
            successMessage: "details saved successfully"));
        add(DetailsLoadRequested());
      } catch (e) {
        emit(DetailsLoadFailure(failureMessage: e.toString()));
      }
    });

    on<DetailsLoadRequested>((event, emit) {
      try {
        final userDetails = detailsAuthRepository.getDetailsInfo();
        emit(DetailsLoaded(userDetails));
      } catch (e) {
        emit(DetailsLoadFailure(failureMessage: e.toString()));
      }
    });
  }
  String name = "";
  String username = "";
  String bio = "";
  TextEditingController nameController = TextEditingController();
  DetailsAuthRepository detailsAuthRepository;
}
