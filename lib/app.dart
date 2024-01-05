import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knovator/providers/resume_provider.dart';
import 'package:knovator/routes/routes.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ResumeProvider(),
            )
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
          ),
        );
      },
    );
  }
}
