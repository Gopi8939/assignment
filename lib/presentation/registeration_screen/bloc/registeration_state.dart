// ignore_for_file: must_be_immutable

part of 'registeration_bloc.dart';

/// Represents the state of Registeration in the application.
class RegisterationState extends Equatable {
  RegisterationState({
    this.emailController,
    this.passwordController,
    this.registerationModelObj,
    this.errorMessage,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  RegisterationModel? registerationModelObj;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        registerationModelObj,
      ];

  RegisterationState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    RegisterationModel? registerationModelObj,
    String? errorMessage,
  }) {
    return RegisterationState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      registerationModelObj:
          registerationModelObj ?? this.registerationModelObj,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
