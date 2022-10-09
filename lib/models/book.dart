// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  final String author;
  final String name;
  final String category;
  final int id;
  Book({
    required this.author,
    required this.name,
    required this.category,
    required this.id,
  });

  Book copyWith({
    String? author,
    String? name,
    String? category,
    int? id,
  }) {
    return Book(
      author: author ?? this.author,
      name: name ?? this.name,
      category: category ?? this.category,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'name': name,
      'category': category,
      'id': id,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      author: map['author'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(author: $author, name: $name, category: $category, id: $id)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.author == author &&
        other.name == name &&
        other.category == category &&
        other.id == id;
  }

  @override
  int get hashCode {
    return author.hashCode ^ name.hashCode ^ category.hashCode ^ id.hashCode;
  }
}
