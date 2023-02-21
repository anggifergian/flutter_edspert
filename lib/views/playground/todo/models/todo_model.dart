import 'package:flutter/material.dart';

@immutable
class Todo {
  const Todo({
    required this.id,
    required this.description,
    this.completed = false,
  });

  final String id;
  final String description;
  final bool completed;

  Todo copyWith({
    String? id,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
