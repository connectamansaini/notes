class NoteModel {
  int? id;
  String title;
  String body;
  String creationDate;

  NoteModel({
    this.id,
    required this.title,
    required this.body,
    required this.creationDate,
  });

//Create a Function to convert our items into a map
  Map<String, dynamic> toMap() {
    return ({
      "id": id,
      "title": title,
      "body": body,
      "creation_date": creationDate.toString(),
    });
  }
}
