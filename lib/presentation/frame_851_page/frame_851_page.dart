import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';

import '../frame_851_page/widgets/frame_item_widget.dart';

// ignore_for_file: must_be_immutable
class Frame851Page extends StatefulWidget {
  const Frame851Page({Key? key})
      : super(
          key: key,
        );

  @override
  Frame851PageState createState() => Frame851PageState();
}

class Frame851PageState extends State<Frame851Page>
    with AutomaticKeepAliveClientMixin<Frame851Page> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 76.v),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.h),
                    child: Column(
                      children: [
                        _buildFrame(context),
                        SizedBox(height: 53.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.h,
                            right: 9.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.h,
                                  vertical: 1.v,
                                ),
                                decoration: AppDecoration.outlineBlack.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder12,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 4.v,
                                        bottom: 3.v,
                                      ),
                                      child: Text(
                                        "All clothes",
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgCheckmark,
                                      height: 21.v,
                                      width: 16.h,
                                    ),
                                  ],
                                ),
                              ),
                              // CustomOutlinedButton(
                              //   width: 67.h,
                              //   text: "Season",
                              //   margin: EdgeInsets.only(left: 14.h),
                              //   rightIcon: Container(
                              //     margin: EdgeInsets.only(left: 8.h),
                              //     child: CustomImageView(
                              //       imagePath: ImageConstant.imgCheckmark,
                              //       height: 21.v,
                              //       width: 16.h,
                              //     ),
                              //   ),
                              // ),
                              CustomOutlinedButton(
                                width: 73.h,
                                text: "Occasion",
                                margin: EdgeInsets.only(left: 14.h),
                                rightIcon: Container(
                                  margin: EdgeInsets.only(left: 1.h),
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgCheckmark,
                                    height: 21.v,
                                    width: 16.h,
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: 80.h,
                              //   margin: EdgeInsets.only(left: 14.h),
                              //   padding: EdgeInsets.symmetric(
                              //     horizontal: 2.h,
                              //     vertical: 1.v,
                              //   ),
                              //   decoration: AppDecoration.outlineBlack.copyWith(
                              //     borderRadius:
                              //         BorderRadiusStyle.roundedBorder12,
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Padding(
                              //         padding: EdgeInsets.only(
                              //           top: 5.v,
                              //           bottom: 2.v,
                              //         ),
                              //         child: Text(
                              //           "Category",
                              //           style: theme.textTheme.bodySmall,
                              //         ),
                              //       ),
                              //       CustomImageView(
                              //         imagePath: ImageConstant.imgCheckmark,
                              //         height: 21.v,
                              //         width: 16.h,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: 28.v),
                        _buildFortySix(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Wrap(
      runSpacing: 15.v,
      spacing: 15.h,
      children: List<Widget>.generate(3, (index) => FrameItemWidget()),
    );
  }

  /// Section Widget
  Widget _buildFortySix(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle364,
          height: 365.v,
          width: 190.h,
          radius: BorderRadius.only(
            topRight: Radius.circular(40.h),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 131.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgFrame841,
                height: 104.v,
                width: 112.h,
              ),
              SizedBox(height: 26.v),
              CustomImageView(
                imagePath: ImageConstant.imgFrame841,
                height: 104.v,
                width: 112.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
