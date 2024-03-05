import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
    key: key,
  );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 56.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
    SizeUtils.width,
    height ?? 56.v,
  );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill_1:
        return Container(
          height: 1.v,
          width: double.maxFinite,
          margin: EdgeInsets.only(
            top: 52.17.v,
            bottom: 2.8300018.v,
          ),
          decoration: BoxDecoration(
            color: appTheme.gray80001,
          ),
        );
      case Style.bgFill_2:
        return Container(
          height: 1.v,
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 54.47.v),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(1),
          ),
        );
      case Style.bgShadow:
        return Stack(
          children: [
            Container(
              height: 53.v,
              width: double.maxFinite,
              decoration: BoxDecoration(),
            ),
            Container(
              height: 1.v,
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 52.v),
              decoration: BoxDecoration(
                color: appTheme.gray80001,
              ),
            ),
          ],
        );
      case Style.bgShadow_1:
        return Container(
          height: 1.v,
          width: 359.h,
          margin: EdgeInsets.only(
            top: 51.v,
            right: 1.h,
            bottom: 4.v,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(1),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.25),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(
                  0,
                  4,
                ),
              ),
            ],
          ),
        );
      case Style.bgFill_3:
        return Container(
          height: 1.v,
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 39.v),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(1),
          ),
        );
      case Style.bgFill:
        return Container(
          height: 3.v,
          width: 357.h,
          margin: EdgeInsets.only(
            left: 3.h,
            top: 44.5.v,
            bottom: 8.5.v,
          ),
          decoration: BoxDecoration(
            color: appTheme.gray80001,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill_1,
  bgFill_2,
  bgShadow,
  bgShadow_1,
  bgFill_3,
  bgFill,
}
