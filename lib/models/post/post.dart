class Post {
  final int id;
  final String described;

  Post({
    this.id,
    this.described,
  });

  factory Post.fromJSON(Map<String, dynamic> json) => Post(
        id: json['id'] as int,
        described: json['described'] as String,
      );
}
