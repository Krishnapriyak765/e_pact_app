class AttendanceModel {
  final String name;
  final String role;
  final String checkInTime;
  final String checkOutTime;
  final String breakTime;
  final int totalDays;
  final String checkInHours;
  final String toCheckOut;

  AttendanceModel({
    required this.name,
    required this.role,
    required this.checkInTime,
    required this.checkOutTime,
    required this.breakTime,
    required this.totalDays,
    required this.checkInHours,
    required this.toCheckOut,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      name: json['name'],
      role: json['role'],
      checkInTime: json['check_in'],
      checkOutTime: json['check_out'],
      breakTime: json['break_time'],
      totalDays: json['total_days'],
      checkInHours: json['check_in_hours'],
      toCheckOut: json['to_check_out'],
    );
  }
}
