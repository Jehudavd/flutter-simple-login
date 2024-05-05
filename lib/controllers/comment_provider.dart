import 'package:flutter/material.dart';
import 'package:flutter_app_course/models/comment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_course/models/comment_request_model.dart';
import 'package:flutter_app_course/models/comment_response_model.dart';

class CommentProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  List<Data>? listComment;
  var state = CommentState.initial;
  var messageError;

  Future getComment() async {
    try {
      var response = await Dio().get('http://10.0.2.2:8080/api/comment');
      var result = CommentModel.fromJson(response.data);
      if (result.data!.isEmpty) {
        state = CommentState.nodata;
      } else {
        state = CommentState.success;
        listComment = result.data;
      }
    } catch (e) {
      state = CommentState.error;
      messageError = e.toString();
    }
    notifyListeners();
  }

  Future insertComment(
    BuildContext context,
  ) async {
    try {
      var requestModel = FormData.fromMap({
        'subject': subjectController.text,
        'comment': commentController.text
      });
      var response = await Dio().post('http://10.0.2.2:8080/api/comment',
          data: requestModel,
          options: Options(contentType: 'multipart/form-data'));
      var result = CommentResponseModel.fromJson(response.data);
      if (result.data!.id != 0) {
        Navigator.pop(context);
        getComment();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Gagal insert"),
        ));
      }
    } catch (e) {
      messageError = e.toString();
    }
    notifyListeners();
  }
}

enum CommentState { initial, loading, success, error, nodata }