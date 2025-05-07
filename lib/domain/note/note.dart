final class Note {
  final String id;
  final String title;
  final String comment;
  final String imagePath;
  final DateTime date;
  const Note({
    required this.id,
    required this.title,
    required this.comment,
    required this.imagePath,
    required this.date,
  });

  Note copyWith({
    String? id,
    String? title,
    String? comment,
    String? imagePath,
    DateTime? date,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      comment: comment ?? this.comment,
      imagePath: imagePath ?? this.imagePath,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'comment': comment,
      'imagePath': imagePath,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Note.empty({
    String? id,
    String title = '',
    String comment = '',
    String imagePath = '',
    DateTime? date,
  }) {
    return Note(
      id: id ?? '${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      comment: comment,
      imagePath: imagePath,
      date: date ?? DateTime.now(),
    );
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as String,
      title: map['title'] as String,
      comment: map['comment'] as String,
      imagePath: map['imagePath'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  @override
  String toString() {
    return 'Note(id: $id, title: $title, comment: $comment, imagePath: $imagePath, date: $date)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.comment == comment &&
        other.imagePath == imagePath &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        comment.hashCode ^
        imagePath.hashCode ^
        date.hashCode;
  }
}
