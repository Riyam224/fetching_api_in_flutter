// ignore_for_file: deprecated_member_use

import 'package:api_app/data/models/post_model.dart';
import 'package:api_app/data/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial()) {
    fetchPosts();
  }

  PostRepo postRepo = PostRepo();
  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepo.fetchPosts();
      emit(PostSuccess(posts));
    } on DioError catch (e) {
      emit(PostFailure(e.message.toString()));
    }
  }
}
