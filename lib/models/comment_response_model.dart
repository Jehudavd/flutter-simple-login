class CommentResponseModel {
  DataResponse? data;

  CommentResponseModel({this.data});

  CommentResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DataResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataResponse {
  int? id;
  String? subject;
  String? comment;

  DataResponse({this.id, this.subject, this.comment});

  DataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subject'] = subject;
    data['comment'] = comment;
    return data;
  }
}