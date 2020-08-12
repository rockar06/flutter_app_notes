class Note {
  final String id;
  final String title;
  final String note;
  final String timestampEdition;

  Note(this.id, this.title, this.note, this.timestampEdition);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'timestampEdition': timestampEdition
    };
  }
}
