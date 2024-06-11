// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:juneeight/model/news_model.dart';

class NewsState extends Equatable {
  final NewsModel? newsModel;
  final NewsStateEnum? newsStateEnum;
  final String? errorMessage;

  const NewsState({
    this.newsModel,
    this.newsStateEnum,
    this.errorMessage = "keii",
  });

  @override
  // TODO: implement props
  List<Object?> get props => [newsModel, newsStateEnum, errorMessage];

  NewsState copyWith({
    NewsModel? newsModel,
    NewsStateEnum? newsStateEnum,
    String? errorMessage,
  }) {
    return NewsState(
      newsModel: newsModel ?? this.newsModel,
      newsStateEnum: newsStateEnum ?? this.newsStateEnum,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum NewsStateEnum { loading, success, error, sending, sent, deleting }
