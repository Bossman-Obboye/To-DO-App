import 'package:flutter/material.dart';
import 'package:my_app/to_do.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

List<Todo> listOfTodo = [];

class _TestingState extends State<Testing> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "ToDo App",
            style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width * 0.085,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.08,
            color: const Color.fromARGB(137, 43, 42, 42),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Tasks",
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).height * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listOfTodo.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  todo: listOfTodo[index],
                  onChanged: (_) {
                    setState(() {
                      listOfTodo[index].done = !listOfTodo[index].done;
                    });
                  },
                  onPressed: () {
                    setState(() {
                      listOfTodo.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          TextField(
            controller: _textController,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              focusColor: Colors.white,
              suffixIconColor: Colors.white,
              fillColor: const Color.fromARGB(137, 43, 42, 42),
              hintText: "Type the task here",
              hintStyle: TextStyle(
                fontSize: MediaQuery.sizeOf(context).height * 0.026,
                color: Colors.white,
              ),
              isDense: true,
              suffixIcon: IconButton(
                onPressed: () {
                  final todo = Todo(todo: _textController.text);
                  setState(() {
                    if (_textController.text.isNotEmpty) {
                      listOfTodo.add(todo);
                    }
                    _textController.clear();
                  });
                },
                icon: Icon(                                             
                  Icons.save,
                  color: Colors.white,
                  size: MediaQuery.sizeOf(context).height * 0.032,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }   
}

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final Todo todo;
  void Function(bool?)? onChanged;
  void Function()? onPressed;
  ToDoTile({
    required this.todo,
    required this.onChanged,
    required this.onPressed,
    super.key,
  });

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        //
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              color: Color.fromARGB(193, 0, 0, 0),
              width: 0.4,
            ))),
        // height: MediaQuery.sizeOf(context).height * 0.08,
        child: Row(
          children: [
            Checkbox(
              side: const BorderSide(
                color: Color.fromARGB(137, 43, 42, 42),
                width: 2,
              ),
              value: todo.done,
              onChanged: onChanged,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  todo.todo,
                  style: TextStyle(
                      color: const Color.fromARGB(228, 43, 42, 42),
                      fontSize: MediaQuery.sizeOf(context).height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Visibility(
              visible: todo.done,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(137, 43, 42, 42),
                ),
                onPressed: onPressed,
              ),
            ),
          ],
        ));
  }
}
