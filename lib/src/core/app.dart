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
          scaffoldBackgroundColor: AppTheme.colors.white,
        ),
        initialRoute: "/",
        routes: {
          '/': (context) => HomeScreen(),
          '/heart-specialist': (context) => const HeartSpecialistScreen(),
        },
      ),
    );
  }
}
