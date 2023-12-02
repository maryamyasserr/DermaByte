import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
import 'package:dermabyte/Features/Appoinments/View/follow_up_view.dart';
import 'package:dermabyte/Features/Appoinments/View/upcoming_view.dart';
import 'package:dermabyte/Features/Authentication/View/sign_in.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up.dart';
import 'package:dermabyte/Features/E-Doctor/View/e_doctor_view.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/Home/request_body.dart';
import 'package:dermabyte/Features/E-Lab/View/e-lab._view.dart';
import 'package:dermabyte/Features/Notification/View/notification_view.dart';
import 'package:dermabyte/Features/Profile/View/account_view.dart';
import 'package:dermabyte/Features/Profile/View/address_view.dart';
import 'package:dermabyte/Features/Profile/View/consults_view.dart';
import 'package:dermabyte/Features/Profile/View/credit_card_view.dart';
import 'package:dermabyte/Features/Profile/View/disease_view.dart';
import 'package:dermabyte/Features/Profile/View/edit_profile.dart';
import 'package:dermabyte/Features/Profile/View/help_view.dart';
import 'package:dermabyte/Features/Profile/View/history_view.dart';
import 'package:dermabyte/Features/Profile/View/profile_view.dart';
import 'package:dermabyte/Features/Profile/View/settings_view.dart';
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
  static String kDisease = '/disease';
  static String kConsults = '/consults';
  static String kCreditCard = '/creditcard';
  static String kAddress = '/Address';
  static String kSettings = '/settings';
  static String kHelp = '/help';
  static String kAccount = '/account';
  static String kEditProfile = '/editProfile';
  static String kNotification = '/notification';
  static String kElabHome = '/e-lab_home';
  static String kRequestBody = '/requestBody';
  static String kEdoctor = '/e-doctor';

  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const EdoctorView()),
    // GoRoute(path: '/', builder: (context, state) => const ELabView()),
    // GoRoute(path: '/', builder: (context, state) => const ProfileView()),
    GoRoute(path: kFollowUp, builder: (context, state) => const FollowUpView()),
    GoRoute(path: kUpcoming, builder: (context, state) => const UpComingView()),
    GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
    GoRoute(path: kSplash, builder: (context, state) => const SplashView()),
    GoRoute(path: kAppoinments,builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro, builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn, builder: (context, state) => const SignIn()),
    GoRoute(path: kSignUp, builder: (context, state) => const SignUp()),
    GoRoute(path: kHistory, builder: (context, state) => const HistoryView()),
    GoRoute(path: kDisease, builder: (context, state) => const DiseaseView()),
    GoRoute(path: kConsults, builder: (context, state) => const ConsultsView()),
    GoRoute(path: kCreditCard, builder: (context, state) => const CreditCardView()),
    GoRoute(path: kSettings, builder: (context, state) => const SettingsView()),
    GoRoute(path: kAccount, builder: (context, state) => const AccountView()),
    GoRoute(path: kAddress, builder: (context, state) => const AddressView()),
    GoRoute(path: kHelp, builder: (context, state) => const HelpView()),
    GoRoute(path: kEditProfile, builder: (context, state) => const EditProfile()),
    GoRoute(path: kNotification,builder: (context, state) => const NotificationsView()),
    GoRoute(path: kElabHome, builder: (context, state) => const ELabView()),
    GoRoute(path: kRequestBody, builder: (context, state) => const RequestBody()),
    GoRoute(path: kEdoctor, builder: (context, state) => const EdoctorView()),
  ]);
}
