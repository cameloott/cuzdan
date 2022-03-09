import 'package:cloud_firestore/cloud_firestore.dart';

class OnboardModel {
  final String onboard;
  final String header;
  final String title;
  final String imageUrl;

  OnboardModel(
      {required this.onboard,
      required this.header,
      required this.title,
      required this.imageUrl});

  OnboardModel.fromJson(Map<String,dynamic> json) :
    onboard = json['onboard'],
    header = json['header'],
    title = json['title'],
    imageUrl =  json['imageUrl'];


  Map<String, dynamic> toJson() => {
        'onboard': onboard,
        'header': header,
        'title': title,
        'imageUrl': imageUrl,
      };
}
