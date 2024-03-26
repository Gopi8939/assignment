// ignore_for_file: must_be_immutable

part of 'organization_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Organization widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OrganizationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Organization widget is first created.
class OrganizationInitialEvent extends OrganizationEvent {
  @override
  List<Object?> get props => [];
}
