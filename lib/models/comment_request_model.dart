class CommentRequestModel {
  String? subject;
  String? comment;

  CommentRequestModel({this.subject, this.comment});

  CommentRequestModel.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['comment'] = comment;
    return data;
  }
}