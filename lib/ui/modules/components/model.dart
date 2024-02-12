class PostModel {
  final String postedby;
  final String location;
  final int likes;
  final String caption;
  final String comments;
  final String imageUrl;
  final String imagecUrl;

  PostModel({
    required this.postedby,
    required this.location,
    required this.likes,
    required this.caption,
    required this.comments,
    required this.imageUrl,
    required this.imagecUrl,
  });
}

class UserNameModel {
  final String email;

  UserNameModel({required this.email});
}

class UserProfileNameModel {
  final String name;
  final String username;
  UserProfileNameModel({required this.name, required this.username});
}
