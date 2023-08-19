import 'dart:ui';

enum TaskStatus {
  done,
  inProgress,
  upcoming,
}

class TaskModel {
  final String title;
  final String time;
  final TaskStatus status;
  final String duration;
  final Color cardColor;
  final Color statusColor;

  TaskModel({
    required this.title,
    required this.time,
    required this.status,
    required this.duration,required this.cardColor,required this.statusColor
  });
}