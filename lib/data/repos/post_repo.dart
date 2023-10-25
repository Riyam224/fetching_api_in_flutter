import 'dart:convert';
import 'dart:math';

import 'package:api_app/data/models/post_model.dart';
import 'package:api_app/data/repos/api/api.dart';
import 'package:dio/dio.dart';

class PostRepo {
  API api = API();
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMaps) => PostModel.fromJson(postMaps)).toList();
    } catch (e) {
      throw (e);
    }
  }
}
