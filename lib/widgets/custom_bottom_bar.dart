import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key? key, this.onChanged}) : super(key: key);

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      activeIcon: ImageConstant.imgSettings,
      type: BottomBarEnum.Settings,
    ),
    BottomMenuModel(
      icon: ImageConstant.bookmark_footer,
      activeIcon: ImageConstant.bookmark_footer,
      type: BottomBarEnum.Bookmarkssimple,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: double.maxFinite,
          child: Divider(),
        ),
        SizedBox(
          height: 66.v,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            elevation: 0,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(bottomMenuList.length, (index) {
              return BottomNavigationBarItem(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].icon,
                      height: 38.v,
                      width: 41.h,
                      color: appTheme.gray900,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgFrame373,
                      height: 47.v,
                      width: 239.h,
                      margin: EdgeInsets.only(left: 25.h),
                    ),
                  ],
                ),
                activeIcon: CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 32.adaptSize,
                  width: 32.adaptSize,
                  color: appTheme.black900,
                ),
                label: '',
              );
            }),
            onTap: (index) {
              selectedIndex = index;
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}

enum BottomBarEnum {
  Settings,
  Bookmarkssimple,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
