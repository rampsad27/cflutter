// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final String caption;
  final int postedby;
  final String username;
  final bool isVerified;
  final String pprofileImage;
  final String imageUrl;
  final String? videoUrl;
  final int likeCount;
  final String commentCount;
  final bool isSaved;
  bool isLiked;

  PostModel({
    required this.caption,
    required this.postedby,
    required this.username,
    required this.isVerified,
    required this.pprofileImage,
    required this.imageUrl,
    required this.videoUrl,
    required this.likeCount,
    required this.commentCount,
    required this.isSaved,
    required this.isLiked,
  });

  PostModel copyWith({bool? isLiked, int? likeCount}) {
    return PostModel(
        caption: caption,
        postedby: postedby,
        username: username,
        isVerified: isVerified,
        pprofileImage: pprofileImage,
        imageUrl: imageUrl,
        videoUrl: videoUrl,
        likeCount: likeCount ?? this.likeCount,
        commentCount: commentCount,
        isSaved: isSaved,
        isLiked: isLiked ?? this.isLiked);
  }
}
