import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String? composer;
  String? comment;
  DateTime? timeStamp;
  CommentModel({this.composer, this.comment});

  CommentModel.fromJson(Map<String, dynamic> json)
      : composer = json['composer'],
        comment = json['comment'],
        timeStamp = DateTime.parse(json['timeStamp'].toDate().toString());
  toJson() {
    return {"composer": composer, "comment": comment, "timeStamp": timeStamp};
  }
}
