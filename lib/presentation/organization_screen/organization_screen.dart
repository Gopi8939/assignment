
import 'package:assignment/core/utils/image_constant.dart';
import 'package:assignment/core/utils/navigator_service.dart';
import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/core/utils/validation_functions.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/routes/app_routes.dart';
import 'package:assignment/theme/theme_helper.dart';
import 'package:assignment/widgets/custom_image_view.dart';
import 'package:assignment/widgets/custom_text_form_field.dart';

import '../../core/app_export.dart';
import 'models/organization_model.dart';
import 'package:flutter/material.dart';
import 'bloc/organization_bloc.dart';

// ignore_for_file: must_be_immutable
class OrganizationScreen extends StatelessWidget {
  OrganizationScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<OrganizationBloc>(
        create: (context) => OrganizationBloc(
            OrganizationState(organizationModelObj: OrganizationModel()))
          ..add(OrganizationInitialEvent()),
        child: OrganizationScreen());
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
                                    horizontal: 40.h, vertical: 58.v),
                                child: Column(children: [
                                  Text("lbl_organization".tr,
                                      style: theme.textTheme.bodyLarge),
                                  SizedBox(height: 35.v),
                                  BlocSelector<
                                          OrganizationBloc,
                                          OrganizationState,
                                          TextEditingController?>(
                                      selector: (state) => state.nameController,
                                      builder: (context, nameController) {
                                        return CustomTextFormField(
                                            controller: nameController,
                                            hintText: "lbl_college_name".tr,
                                            validator: (value) {
                                              if (!isText(value)) {
                                                return "err_msg_please_enter_valid_text"
                                                    .tr;
                                              }
                                              return null;
                                            },
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.h));
                                      }),
                                  SizedBox(height: 8.v),
                                  BlocSelector<
                                          OrganizationBloc,
                                          OrganizationState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.locationController,
                                      builder: (context, locationController) {
                                        return CustomTextFormField(
                                            controller: locationController,
                                            hintText: "lbl_location".tr,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.h));
                                      }),
                                  SizedBox(height: 8.v),
                                  BlocSelector<
                                          OrganizationBloc,
                                          OrganizationState,
                                          TextEditingController?>(
                                      selector: (state) =>
                                          state.priceController,
                                      builder: (context, priceController) {
                                        return CustomTextFormField(
                                            controller: priceController,
                                            hintText: "lbl_other_details".tr,
                                            textInputAction:
                                                TextInputAction.done,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.h));
                                      }),
                                  SizedBox(height: 37.v),
                                  Divider(),
                                  Spacer(),
                                  SizedBox(height: 42.v),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgNext,
                                      height: 75.v,
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(left: 94.h),
                                      onTap: () {
                                        onTapImgNext(context);
                                      })
                                ]))))))));
  }

  /// Navigates to the verificationScreen when the action is triggered.
  onTapImgNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.verificationScreen,
    );
  }
}
