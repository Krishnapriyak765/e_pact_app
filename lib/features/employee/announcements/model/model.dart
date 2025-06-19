class Announcement {
  final String title;
  final String content;

  Announcement({required this.title, required this.content});

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(title: json['title'], content: json['content']);
  }
}
