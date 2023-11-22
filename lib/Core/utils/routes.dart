import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
import 'package:dermabyte/Features/Appoinments/View/follow_up_view.dart';
import 'package:dermabyte/Features/Appoinments/View/upcoming_view.dart';
import 'package:dermabyte/Features/Authentication/View/sign_in.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up.dart';
import 'package:dermabyte/Features/Profile/View/profile_view.dart';
import 'package:dermabyte/Features/Splash/View/intro_view.dart';
import 'package:dermabyte/Features/Splash/View/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static String kFollowUp = '/followUp';
  static String kUpcoming = '/Upcoming';
  static String kProfile = '/profile';
  static String kSplash = '/Splash';
  static String kAppoinments = '/Appoinments';
  static String kAppIntro = '/AppIntro';
  static String kSignIn = '/SignIn';
  static String kSignUp = '/SignUp';
  static String kHistory = '/history';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const ProfileView()),
    GoRoute(path: kFollowUp, builder: (context, state) => const FollowUpView()),
    GoRoute(path: kUpcoming, builder: (context, state) => const UpComingView()),
    GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
    GoRoute(path: kSplash, builder: (context, state) => const SplashView()),
    GoRoute(path: kAppoinments , builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro , builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn , builder: (context, state) => const SignIn()),
    GoRoute(path: kSignUp , builder: (context, state) => const SignUp()),

  ]);
}