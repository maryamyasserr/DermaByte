import 'package:dermabyte/Core/Widgets/custom_screen.dart';
import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
import 'package:dermabyte/Features/Appoinments/View/follow_up_view.dart';
import 'package:dermabyte/Features/Appoinments/View/upcoming_view.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up_doctor.dart';
import 'package:dermabyte/Features/Authentication/View/sign_in.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up_lab.dart';
import 'package:dermabyte/Features/Authentication/View/sign_up_patient.dart';
import 'package:dermabyte/Features/E-doctor/View/doctor_reservation_view.dart';
import 'package:dermabyte/Features/E-lab/View/lab_reservation_view.dart';
import 'package:dermabyte/Features/E-lab/View/scan_view.dart';
import 'package:dermabyte/Features/Home/View/home_view.dart';
import 'package:dermabyte/Features/Profile/View/profile_view.dart';
import 'package:dermabyte/Features/Scan/View/camera_view.dart';
import 'package:dermabyte/Features/Scan/View/scan_ways_view.dart';
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
  static String kSignUpDoctor = '/SignUpDoctor';
  static String kSignUpLab = '/SignUpLab';
  static String kHomeView = '/HomeView';
  static String kScanView = '/ScanView';
  static String kLabReservationView = '/LabReservationView';
  static String kDoctorReservationView = '/DoctorReservationView';
  static String kScanWaysView = '/ScanWaysView';
  static String kCameraView = '/CameraView';


  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SignUpDoctor()),
    GoRoute(path: kFollowUp, builder: (context, state) => const FollowUpView()),
    GoRoute(path: kUpcoming, builder: (context, state) => const UpComingView()),
    GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
    GoRoute(path: kSplash, builder: (context, state) => const SplashView()),
    GoRoute(path: kAppoinments,builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro, builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn, builder: (context, state) => const SignIn()),
    GoRoute(path: kSignUpPatient, builder: (context, state) => const SignUpPatient()),
    GoRoute(path: kSignUpDoctor, builder: (context, state) => const SignUpDoctor()),
    GoRoute(path: kSignUpLab, builder: (context, state) => const SignUpLab()),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(path: kScanView, builder: (context, state) => const ScanView()),
    GoRoute(path: kLabReservationView, builder: (context, state) => const LabReservationView()),
    GoRoute(path: kDoctorReservationView, builder: (context, state) => const DoctorReservationView()),
    GoRoute(path: kScanWaysView, builder: (context, state) => const ScanWaysView()),
    GoRoute(path: kCameraView, builder: (context, state) => const CameraView()),
  ]);
}
