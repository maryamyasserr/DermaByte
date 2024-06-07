import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/lab_reseervation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';

class AllReservationModel {
  final List<PLabReservationModel> labReservations;
  final List<PreservationModel> doctorReservations;

  AllReservationModel({required this.labReservations, required this.doctorReservations});
}
