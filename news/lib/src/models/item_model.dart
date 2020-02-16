import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        deleted = json['deleted'] ?? false,
        type = json['type'],
        by = json['by'] ?? '',
        time = json['time'],
        text = json['text'] ?? '',
        dead = json['dead'] ?? false,
        parent = json['parent'],
        kids = json['kids'] ?? [],
        url = json['url'],
        score = json['score'],
        title = json['title'],
        descendants = json['descendants'] ?? 0;

  ItemModel.fromDb(Map<String, dynamic> row)
      : id = row['id'],
        deleted = row['deleted'] == 1,
        type = row['type'],
        by = row['by'],
        time = row['time'],
        text = row['text'],
        dead = row['dead'] == 1,
        parent = row['parent'],
        kids = jsonDecode(row['kids']),
        url = row['url'],
        score = row['score'],
        title = row['title'],
        descendants = row['descendants'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "parent": parent,
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants,
      "dead": dead ? 1 : 0,
      "deleted": deleted ? 1 : 0,
      "kids": jsonEncode(kids)
    };
  }
}
