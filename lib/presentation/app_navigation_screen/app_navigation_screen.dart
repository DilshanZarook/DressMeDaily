import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
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
                          screenTitle: "Landing_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.landing_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Initial_loading_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.initial_loading_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Starting_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.starting_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Frame 243",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loading_page_1),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login_page_1",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.login_page_1),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Loading_page_2",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loading_page_2),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Signup_other_options",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signup_other_options),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Signup_new_user",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signup_new_user),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile_picture",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profile_picture),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Instructions_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.instructions_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Frame 293",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame293Screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Starting_page_signup",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.starting_page_signup),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Signin_other_options",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signin_other_options),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Signup_old_user",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signup_old_user),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Password_change",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.password_change),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Password_mail",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.password_mail),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "bookmark_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bookmark_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_624_draweritem",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.main_settings),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_623_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_623_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "notifications_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notifications_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "settings",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settings),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "themes_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.themes_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "feedback_popup",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.feedback_popup),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_637_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_637_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "notice_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notice_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_639_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_639_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "subscription_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.subscription_page),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_641_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_641_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_642_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_642_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "feedback_popup",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.feedback_popup),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "thank_popup",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.thank_popup),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "subscription_page_confirmation",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.subscription_page_confirmation),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_647_dialog",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_647_dialog),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_648_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_648_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_649_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_649_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_650_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_650_screen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_651_dialog",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_651_dialog),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_652_dialog",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_652_dialog),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_653_dialog",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_653_dialog),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "invite_friends",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.invite_friends),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "frame_675_screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.frame_675_screen),
                        ),_buildScreenTitle(
                          context,
                          screenTitle: "subscription_after_purchase_page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.subscription_after_purchase_page),
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
                "App Navigation",
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
                "Check your app's UI from the below demo screens of your app.",
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
        onTapScreenTitle!.call();
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
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
