import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
import 'package:dermabyte/Features/Appoinments/View/follow_up_view.dart';
import 'package:dermabyte/Features/Appoinments/View/upcoming_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static String kFollowUp = '/followUp';
  static String kUpcoming = '/Upcoming';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context,state)=>const AppoinmentsView()
        ),
      GoRoute(
        path: kFollowUp,
        builder: (context,state)=> const FollowUpView()
        ),
      GoRoute(
        path: kUpcoming,
        builder: (context,state)=>const UpComingView()
        )
    ]
    );
}
