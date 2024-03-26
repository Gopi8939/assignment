import 'package:assignment/presentation/organization_screen/models/organization_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
part 'organization_event.dart';
part 'organization_state.dart';

/// A bloc that manages the state of a Organization according to the event that is dispatched to it.
class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  OrganizationBloc(OrganizationState initialState) : super(initialState) {
    on<OrganizationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OrganizationInitialEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        locationController: TextEditingController(),
        priceController: TextEditingController()));
  }
}
