class Post {
  final int id, like;
  final String described, createdAt;
  final bool isLiked;
  final dynamic images;

  Post({
    this.id,
    this.described,
    this.createdAt,
    this.like,
    this.isLiked,
    this.images,
  });

  factory Post.fromJSON(Map<String, dynamic> json) => Post(
        id: json['id'] as int,
        described: json['described'] as String,
        createdAt: json['created_at'] as String,
        like: json['like'] as int,
        isLiked: json['isLiked'] as bool,
        images: json['images'] as dynamic,
      );
}
