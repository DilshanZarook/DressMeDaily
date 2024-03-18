import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sdgp_test01/Services/auth_service.dart';
import 'package:sdgp_test01/pages/auth_page.dart';
import 'package:sdgp_test01/presentation/Initial_loading_page/initial_loading_page.dart';
import 'package:sdgp_test01/presentation/Starting_page/starting_page.dart';
import 'package:sdgp_test01/presentation/Loading_page_1/loading_page_1.dart';
import 'package:sdgp_test01/presentation/Register_New_User/register_new_user.dart';
import 'package:sdgp_test01/presentation/Loading_page_2/loading_page_2.dart';
import 'package:sdgp_test01/presentation/Signup_new_user/signup_new_user.dart';
import 'package:sdgp_test01/presentation/Profile_picture/profile_picture.dart';
import 'package:sdgp_test01/presentation/Instructions_page/instructions_page.dart';
import 'package:sdgp_test01/presentation/frame_293_screen/frame_293_screen.dart';
import 'package:sdgp_test01/presentation/Old_User_Signin/old_user_signin.dart';
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


class AppRoutes {
  static const String initial_loading_page = '/initial_loading_page';

  static const String main_settings = '/main_settings';

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

  static const String register_new_user = '/register_new_user';

  static const String loading_page_2 = '/loading_page_2';

  static const String old_user_signin = '/old_user_signin';

  static const String signup_new_user = '/signup_new_user';

  static const String profile_picture = '/profile_picture';

  static const String instructions_page = '/instructions_page';

  static const String starting_page_signup = '/starting_page_signup';

  static const String signin_other_options = '/signin_other_options';

  static const String signup_old_user = '/signup_old_user';

  static const String password_change = '/password_change';

  static const String password_mail = '/password_mail';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String google_sign_in = '/google_sign_in';

  static const String auth_page = '/auth_page';

  static Map<String, WidgetBuilder> routes = {

    addtowardrobe_screen: (context) => AddtowardrobeScreen(),
    initial_loading_page: (context) => Initial_loading_page(),
    main_settings: (context) => Main_settings(),
    body_selection_female: (context) => Bodyselectionfemale(),
    loading_page_4: (context) => Loading_page_4(),
    bookmark_page: (context) => Bookmark_page(),
    user_profile: (context) => User_profile(),
    frame_404_bottomsheet: (context) => Frame404Bottomsheet(),
    frame_405_bottomsheet: (context) => Frame405Bottomsheet(),
    frame_406_bottomsheet: (context) => Frame406Bottomsheet(),
    settings: (context) => Settings(),
    notifications_page: (context) => Notifications_page(),
    subscription_page: (context) => Subscription_page(),
    subscription_after_purchase_page: (context) => Subscription_after_purchase(),
    notice_page: (context) => Notice_page(),
    faq_page: (context) => FAQ_Page(),
    thank_popup: (context) => Thank_popup(),
    landing_page_2: (context) => Landing_page_2(),
    invite_friends: (context) => Invite_friends(),
    feedback_popup: (context) => Feedback_popup(),
    themes_page: (context) => Themes_page(),
    subscription_page_confirmation: (context) => Subscription_page_confirmation(),
    frame_675_screen: (context) => Frame675Screen(),
    body_selection_male: (context) => Body_selection_male(),
    loading_page_3: (context) => Loading_page_3(),
    landing_page: (context) => Landing_page(),
    gender_selection: (context) => Gender_selection(),
    starting_page: (context) => Starting_page(),
    loading_page_1: (context) => Loading_page_1(),
    register_new_user: (context) => RegisterNewUser(),
    loading_page_2: (context) => Loading_page_2(),
    signup_new_user: (context) => Signup_new_user(),
    profile_picture: (context) => Profile_picture(),
    instructions_page: (context) => Instructions_page(),
    frame293Screen: (context) => Frame293Screen(),
    old_user_signin: (context) => OldUserSignin(),
    signup_old_user: (context) => Signup_old_user(),
    password_change: (context) => Password_change(),
    password_mail: (context) => Password_mail(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    google_sign_in: (context) => AuthService().signInWithGoogle(),
    auth_page: (context) => AuthPage(),
  };
}
