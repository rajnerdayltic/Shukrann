// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
// class ViewsModel extends Object with _$ViewsModelSerializerMixin {
//   int id;
//   int videoId;
//   int userId;

//   ViewsModel({
//     required this.id,
//     required this.videoId,
//     this.userId,
//   });

//   factory ViewsModel.fromJson(Map<String, dynamic> json) =>
//       _$ViewsModelFromJson(json);
//   static List<ViewsModel>? fromJsonList(List list) {
//     if (list == null) return null;
//     return list.map((item) => ViewsModel.fromJson(item)).toList();
//   }
// }

// ViewsModel _$ViewsModelFromJson(Map<String, dynamic> json) {
//   return new ViewsModel()
//     ..id = json['id'] as int
//     ..videoId = json['videoId'] as int
//     ..userId = json['userId'] as int;
// }

// abstract class _$ViewsModelSerializerMixin {
//   int get id;
//   int get videoId;
//   int get userId;

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'id': id,
//         'videoId': videoId,
//         'userId': userId,
//       };
// }
