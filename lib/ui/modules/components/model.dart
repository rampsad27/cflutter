// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final String postedby;
  final String location;
  final int likes;
  final String caption;
  final String comments;
  final String imageUrl;
  final String imagecUrl;
  bool isLiked;

  PostModel({
    required this.postedby,
    required this.location,
    required this.likes,
    required this.caption,
    required this.comments,
    required this.imageUrl,
    required this.imagecUrl,
    required this.isLiked,
  });

  PostModel copyWith({bool? isLiked}) {
    return PostModel(
        postedby: postedby,
        location: location,
        likes: likes,
        caption: caption,
        comments: comments,
        imageUrl: imageUrl,
        imagecUrl: imagecUrl,
        isLiked: isLiked ?? this.isLiked);
  }
}

class UserNameModel {
  final String email;

  UserNameModel({required this.email});
}

class UserProfileNameModel {
  final String name;
  final String username;
  final String bio;
  UserProfileNameModel({
    required this.name,
    required this.username,
    required this.bio,
  });
}
