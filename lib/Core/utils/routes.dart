import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
import 'package:dermabyte/Features/Appoinments/View/follow_up_view.dart';
import 'package:dermabyte/Features/Appoinments/View/upcoming_view.dart';
import 'package:dermabyte/Features/Authentication/View/sign_in.dart';
import 'package:dermabyte/Features/Profile/View/profile_view.dart';
<<<<<<< HEAD
=======
import 'package:dermabyte/Features/Splash/View/intro_view.dart';
>>>>>>> ae11fd180a845859b5b21db0ce27ad146a507ff8
import 'package:dermabyte/Features/Splash/View/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static String kFollowUp = '/followUp';
  static String kUpcoming = '/Upcoming';
  static String kProfile = '/profile';
<<<<<<< HEAD
  static String kSplash = '/splash';
=======
  static String kSplash = '/Splash';
  static String kAppoinments = '/Appoinments';
  static String kAppIntro = '/AppIntro';
  static String kSignIn = '/SignIn';
>>>>>>> ae11fd180a845859b5b21db0ce27ad146a507ff8

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kFollowUp, builder: (context, state) => const FollowUpView()),
    GoRoute(path: kUpcoming, builder: (context, state) => const UpComingView()),
    GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
    GoRoute(path: kSplash, builder: (context, state) => const SplashView()),
<<<<<<< HEAD

=======
    GoRoute(path: kAppoinments , builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro , builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn , builder: (context, state) => const SignIn()),
>>>>>>> ae11fd180a845859b5b21db0ce27ad146a507ff8

  ]);
}
