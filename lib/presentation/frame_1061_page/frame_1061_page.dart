import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_trailing_image.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'widgets/thirtyseven_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

// ignore_for_file: must_be_immutable
class Frame1061Page extends StatelessWidget {
  const Frame1061Page({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 23.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.v),
                  CustomOutlinedButton(
                    height: 38.v,
                    width: 199.h,
                    text: "Search",
                    buttonStyle: CustomButtonStyles.outlineBlackTL19,
                    buttonTextStyle: theme.textTheme.headlineSmall!,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 10.v),
                  Divider(
                    color: appTheme.black900,
                  ),
                  SizedBox(height: 28.v),
                  Padding(
                    padding: EdgeInsets.only(left: 13.h),
                    child: Text(
                      "Notification",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame1042,
                    height: 5.v,
                    width: 200.h,
                    margin: EdgeInsets.only(left: 13.h),
                  ),
                  SizedBox(height: 40.v),
                  _buildThirtySeven(context),
                  SizedBox(height: 87.v),
                ],
              ),
            ),
          ),
        ),

    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "DMD",
        margin: EdgeInsets.only(left: 31.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMegaphone,
          margin: EdgeInsets.fromLTRB(36.h, 4.v, 36.h, 3.v),
        ),
      ],
    );
  }

  /// Section Widget


  /// Section Widget
  Widget _buildThirtySeven(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0.v),
          child: SizedBox(
            width: double.maxFinite,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.black900,
            ),
          ),
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return ThirtysevenItemWidget();
      },
    );
  }
}
