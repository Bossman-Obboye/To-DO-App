import 'package:hive/hive.dart';
part 'to_do.g.dart';

@HiveType(typeId: 0)
class Todo {
  
  @HiveField(0)
  final String todo;
  
  @HiveField(1)
  bool done;

  set isDone(bool isDone) {
    done = isDone;
  }

  Todo({
    required this.todo,
    this.done = false,
  });
}
