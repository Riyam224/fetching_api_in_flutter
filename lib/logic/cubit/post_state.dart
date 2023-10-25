part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostFailure extends PostState {
  final String errMessage;

  PostFailure(this.errMessage);
}

final class PostSuccess extends PostState {
  final List<PostModel> posts;

  PostSuccess(this.posts);
}
