import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class AppbarTrailingImage extends StatelessWidget {
  final String? imagePath;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  const AppbarTrailingImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath ?? 'assets/images/default_image.png', // Provide a default image path
          height: 27.v,
          width: 30.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
