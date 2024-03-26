import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../models/teachers_model.dart';
import '/core/app_export.dart';
part 'teachers_event.dart';
part 'teachers_state.dart';

/// A bloc that manages the state of a Teachers according to the event that is dispatched to it.
class TeachersBloc extends Bloc<TeachersEvent, TeachersState> {
  TeachersBloc(TeachersState initialState) : super(initialState) {
    on<TeachersInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TeachersInitialEvent event,
    Emitter<TeachersState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        qUALIFICATIONSController: TextEditingController()));
  }
}
