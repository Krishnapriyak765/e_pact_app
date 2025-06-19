import 'package:e_pact_app/features/employee/home/view_model/view_model.dart';

class AttendanceController {
  final AttendanceViewModel viewModel;

  AttendanceController(this.viewModel);

  Future<void> loadAttendanceData() async {
    await viewModel.fetchAttendance();
  }
}
