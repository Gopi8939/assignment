import 'package:assignment/core/utils/image_constant.dart';
import 'package:assignment/core/utils/validation_functions.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_image_view.dart';
import 'package:assignment/widgets/custom_text_form_field.dart';

import '../../core/app_export.dart';
import '../../core/utils/navigator_service.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import 'models/teachers_model.dart';
import 'package:flutter/material.dart';
import 'bloc/teachers_bloc.dart';

// ignore_for_file: must_be_immutable
class TeachersScreen extends StatelessWidget {
  TeachersScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<TeachersBloc>(
        create: (context) =>
            TeachersBloc(TeachersState(teachersModelObj: TeachersModel()))
              ..add(TeachersInitialEvent()),
        child: TeachersScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Form(
                            key: _formKey,
                            child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.h, vertical: 64.v),
                                child: Column(children: [
                                  Text("lbl_teachers".tr,
                                      style: theme.textTheme.bodyLarge),
                                  SizedBox(height: 32.v),
                                  BlocSelector<TeachersBloc, TeachersState,
                                          TextEditingController?>(
                                      selector: (state) => state.nameController,
                                      builder: (context, nameController) {
                                        return CustomTextFormField(
                                            controller: nameController,
                                            hintText: "lbl_name".tr,
                                            validator: (value) {
                                              if (!isText(value)) {
                                                return "err_msg_please_enter_valid_text"
                                                    .tr;
                                              }
                                              return null;
                                            });
                                      }),
                                  SizedBox(height: 16.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("lbl_college".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  SizedBox(height: 15.v),
                                  Divider(),
                                  SizedBox(height: 16.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("lbl_department".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  SizedBox(height: 15.v),
                                  Divider(),
                                  SizedBox(height: 16.v),
                                  BlocSelector<TeachersBloc, TeachersState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.qUALIFICATIONSController,
                                      builder:
                                          (context, qUALIFICATIONSController) {
                                        return CustomTextFormField(
                                            controller:
                                                qUALIFICATIONSController,
                                            hintText: "lbl_qualifications".tr,
                                            textInputAction:
                                                TextInputAction.done);
                                      }),
                                  SizedBox(height: 52.v),
                                  Divider(),
                                  Spacer(),
                                  SizedBox(height: 25.v),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgNext,
                                      height: 75.v,
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(left: 92.h),
                                      onTap: () {
                                        onTapImgNext(context);
                                      })
                                ]))))))));
  }

  /// Navigates to the organizationScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.organizationScreen,
    );
  }
}
