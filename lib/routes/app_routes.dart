import 'package:flutter/material.dart';
import 'package:sdgp_test01/presentation/Initial_loading_page/initial_loading_page.dart';
import 'package:sdgp_test01/presentation/Starting_page/starting_page.dart';
import 'package:sdgp_test01/presentation/Loading_page_1/loading_page_1.dart';
import 'package:sdgp_test01/presentation/Login_page_1/login_page_1.dart';
import 'package:sdgp_test01/presentation/Loading_page_2/loading_page_2.dart';
import 'package:sdgp_test01/presentation/Signup_other_options/signup_other_options.dart';
import 'package:sdgp_test01/presentation/Signup_new_user/signup_new_user.dart';
import 'package:sdgp_test01/presentation/Profile_picture/profile_picture.dart';
import 'package:sdgp_test01/presentation/Instructions_page/instructions_page.dart';
import 'package:sdgp_test01/presentation/frame_293_screen/frame_293_screen.dart';
import 'package:sdgp_test01/presentation/starting_page_signup/starting_page_signup.dart';
import 'package:sdgp_test01/presentation/Signin_other_options/signin_other_options.dart';
import 'package:sdgp_test01/presentation/Signup_old_user/signup_old_user.dart';
import 'package:sdgp_test01/presentation/Password_change/password_change.dart';
import 'package:sdgp_test01/presentation/Password_mail/password_mail.dart';
import 'package:sdgp_test01/presentation/Gender_selection/gender_selection.dart';
import 'package:sdgp_test01/presentation/Body_selection_male/body_selection_male.dart';
import 'package:sdgp_test01/presentation/Loading_page_3(BodyToLanding)/loading_page_3.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/Landing_page_2/landing_page_2.dart';
import 'package:sdgp_test01/presentation/Main_settings_page/main_settings.dart';
import 'package:sdgp_test01/presentation/Notifications_page/notifications_page.dart';
import 'package:sdgp_test01/presentation/Feedback_popup/feedback_popup.dart';
import 'package:sdgp_test01/presentation/Themes_page/themes_page.dart';
import 'package:sdgp_test01/presentation/Notice_page/notice_page.dart';
import 'package:sdgp_test01/presentation/Invite_friends_page/invite_friends.dart';
import 'package:sdgp_test01/presentation/Settings/settings.dart';
import 'package:sdgp_test01/presentation/Subscription_page/subscription_page.dart';
import 'package:sdgp_test01/presentation/Subscription_after_purchase/subscription_after_purchase_page.dart';
import 'package:sdgp_test01/presentation/FAQ_Page/faq_page.dart';
import 'package:sdgp_test01/presentation/Thank_popup/thank_popup.dart';
import 'package:sdgp_test01/presentation/Subscription_page_confirmation/subscription_page_confirmation.dart';
import 'package:sdgp_test01/presentation/frame_675_screen/frame_675_screen.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Loading_page_4(initialLoadingScreen)/loading_page_4.dart';
import 'package:sdgp_test01/presentation/Body_selection_female/body_selection_female.dart';
import 'package:sdgp_test01/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:sdgp_test01/presentation/frame_404_bottomsheet/frame_404_bottomsheet.dart';
import 'package:sdgp_test01/presentation/frame_405_bottomsheet/frame_405_bottomsheet.dart';
import 'package:sdgp_test01/presentation/frame_406_bottomsheet/frame_406_bottomsheet.dart';
import '../presentation/frame_851_tab_container_screen/frame_851_tab_container_screen.dart';
import '../presentation/frame_981_screen/frame_981_screen.dart';
import '../presentation/frame_1038_screen/frame_1038_screen.dart';
import '../presentation/frame_1010_screen/frame_1010_screen.dart';
import '../presentation/frame_1061_page/frame_1061_page.dart';
import '../presentation/frame_1061_container_screen/frame_1061_container_screen.dart';
import '../presentation/Contact_Us/contact_us.dart';

class AppRoutes {
  static const String initial_loading_page = '/initial_loading_page';

  static const String main_settings = '/main_settings';

  static const String frame851Page = '/frame_851_page';
  static const String contact_us = '/contact_us';

  static const String frame851TabContainerScreen = '/frame_851_tab_container_screen';

  static const String frame981Screen = '/frame_981_screen';

  static const String frame1010Screen = '/frame_1010_screen';

  static const String frame1038Screen = '/frame_1038_screen';

  static const String frame881Page = '/frame_881_page';

  static const String frame926Page = '/frame_926_page';

  static const String frame941Page = '/frame_941_page';

  static const String frame1061ContainerScreen = '/frame_1061_container_screen';

  static const String frame1061Page = '/frame_1061_page';

  static const String body_selection_female = '/body_selection_female';

  static const String loading_page_3 = '/loading_page_3';

  static const String addtowardrobe_screen = '/addtowardrobe_screen';

  static const String frame_404_bottomsheet = '/frame_404_bottomsheet';

  static const String frame_405_bottomsheet = '/frame_405_bottomsheet';

  static const String frame_406_bottomsheet = '/frame_406_bottomsheet';

  static const String landing_page_2 = '/landing_page_2';

  static const String settings = '/settings';

  static const String loading_page_4 = '/loading_page_4';

  static const String bookmark_page = '/bookmark_page';

  static const String user_profile = '/user_profile';

  static const String subscription_page = '/subscription_page';

  static const String subscription_after_purchase_page = '/subscription_after_purchase_page';

  static const String frame_642_screen = '/frame_642_screen';

  static const String faq_page = '/faq_page';

  static const String thank_popup = '/thank_popup';

  static const String frame_623_screen = '/frame_623_screen';

  static const String frame_637_screen = '/frame_637_screen';

  static const String notice_page = '/notice_page';

  static const String subscription_page_confirmation = '/subscription_page_confirmation';

  static const String frame_647_dialog = '/frame_647_dialog';

  static const String frame_648_screen = '/frame_648_screen';

  static const String frame_649_screen = '/frame_649_screen';

  static const String frame_650_screen = '/frame_650_screen';

  static const String frame_651_dialog = '/frame_651_dialog';

  static const String frame_652_dialog = '/frame_652_dialog';

  static const String frame_653_dialog = '/frame_653_dialog';

  static const String invite_friends = '/invite_friends';

  static const String frame_675_screen = '/frame_675_screen';

  static const String frame_639_screen = '/frame_639_screen';

  static const String notifications_page = '/notifications_page';

  static const String feedback_popup = '/feedback_popup';

  static const String themes_page = '/themes_page';

  static const String frame_641_screen = '/frame_641_screen';

  static const String body_selection_male = '/body_selection_male';

  static const String frame293Screen = '/frame_293_screen';

  static const String landing_page = '/landing_page';

  static const String gender_selection = '/gender_selection';

  static const String starting_page = '/starting_page';

  static const String loading_page_1 = '/loading_page_1';

  static const String login_page_1 = '/login_page_1';

  static const String loading_page_2 = '/loading_page_2';

  static const String signup_other_options = '/signup_other_options';

  static const String signup_new_user = '/signup_new_user';

  static const String profile_picture = '/profile_picture';

  static const String instructions_page = '/instructions_page';

  static const String starting_page_signup = '/starting_page_signup';

  static const String signin_other_options = '/signin_other_options';

  static const String signup_old_user = '/signup_old_user';

  static const String password_change = '/password_change';

  static const String password_mail = '/password_mail';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {

    addtowardrobe_screen: (context) => const AddtowardrobeScreen(),
    initial_loading_page: (context) => const Initial_loading_page(),
    main_settings: (context) => const Main_settings(),
    frame851TabContainerScreen: (context) => Frame851TabContainerScreen(),
    frame981Screen: (context) => Frame981Screen(),
    frame1061Page: (context) => Frame1061Page(),
    frame1010Screen: (context) => Frame1010Screen(selectedDate: DateTime.now()), // This will need to be changed when navigating
    frame1038Screen: (context) => Frame1038Screen(),
    body_selection_female: (context) => const Bodyselectionfemale(),
    loading_page_4: (context) => const Loading_page_4(),
    bookmark_page: (context) => Bookmark_page(),
    contact_us: (context) =>  Contact_us(),
    user_profile: (context) => const User_profile(),
    frame_404_bottomsheet: (context) => const Frame404Bottomsheet(),
    frame_405_bottomsheet: (context) => const Frame405Bottomsheet(),
    frame_406_bottomsheet: (context) => const Frame406Bottomsheet(),
    settings: (context) => const Settings(),
    notifications_page: (context) => Notifications_page(),
    subscription_page: (context) => const Subscription_page(),
    subscription_after_purchase_page: (context) => const Subscription_after_purchase(),
    notice_page: (context) => const Notice_page(),
    faq_page: (context) => const FAQ_Page(),
    thank_popup: (context) => const Thank_popup(),
    landing_page_2: (context) => const Landing_page_2(),
    invite_friends: (context) => const Invite_friends(),
    feedback_popup: (context) => Feedback_popup(),
    themes_page: (context) => const Themes_page(),
    subscription_page_confirmation: (context) => const Subscription_page_confirmation(),
    frame_675_screen: (context) => const Frame675Screen(),
    body_selection_male: (context) => const Body_selection_male(),
    loading_page_3: (context) => const Loading_page_3(),
    landing_page: (context) => const LandingPage(),
    gender_selection: (context) => const Gender_selection(),
    starting_page: (context) => const Starting_page(),
    loading_page_1: (context) => const Loading_page_1(),
    login_page_1: (context) => const Login_page_1(),
    loading_page_2: (context) => const Loading_page_2(),
    signup_other_options: (context) => const Signup_other_options(),
    signup_new_user: (context) => Signup_new_user(),
    profile_picture: (context) => const Profile_picture(),
    instructions_page: (context) => const Instructions_page(),
    frame293Screen: (context) => const Frame293Screen(),
    starting_page_signup: (context) => const Starting_page_signup(),
    signin_other_options: (context) => const Signin_other_options(),
    signup_old_user: (context) => Signup_old_user(),
    password_change: (context) => Password_change(),
    password_mail: (context) => const Password_mail(),
    appNavigationScreen: (context) => const AppNavigationScreen()
  };
}
