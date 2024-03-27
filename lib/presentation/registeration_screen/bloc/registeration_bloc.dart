import 'dart:convert';
import 'dart:developer';

import 'package:assignment/presentation/registeration_screen/models/registeration_model.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/widgets/Appconstant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/api_service.dart';
import '../../../core/utils/navigator_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/core/app_export.dart';
part 'registeration_event.dart';
part 'registeration_state.dart';

/// A bloc that manages the state of a Registeration according to the event that is dispatched to it.
class RegisterationBloc extends Bloc<RegisterationEvent, RegisterationState> {
  RegisterationBloc(RegisterationState initialState) : super(initialState) {
    on<RegisterationInitialEvent>(_onInitialize);
    on<SignInButtonClickedEvent>(_onSignInButtonClicked);
  }

  _onInitialize(
      RegisterationInitialEvent event, Emitter<RegisterationState> emit) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController()));
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    // isAuthenticated
    //     ? NavigatorService.popAndPushNamed(
    //         AppRoutes.homeContainerScreen,
    //       )
    //     : null;
  }

  _onSignInButtonClicked(
      SignInButtonClickedEvent event, Emitter<RegisterationState> emit) async {
    try {
      log("${event.email}, ${event.password}");
      final response = await ApiService.signIn(event.email, event.password);

      if (response.statusCode == 200) {
        var result = json.decode(await response.stream.bytesToString());
        // log(result['uid'].toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isAuthenticated', true);
        prefs.setInt('uid', result['uid']);

        Appconstant().toast(toast: "Logged in Successfully", clr: Colors.green);
        NavigatorService.popAndPushNamed(
          AppRoutes.homeContainerScreen,
        );
      } else {
        var result = json.decode(await response.stream.bytesToString());
        log(result['error']);
        Appconstant().toast(toast: result['error']);
      }
    } catch (e) {
      log(e.toString());
      Appconstant().toast(toast: "Failed to sign in");
    }
  }
}
