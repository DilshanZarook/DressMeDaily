import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';

// ignore: must_be_immutable
class ThirtysevenItemWidget extends StatelessWidget {
  const ThirtysevenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 22.v,
              bottom: 10.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "Hoodie",
                    style: CustomTextStyles.bodyLarge18,
                  ),
                ),
                SizedBox(height: 13.v),
                SizedBox(
                  width: 215.h,
                  child: Text(
                    "The garment is on the washing\nprocess adn not in the wardrobe",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumGray500,
                  ),
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgOip2,
            height: 97.v,
            width: 60.h,
            margin: EdgeInsets.only(top: 8.v),
          ),
        ],
      ),
    );
  }
}
