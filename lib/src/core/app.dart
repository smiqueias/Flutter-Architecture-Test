import 'package:flutter/material.dart';
import 'package:flutter_architecture_test/src/core/theme/app_theme.dart';
import 'package:flutter_architecture_test/src/modules/heart-specialist/presenter/sceens/heart-specialist/heart_specialist_screen.dart';
import 'package:flutter_architecture_test/src/modules/home/presenter/screens/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => MaterialApp(
        title: "Flutter architecture test",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppTheme.colors.white,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              onPrimary: AppTheme.colors.white,
              primary: AppTheme.colors.redDark,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0.r)),
            ),
          ),
          scaffoldBackgroundColor: AppTheme.colors.white,
        ),
        initialRoute: "/",
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          HeartSpecialistScreen.routeName: (context) => HeartSpecialistScreen(),
        },
      ),
    );
  }
}
