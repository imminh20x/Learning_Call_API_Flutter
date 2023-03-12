class Post {
  int? id;
  String? title;
  String? body;

  Post({this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'body': body};
  }
}
