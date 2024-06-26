import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_up_doctor_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpDoctor extends StatelessWidget {
  const SignUpDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              failedAlert(context, state.errMessage);
            }
          },
          child: const SignUpDoctorBody()),
    );
  }
}
