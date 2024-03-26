// ignore_for_file: must_be_immutable

part of 'teachers_bloc.dart';

/// Represents the state of Teachers in the application.
class TeachersState extends Equatable {
  TeachersState({
    this.nameController,
    this.qUALIFICATIONSController,
    this.teachersModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? qUALIFICATIONSController;

  TeachersModel? teachersModelObj;

  @override
  List<Object?> get props => [
        nameController,
        qUALIFICATIONSController,
        teachersModelObj,
      ];

  TeachersState copyWith({
    TextEditingController? nameController,
    TextEditingController? qUALIFICATIONSController,
    TeachersModel? teachersModelObj,
  }) {
    return TeachersState(
      nameController: nameController ?? this.nameController,
      qUALIFICATIONSController:
          qUALIFICATIONSController ?? this.qUALIFICATIONSController,
      teachersModelObj: teachersModelObj ?? this.teachersModelObj,
    );
  }
}
