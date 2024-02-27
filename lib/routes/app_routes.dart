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
import 'package:sdgp_test01/presentation/frame_312_screen/frame_312_screen.dart';
import 'package:sdgp_test01/presentation/frame_624_draweritem/frame_624_draweritem.dart';
import 'package:sdgp_test01/presentation/frame_629_screen/frame_629_screen.dart';
import 'package:sdgp_test01/presentation/frame_634_dialog/frame_634_dialog.dart';
import 'package:sdgp_test01/presentation/frame_636_screen/frame_636_screen.dart';
import 'package:sdgp_test01/presentation/frame_638_screen/frame_638_screen.dart';
import 'package:sdgp_test01/presentation/frame_674_screen/frame_674_screen.dart';
import 'package:sdgp_test01/presentation/frame_633_screen/frame_633_screen.dart';
import 'package:sdgp_test01/presentation/frame_640_screen/frame_640_screen.dart';
import 'package:sdgp_test01/presentation/frame_623_screen/frame_623_screen.dart';
import 'package:sdgp_test01/presentation/frame_637_screen/frame_637_screen.dart';
import 'package:sdgp_test01/presentation/frame_639_screen/frame_639_screen.dart';
import 'package:sdgp_test01/presentation/frame_680_screen/frame_680_screen.dart';
import 'package:sdgp_test01/presentation/frame_641_screen/frame_641_screen.dart';
import 'package:sdgp_test01/presentation/frame_642_screen/frame_642_screen.dart';
import 'package:sdgp_test01/presentation/frame_644_screen/frame_644_screen.dart';
import 'package:sdgp_test01/presentation/frame_645_dialog/frame_645_dialog.dart';
import 'package:sdgp_test01/presentation/frame_646_dialog/frame_646_dialog.dart';
import 'package:sdgp_test01/presentation/frame_647_dialog/frame_647_dialog.dart';
import 'package:sdgp_test01/presentation/frame_648_screen/frame_648_screen.dart';
import 'package:sdgp_test01/presentation/frame_649_screen/frame_649_screen.dart';
import 'package:sdgp_test01/presentation/frame_650_screen/frame_650_screen.dart';
import 'package:sdgp_test01/presentation/frame_651_dialog/frame_651_dialog.dart';
import 'package:sdgp_test01/presentation/frame_652_dialog/frame_652_dialog.dart';
import 'package:sdgp_test01/presentation/frame_653_dialog/frame_653_dialog.dart';
import 'package:sdgp_test01/presentation/frame_675_screen/frame_675_screen.dart';
import 'package:sdgp_test01/presentation/frame_390_screen/frame_390_screen.dart';
import 'package:sdgp_test01/presentation/frame_395_page/frame_395_page.dart';

import 'package:sdgp_test01/presentation/Loading_page_4(initialLoadingScreen)/loading_page_4.dart';
import 'package:sdgp_test01/presentation/Body_selection_female/body_selection_female.dart';
import 'package:sdgp_test01/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String initial_loading_page = '/initial_loading_page';

  static const String frame_624_draweritem = '/frame_624_draweritem';

  static const String body_selection_female = '/body_selection_female';

  static const String loading_page_3 = '/loading_page_3';

  static const String frame_633_screen = '/frame_633_screen';

  static const String loading_page_4 = '/loading_page_4';

  static const String frame_390_screen = '/frame_390_screen';

  static const String frame_395_page = '/frame_395_page';

  static const String frame_640_screen = '/frame_640_screen';

  static const String frame_680_screen = '/frame_680_screen';

  static const String frame_642_screen = '/frame_642_screen';

  static const String frame_644_screen = '/frame_644_screen';

  static const String frame_645_dialog = '/frame_645_dialog';

  static const String frame_623_screen = '/frame_623_screen';

  static const String frame_637_screen = '/frame_637_screen';

  static const String frame_638_screen = '/frame_638_screen';

  static const String frame_646_dialog = '/frame_646_dialog';

  static const String frame_647_dialog = '/frame_647_dialog';

  static const String frame_648_screen = '/frame_648_screen';

  static const String frame_649_screen = '/frame_649_screen';

  static const String frame_650_screen = '/frame_650_screen';

  static const String frame_651_dialog = '/frame_651_dialog';

  static const String frame_652_dialog = '/frame_652_dialog';

  static const String frame_653_dialog = '/frame_653_dialog';

  static const String frame_674_screen = '/frame_674_screen';

  static const String frame_675_screen = '/frame_675_screen';

  static const String frame_639_screen = '/frame_639_screen';

  static const String frame_629_screen = '/frame_629_screen';

  static const String frame_634_dialog = '/frame_634_dialog';

  static const String frame_636_screen = '/frame_636_screen';

  static const String frame_641_screen = '/frame_641_screen';

  static const String body_selection_male = '/body_selection_male';

  static const String frame293Screen = '/frame_293_screen';

  static const String frame312Screen = '/frame_312_screen';

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

    initial_loading_page: (context) => Initial_loading_page(),
    frame_624_draweritem: (context) => Frame624Screen(),
    body_selection_female: (context) => Bodyselectionfemale(),
    loading_page_4: (context) => Loading_page_4(),
    frame_390_screen: (context) => Frame390screen(),
    frame_395_page: (context) => Frame395Page(),
    frame_633_screen: (context) => Frame633Screen(),
    frame_629_screen: (context) => Frame629Screen(),
    frame_640_screen: (context) => Frame640Screen(),
    frame_642_screen: (context) => Frame642Screen(),
    frame_680_screen: (context) => Frame680Screen(),
    frame_638_screen: (context) => Frame638Screen(),
    frame_644_screen: (context) => Frame644Screen(),
    frame_645_dialog: (context) => Frame645Dialog(),
    frame_639_screen: (context) => Frame639Screen(),
    frame_641_screen: (context) => Frame641Screen(),
    frame_623_screen: (context) => Frame623Screen(),
    frame_647_dialog: (context) => Frame647Dialog(),
    frame_648_screen: (context) => Frame648Screen(),
    frame_649_screen: (context) => Frame649Screen(),
    frame_650_screen: (context) => Frame650Screen(),
    frame_651_dialog: (context) => Frame651Dialog(),
    frame_652_dialog: (context) => Frame652Dialog(),
    frame_653_dialog: (context) => Frame653Dialog(),
    frame_674_screen: (context) => Frame674Screen(),
    frame_637_screen: (context) => Frame637Screen(),
    frame_634_dialog: (context) => Frame634Dialog(),
    frame_636_screen: (context) => Frame636Screen(),
    frame_646_dialog: (context) => Frame646Dialog(),
    frame_675_screen: (context) => Frame675Screen(),
    body_selection_male: (context) => Body_selection_male(),
    loading_page_3: (context) => Loading_page_3(),
    frame312Screen: (context) => Frame312Screen(),
    gender_selection: (context) => Gender_selection(),
    starting_page: (context) => Starting_page(),
    loading_page_1: (context) => Loading_page_1(),
    login_page_1: (context) => Login_page_1(),
    loading_page_2: (context) => Loading_page_2(),
    signup_other_options: (context) => Signup_other_options(),
    signup_new_user: (context) => Signup_new_user(),
    profile_picture: (context) => Profile_picture(),
    instructions_page: (context) => Instructions_page(),
    frame293Screen: (context) => Frame293Screen(),
    starting_page_signup: (context) => Starting_page_signup(),
    signin_other_options: (context) => Signin_other_options(),
    signup_old_user: (context) => Signup_old_user(),
    password_change: (context) => Password_change(),
    password_mail: (context) => Password_mail(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
