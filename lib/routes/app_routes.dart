import 'package:flutter/material.dart';
import 'package:DressMeDaily/presentation/Body_selection_female/body_selection_female.dart';
import 'package:DressMeDaily/presentation/Body_selection_male/body_selection_male.dart';
import 'package:DressMeDaily/presentation/Bookmark_page/bookmark_page.dart';
import 'package:DressMeDaily/presentation/FAQ_Page/faq_page.dart';
import 'package:DressMeDaily/presentation/Feedback_popup/feedback_popup.dart';
import 'package:DressMeDaily/presentation/Gender_selection/gender_selection.dart';
import 'package:DressMeDaily/presentation/Initial_loading_page/initial_loading_page.dart';
import 'package:DressMeDaily/presentation/Instructions_page/instructions_page.dart';
import 'package:DressMeDaily/presentation/Invite_friends_page/invite_friends.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/Landing_page_2/landing_page_2.dart';
import 'package:DressMeDaily/presentation/Loading_page_1/loading_page_1.dart';
import 'package:DressMeDaily/presentation/Loading_page_2/loading_page_2.dart';
import 'package:DressMeDaily/presentation/Loading_page_3(BodyToLanding)/loading_page_3.dart';
import 'package:DressMeDaily/presentation/Loading_page_4(initialLoadingScreen)/loading_page_4.dart';
import 'package:DressMeDaily/presentation/Login_page_1/login_page_1.dart';
import 'package:DressMeDaily/presentation/Main_settings_page/main_settings.dart';
import 'package:DressMeDaily/presentation/Notice_page/notice_page.dart';
import 'package:DressMeDaily/presentation/Notifications_page/notifications_page.dart';
import 'package:DressMeDaily/presentation/Password_change/password_change.dart';
import 'package:DressMeDaily/presentation/Password_mail/password_mail.dart';
import 'package:DressMeDaily/presentation/Profile_picture/profile_picture.dart';
import 'package:DressMeDaily/presentation/Settings/settings.dart';
import 'package:DressMeDaily/presentation/Signin_other_options/signin_other_options.dart';
import 'package:DressMeDaily/presentation/Signup_new_user/signup_new_user.dart';
import 'package:DressMeDaily/presentation/Signup_old_user/signup_old_user.dart';
import 'package:DressMeDaily/presentation/Signup_other_options/signup_other_options.dart';
import 'package:DressMeDaily/presentation/Starting_page/starting_page.dart';
import 'package:DressMeDaily/presentation/Subscription_after_purchase/subscription_after_purchase_page.dart';
import 'package:DressMeDaily/presentation/Subscription_page/subscription_page.dart';
import 'package:DressMeDaily/presentation/Subscription_page_confirmation/subscription_page_confirmation.dart';
import 'package:DressMeDaily/presentation/Thank_popup/thank_popup.dart';
import 'package:DressMeDaily/presentation/Themes_page/themes_page.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/presentation/Washing_reminder_page/Washing_reminder_page.dart';
import 'package:DressMeDaily/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:DressMeDaily/presentation/frame_293_screen/frame_293_screen.dart';
import 'package:DressMeDaily/presentation/frame_404_bottomsheet/frame_404_bottomsheet.dart';
import 'package:DressMeDaily/presentation/frame_405_bottomsheet/frame_405_bottomsheet.dart';
import 'package:DressMeDaily/presentation/frame_406_bottomsheet/frame_406_bottomsheet.dart';
import 'package:DressMeDaily/presentation/frame_675_screen/frame_675_screen.dart';
import 'package:DressMeDaily/presentation/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/presentation/starting_page_signup/starting_page_signup.dart';
import '../presentation/Calendar_page/Calendar_page.dart';
import '../presentation/Event_day_Page/Event_day_page.dart';
import '../presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/Contact_us/contact_us.dart';

class AppRoutes {
  static const String initial_loading_page = '/initial_loading_page';

  static const String main_settings = '/main_settings';

  static const String frame851Page = '/frame_851_page';

  static const String main_wardrobe = '/Main_wardrobe';

  static const String contact_us = '/contact_us';

  static const String calendar_page = '/Calendar_page';

  static const String event_day_page = '/Event_day_Page';

  static const String Outfit_page = '/Outfit_page';

  static const String frame926Page = '/Plan_Page';

  static const String frame941Page = '/frame_941_page';

  static const String washing_reminder_page = '/Washing_reminder_page';

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

  static const String subscription_after_purchase_page =
      '/subscription_after_purchase_page';

  static const String frame_642_screen = '/frame_642_screen';

  static const String faq_page = '/faq_page';

  static const String thank_popup = '/thank_popup';

  static const String frame_623_screen = '/frame_623_screen';

  static const String frame_637_screen = '/frame_637_screen';

  static const String notice_page = '/notice_page';

  static const String subscription_page_confirmation =
      '/subscription_page_confirmation';

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
    main_wardrobe: (context) => Main_wardrobe(),
    calendar_page: (context) => Calendar_page(),
    washing_reminder_page: (context) => Washing_reminder_page(),
    event_day_page: (context) => Event_day_page(selectedDate: DateTime.now()),
    // This will need to be changed when navigating
    body_selection_female: (context) => const Bodyselectionfemale(),
    loading_page_4: (context) => const Loading_page_4(),
    contact_us: (context) => const Contact_us(),
    bookmark_page: (context) => Bookmark_page(),
    user_profile: (context) =>  User_profile(),
    frame_404_bottomsheet: (context) => const Frame404Bottomsheet(),
    frame_405_bottomsheet: (context) => const Frame405Bottomsheet(),
    frame_406_bottomsheet: (context) => const Frame406Bottomsheet(),
    settings: (context) => const Settings(),
    notifications_page: (context) => Notifications_page(),
    subscription_page: (context) => const Subscription_page(),
    subscription_after_purchase_page: (context) =>
        const Subscription_after_purchase(),
    notice_page: (context) => const Notice_page(),
    faq_page: (context) => const FAQ_Page(),
    thank_popup: (context) => const Thank_popup(),
    landing_page_2: (context) => const Landing_page_2(),
    invite_friends: (context) => const Invite_friends(),
    feedback_popup: (context) => Feedback_popup(),
    themes_page: (context) => const Themes_page(),
    subscription_page_confirmation: (context) =>
        const Subscription_page_confirmation(),
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
