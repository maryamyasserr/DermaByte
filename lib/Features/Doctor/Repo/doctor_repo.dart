import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_reservaion_model/my_reservaion_model.dart';

abstract class DoctorRepo {
  Future<Either<Failures, List<MyReservaionModel>>> getMyReservation({
    required String token
  });
}
