class CommentModel {
  List<Data>? data;

  CommentModel({this.data});

  CommentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? subject;
  String? comment;

  Data({this.id, this.subject, this.comment});

  Data.fromJson(Map<String, dynamic> json) {
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