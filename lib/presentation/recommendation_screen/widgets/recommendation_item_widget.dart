import 'package:assignment/core/utils/size_utils.dart';
import 'package:assignment/theme/app_decoration.dart';
import 'package:assignment/widgets/custom_image_view.dart';

import '../../../core/utils/image_constant.dart';
import '../models/recommendation_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecommendationItemWidget extends StatelessWidget {
  RecommendationItemWidget(
    this.recommendationItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RecommendationItemModel recommendationItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.v,
      width: 112.h,
      padding: EdgeInsets.symmetric(vertical: 7.v),
      decoration: AppDecoration.fillPrimary,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgProfile,
            width: 60.h,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 9.h),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgAdd,
            height: 39.v,
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}
