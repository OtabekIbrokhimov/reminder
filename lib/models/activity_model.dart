class Notes {
  String? title;
  String? content;
  DateTime? starTime;
  int? colorIndex;

  Notes({this.title, this.content, this.starTime, this.colorIndex});

  Notes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    starTime = DateTime.parse(json['starTime']);
    colorIndex = json['colorIndex'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'colorIndex': colorIndex,
        'starTime': starTime.toString(),
      };
}
