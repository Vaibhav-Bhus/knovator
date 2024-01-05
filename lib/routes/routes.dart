import 'package:go_router/go_router.dart';
import 'package:knovator/screens/resume_form_screen.dart';
import 'package:knovator/screens/resume_screen.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        int? index = state.extra as int?;
        return ResumeFormScreen(
          index: index,
        );
      },
      routes: [
        GoRoute(
          path: 'resumeviewer',
          builder: (context, state) {
            return const ResumeScreen();
          },
          routes: const [],
        ),
      ], 
    ),
  ],
);
