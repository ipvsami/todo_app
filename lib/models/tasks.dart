class Tasks {
  String title;
  bool isDone;

  Tasks({required this.title, required this.isDone});

  Map<String, dynamic> toJson() {
    return {'title': title, 'isDone': isDone};
  }

  factory Tasks.fromJson(Map<String, dynamic> json) {
    return Tasks(title: json['title'], isDone: json['isDone']);
  }
}
