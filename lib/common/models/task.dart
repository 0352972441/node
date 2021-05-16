import 'dart:convert';

class TaskModel {
  final id;
  final String description;
  bool isCompleted;
  TaskModel({this.description,this.isCompleted,this.id});

  

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'completed': isCompleted,
      "_id":id
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["_id"],
      description: map['description'],
      isCompleted: map['completed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source));
}
