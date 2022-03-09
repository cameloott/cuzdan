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

  // static OnboardModel fromDocumentSnapshot(DocumentSnapshot snapshot) {
  //   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //   return OnboardModel(
  //       onboard: data['onboard'],
  //       header: data['header'],
  //       title: data['title'],
  //       imageUrl: data['imageUrl']);
  // }

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
