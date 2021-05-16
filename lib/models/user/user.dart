class User {
  final int id;
  final String name, avatar, description, coverImage;

  User({
    this.id,
    this.name,
    this.avatar,
    this.description,
    this.coverImage,
  });

  factory User.fromJSON(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        name: json['name'] as String,
        avatar: json['avatar'] as String,
        description: json['description'] as String,
        coverImage: json['cover_image'] as String,
      );
}
