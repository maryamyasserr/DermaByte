import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
import 'package:dermabyte/Features/Appoinments/View/follow_up_view.dart';
import 'package:dermabyte/Features/Appoinments/View/upcoming_view.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up_doctor.dart';
import 'package:dermabyte/Features/Authentication/View/sign_in.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up_lab.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up_patient.dart';
import 'package:dermabyte/Features/Profile/View/history.dart';
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
  static String kSignUpPatient = '/SignUpPatient';
  static String kHistory = '/history';
  static String kSignUpDoctor = '/SignUpDoctor';
  static String kSignUpLab = '/SignUpLab';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SignUpLab()),
    GoRoute(path: '/', builder: (context, state) => const ProfileView()),
    GoRoute(path: kFollowUp, builder: (context, state) => const FollowUpView()),
    GoRoute(path: kUpcoming, builder: (context, state) => const UpComingView()),
    GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
    GoRoute(path: kSplash, builder: (context, state) => const SplashView()),
    GoRoute(path: kAppoinments , builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro , builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn , builder: (context, state) => const SignIn()),
    GoRoute(path: kHistory , builder: (context, state) => const HistoryView()),
    GoRoute(path: kSignUpPatient , builder: (context, state) => const SignUpPatient()),
    GoRoute(path: kSignUpDoctor , builder: (context, state) => const SignUpDoctor()),
    GoRoute(path: kSignUpLab , builder: (context, state) => const SignUpLab()),

  ]);
}