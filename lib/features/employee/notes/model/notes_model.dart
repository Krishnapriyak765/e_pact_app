class NotesModel {
  final String message;
  final String time;
  final bool isSender;

  NotesModel({
    required this.message,
    required this.time,
    required this.isSender,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      message: json['message'] ?? '',
      time: json['time'] ?? '',
      isSender: json['isSentByUser'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'time': time, 'isSentByUser': isSender};
  }
}
