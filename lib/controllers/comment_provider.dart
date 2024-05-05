import 'package:flutter/material.dart';
import 'package:flutter_app_course/models/comment_model.dart';
import 'package:dio/dio.dart';

class CommentProvider extends ChangeNotifier {
  List<Data>? listComment;
  var state = CommentState.initial;

  Future getProduct() async {
    var response = await Dio().get('http://10.0.2.2:8080/api/comment');
    var result = CommentModel.fromJson(response.data);
    if (result.data!.isEmpty) {
      state = CommentState.nodata;
    } else {
      state = CommentState.success;
      listComment = result.data;
    }
    notifyListeners();
  }
}

enum CommentState { initial, loading, success, error, nodata }