import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Appoinments/Data/Models/preservation_model/preservation_model.dart';

abstract class PreservationInfoRepo {
  Future<Either<Failures, List<PreservationModel>>> getPatientReservation({
    required dynamic id
  });
}
