// ignore_for_file: must_be_immutable

part of 'teachers_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Teachers widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TeachersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Teachers widget is first created.
class TeachersInitialEvent extends TeachersEvent {
  @override
  List<Object?> get props => [];
}
