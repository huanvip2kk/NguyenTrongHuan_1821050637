import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:localstore/localstore.dart';

class Question {
  String? id;
  int answer;
  String question;
  List<String> options;
  Question({
    this.id,
    required this.answer,
    required this.question,
    required this.options,
  });

  Question copyWith({
    String? id,
    int? answer,
    String? question,
    List<String>? options,
  }) {
    return Question(
      id: id ?? this.id,
      answer: answer ?? this.answer,
      question: question ?? this.question,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'answer': answer,
      'question': question,
      'options': options,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      answer: map['answer'],
      question: map['question'],
      options: List<String>.from(map['options']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(id: $id, answer: $answer, question: $question, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.id == id &&
        other.answer == answer &&
        other.question == question &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
    answer.hashCode ^
    question.hashCode ^
    options.hashCode;
  }
}

extension ExtSupplier on Question {
  Future save() async {
    final db = Localstore.instance;
    id ??= db.collection('Question').doc().id;
    return db.collection('Question').doc(id).set(toMap());
  }

  Future delete() async {
    final db = Localstore.instance;
    return db.collection('Question').doc(id).delete();
  }
}
