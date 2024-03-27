import 'package:assignment/core/app_export.dart';
import 'package:assignment/core/utils/image_constant.dart';
import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/localization/app_localization.dart';
import 'package:assignment/theme/app_decoration.dart';
import 'package:assignment/widgets/custom_image_view.dart';

import '../../theme/theme_helper.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(ProfileState(
        profileModelObj: ProfileModel(),
      ))
        ..add(ProfileInitialEvent()),
      child: ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: 34.v),
                    _buildFifty(context),
                    SizedBox(height: 25.v),
                    _buildFiftyThree(context),
                    SizedBox(height: 18.v),
                    _buildThirtySix(context),
                    SizedBox(height: 9.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgEdit,
                              width: 29.h,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgEdit,
                              width: 29.h,
                              margin: EdgeInsets.only(left: 135.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 41.h,
                        right: 35.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 126.h,
                            child: Divider(),
                          ),
                          SizedBox(
                            width: 158.h,
                            child: Divider(
                              indent: 32.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 44.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 129.h),
                        child: Text(
                          "lbl_post".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 78.v),
                    _buildTen(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFifty(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(right: 29.h),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgProfile,
              height: 97.v,
            ),
            Container(
              height: 40.v,
              width: 199.h,
              margin: EdgeInsets.only(
                left: 10.h,
                top: 33.v,
                bottom: 20.v,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_name".tr,
                          style: theme.textTheme.headlineSmall,
                        ),
                        SizedBox(height: 1.v),
                        SizedBox(
                          width: 160.h,
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgEdit,
                    width: 29.h,
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFiftyThree(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 41.h,
        right: 29.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildThirtyThree(context),
          Padding(
            padding: EdgeInsets.only(
              left: 38.h,
              top: 3.v,
            ),
            child: _buildThirtyThree(context),
          ),
        ],
      ),
    );
  }

  Widget _buildThirtySix(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 41.h,
        right: 29.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildThirtyThree(context),
          Container(
            height: 34.v,
            width: 129.h,
            margin: EdgeInsets.only(left: 35.h),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 126.h,
                    child: Divider(),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgEdit,
                  width: 29.h,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.v),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 27.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage,
                    height: 37.v,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgImage,
                    height: 37.v,
                    margin: EdgeInsets.only(left: 65.h),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.v),
          Divider(),
          SizedBox(height: 2.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 27.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage,
                    height: 37.v,
                  ),
                  Container(
                    height: 1.v,
                    width: 45.h,
                    margin: EdgeInsets.only(
                      left: 72.h,
                      top: 18.v,
                      bottom: 18.v,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 45.h,
                            child: Divider(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 45.h,
                            child: Divider(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.v),
          SizedBox(
            width: 45.h,
            child: Divider(),
          ),
          SizedBox(height: 9.v),
          Divider(),
          SizedBox(height: 40.v),
        ],
      ),
    );
  }

  Widget _buildThirtyThree(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEdit,
          width: 29.h,
          alignment: Alignment.centerRight,
        ),
        SizedBox(height: 3.v),
        SizedBox(
          width: 126.h,
          child: Divider(),
        ),
      ],
    );
  }
}
