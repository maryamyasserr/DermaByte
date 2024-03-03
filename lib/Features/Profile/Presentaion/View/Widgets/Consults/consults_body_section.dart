import 'package:dermabyte/Features/Profile/Data/Models/patient_consults/patient_consults.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/medication.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/test_requsted.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/treatment_plan.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Consults%20Cubit/consults_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultsBodySection extends StatelessWidget {
  const ConsultsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    PatientConsultsModel consultaion= BlocProvider.of<ConsultsCubit>(context).currentConsultation; 
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          consultaion.tests!.isEmpty? const SizedBox():const TestRequested(),
          const SizedBox(height: 8),
          consultaion.medicine==null? const SizedBox():const Medications(),
          const SizedBox(height: 8),
          consultaion.treatmentPlan==null? const SizedBox():const TreatmentPlan(),
           
        ],
      ),
    );
  }
}

