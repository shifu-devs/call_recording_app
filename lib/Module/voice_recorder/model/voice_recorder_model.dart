import '../../../app_services/db_helper.dart';

class MyRecordingsModel {
  static Map<String, Object> toMap(title, createdAt, isFav, path) {
    return {
      'title': title,
      'createdAt': createdAt,
      'isFavourite': isFav ? "1" : "0",
      'path': path,
    };
  }

  static Future<List<MyRecordingRead>> fetchMyRecordings() async {
    final myRecordingsList = await DbHelper.getMyRecordings();
    return myRecordingsList
        .map(
          (item) => MyRecordingRead(
            id: item['id'].toString(),
            title: item['title'].toString(),
            createdAt: int.parse(item['createdAt'].toString()),
            isFav: item['isFavourite'].toString(),
            path: item['path'].toString(),
          ),
        )
        .toList();
  }
}

class MyRecordingRead {
  String id;
  String title;
  int createdAt;
  String isFav;
  String path;

  MyRecordingRead({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isFav,
    required this.path,
  });
}
