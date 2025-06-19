import 'package:e_pact_app/features/employee/home/model/home_model.dart';

class AttendanceViewModel {
  AttendanceModel? model;

  Future<void> fetchAttendance() async {
    // Simulated response
    await Future.delayed(Duration(seconds: 1));
    model = AttendanceModel(
      name: "Vinith Kumar",
      role: "Lead UI/UX Designer",
      checkInTime: "09:20 am",
      checkOutTime: "00:00 pm",
      breakTime: "00:30 min",
      totalDays: 28,
      checkInHours: "05.30 mins",
      toCheckOut: "02.30 mins",
    );
  }
}
