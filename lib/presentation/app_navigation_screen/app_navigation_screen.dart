import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/localization/app_localization.dart';

import '../../core/app_export.dart';
import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';
import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'bloc/app_navigation_bloc.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))
        ..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0XFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  _buildAppNavigation(context),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                        ),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "REGISTERATION".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.registerationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "ROLE".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.roleScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "STUDENTS".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.studentsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "TEACHERS".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.teachersScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "ORGANIZATION".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.organizationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "VERIFICATION".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.verificationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "RECOMMENDATION".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.recommendationScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "HOME - Container".tr,
                              onTapScreenTitle: () => onTapScreenTitle(
                                  AppRoutes.homeContainerScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "CHAT".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.chatScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "EVENTS".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.eventsScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "PROFILE".tr,
                              onTapScreenTitle: () =>
                                  onTapScreenTitle(AppRoutes.profileScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
