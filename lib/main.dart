import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart';
import 'firebase_options.dart'; // Added from Code 2

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // From Code 2
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Update theme as needed
  ThemeHelper().changeTheme('primary');
  runApp(const MyApp()); // Using const constructor
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // const constructor from Code 1

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'sdgp_test01',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initial_loading_page,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
