import 'package:dermabyte/Core/Widgets/custom_screen.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View/admin_view.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/sign_up_as_view.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/sign_up_doctor.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/sign_in.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/sign_up_lab.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/sign_up_patient.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Home/patient_view.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Report/report_view.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/e_doctor_view.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/doctor_reservation_view.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/doctor_schedule_view.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/lab_reservation_view.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/lab_details_view.dart';
import 'package:dermabyte/Features/Home/View/home_view.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/request_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/lab._view.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/service_selection_view.dart';
import 'package:dermabyte/Features/Notification/View/notification_view.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/appoinments_view.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/follow_up_view.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/requested_tests_view.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/upcoming_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/account_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/address_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/consults_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/credit_card_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/disease_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/edit_profile.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/help_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/history_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/profile_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/settings_view.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/test_view.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View/camera_view.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View/scan_progress_view.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View/scan_ways_view.dart';
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
  static String kHomeView = '/HomeView';
  static String kLabDetails = '/ScanView';
  static String kLabReservationView = '/LabReservationView';
  static String kDoctorReservationView = '/DoctorReservationView';
  static String kScanWaysView = '/ScanWaysView';
  static String kCameraView = '/CameraView';
  static String kServiceSelectionView = '/ServiceSelectionView';
  static String kCustomScreen = '/CustomScreen';
  static String kSignUpAs = '/SignUpAs';
  static String kDisease = '/disease';
  static String kConsults = '/consults';
  static String kCreditCard = '/creditcard';
  static String kAddress = '/Address';
  static String kSettings = '/settings';
  static String kHelp = '/help';
  static String kAccount = '/account';
  static String kEditProfile = '/editProfile';
  static String kNotification = '/notification';
  static String kLabHome = '/e-lab_home';
  static String kRequestBody = '/requestBody';
  static String kDoctorView = '/e-doctor';
  static String kPatientView = '/patientView';
  static String kReportView = '/ReportView';
  static String kDoctorScheduleView = '/DoctorScheduleView';
  static String kTestView = '/testView';
  static String kRequestedTest = '/requestedTests';
  static String kScanProgress = '/scanProgress';
  static String kAdminView = '/adminView';
  static final router = GoRouter(routes: [
    // GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/', builder: (context, state) => const AdminView()),
    GoRoute(path: kFollowUp, builder: (context, state) => const FollowUpView()),
    GoRoute(path: kUpcoming, builder: (context, state) => const UpComingView()),
    GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
    GoRoute(path: kSplash, builder: (context, state) => const SplashView()),
    GoRoute(
        path: kAppoinments,
        builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro, builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn, builder: (context, state) => const SignIn()),
    GoRoute(path: kHistory, builder: (context, state) => const HistoryView()),
    GoRoute(
        path: kSignUpPatient,
        builder: (context, state) => const SignUpPatient()),
    GoRoute(
        path: kSignUpDoctor, builder: (context, state) => const SignUpDoctor()),
    GoRoute(path: kSignUpLab, builder: (context, state) => const SignUpLab()),
    GoRoute(
        path: kAppoinments,
        builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro, builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn, builder: (context, state) => const SignIn()),
    GoRoute(
        path: kSignUpPatient,
        builder: (context, state) => const SignUpPatient()),
    GoRoute(
        path: kSignUpDoctor, builder: (context, state) => const SignUpDoctor()),
    GoRoute(path: kSignUpLab, builder: (context, state) => const SignUpLab()),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(
        path: kLabDetails, builder: (context, state) => const LabDetailsView()),
    GoRoute(
        path: kLabReservationView,
        builder: (context, state) => const LabReservationView()),
    GoRoute(
        path: kDoctorReservationView,
        builder: (context, state) => const DoctorReservationView()),
    GoRoute(
        path: kScanWaysView, builder: (context, state) => const ScanWaysView()),
    GoRoute(path: kCameraView, builder: (context, state) => const CameraView()),
    GoRoute(
        path: kCustomScreen, builder: (context, state) => const CustomScreen()),
    GoRoute(
        path: kServiceSelectionView,
        builder: (context, state) => const ServiceSelectionView()),
    GoRoute(path: kSignUpAs, builder: (context, state) => const SignUpAsView()),
    GoRoute(path: kDisease, builder: (context, state) => const DiseaseView()),
    GoRoute(path: kConsults, builder: (context, state) => const ConsultsView()),
    GoRoute(
        path: kCreditCard, builder: (context, state) => const CreditCardView()),
    GoRoute(path: kSettings, builder: (context, state) => const SettingsView()),
    GoRoute(path: kAccount, builder: (context, state) => const AccountView()),
    GoRoute(path: kAddress, builder: (context, state) => const AddressView()),
    GoRoute(path: kHelp, builder: (context, state) => const HelpView()),
    GoRoute(
        path: kEditProfile, builder: (context, state) => const EditProfile()),
    GoRoute(
        path: kAppoinments,
        builder: (context, state) => const AppoinmentsView()),
    GoRoute(
        path: kAppoinments,
        builder: (context, state) => const AppoinmentsView()),
    GoRoute(path: kAppIntro, builder: (context, state) => const AppIntro()),
    GoRoute(path: kSignIn, builder: (context, state) => const SignIn()),
    GoRoute(path: kHistory, builder: (context, state) => const HistoryView()),
    GoRoute(path: kDisease, builder: (context, state) => const DiseaseView()),
    GoRoute(path: kConsults, builder: (context, state) => const ConsultsView()),
    GoRoute(
        path: kCreditCard, builder: (context, state) => const CreditCardView()),
    GoRoute(path: kSettings, builder: (context, state) => const SettingsView()),
    GoRoute(path: kAccount, builder: (context, state) => const AccountView()),
    GoRoute(path: kAddress, builder: (context, state) => const AddressView()),
    GoRoute(path: kHelp, builder: (context, state) => const HelpView()),
    GoRoute(
        path: kEditProfile, builder: (context, state) => const EditProfile()),
    GoRoute(
        path: kNotification,
        builder: (context, state) => const NotificationsView()),
    GoRoute(path: kLabHome, builder: (context, state) => const LabView()),
    GoRoute(
        path: kRequestBody, builder: (context, state) => const RequestBody()),
    GoRoute(path: kDoctorView, builder: (context, state) => const DoctorView()),
    GoRoute(
        path: kPatientView, builder: (context, state) => const PatientView()),
    GoRoute(path: kReportView, builder: (context, state) => const ReportView()),
    GoRoute(
        path: kDoctorScheduleView,
        builder: (context, state) => const DoctorScheduleView()),
    GoRoute(path: kTestView, builder: (context, state) => const TestView()),
    GoRoute(
      path: kRequestedTest,
      builder: (context, state) => const RequestedTestsView(),
    ),
    GoRoute(
        path: kScanProgress,
        builder: (context, state) => const ScanProgressView()),
  ]);
}
