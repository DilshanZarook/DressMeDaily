import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

// ignore: must_be_immutable
class Frame2ItemWidget extends StatelessWidget {
  const Frame2ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 10.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "My Selection",
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.blueGray100,
      selectedColor: appTheme.lime400,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          17.h,
        ),
      ),
      onSelected: (value) {},
    );
  }

  Widget build_button2 (BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 10.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "AI Selection",
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.blueGray100,
      selectedColor: appTheme.lime400,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          17.h,
        ),
      ),
      onSelected: (value) {},
    );
  }

  Widget build_button_3(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 10.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "My Selection",
        style: TextStyle(
          color: appTheme.black900,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: appTheme.blueGray100,
      selectedColor: appTheme.lime400,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          17.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
