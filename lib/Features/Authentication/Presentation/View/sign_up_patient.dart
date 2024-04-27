import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/sign_up_patient_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPatient extends StatelessWidget {
  const SignUpPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showSnackBar(context, state.errMessage);
              } 
            },
            child: const SignUpPatientBody()));
  }
}
