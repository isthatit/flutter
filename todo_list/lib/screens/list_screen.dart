import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/main.dart';
import 'package:todo_list/models/todo.dart';
// import 'package:todo_list/providers/todo_default.dart';
import 'package:todo_list/providers/todo_sqlite.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<Todo> todos;
  // TodoDefault todoDefault = TodoDefault();
  TodoSqlite todoSqlite = TodoSqlite();
  bool isLoading = true;

  Future initDb() async {
    await todoSqlite.initDb().then((value) async {
      todos = await todoSqlite.getTodos();
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      // todos = todoDefault.getTodos();

      // setState(() {
      // isLoading = false;
      // });
      initDb().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO LIST APP'),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.book),
                    const Text('News'),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('+', style: TextStyle(fontSize: 25)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String title = '';
                  String description = '';
                  return AlertDialog(
                    title: Text('할 일 추가하기'),
                    content: Container(
                      height: 200,
                      child: Column(children: [
                        TextField(
                          onChanged: (value) {
                            title = value;
                          },
                          decoration: InputDecoration(labelText: '제목'),
                        ),
                        TextField(
                          onChanged: (value) {
                            description = value;
                          },
                          decoration: InputDecoration(labelText: '설명'),
                        )
                      ]),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await todoSqlite.addTodo(
                              Todo(title: title, description: description));
                          List<Todo> newTodos = await todoSqlite.getTodos();
                          setState(() {
                            print("[UI] ADD");
                            todos = newTodos;
                          });

                          Navigator.of(context).pop();
                        },
                        child: Text('추가'),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('취소'))
                    ],
                  );
                });
          },
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todos[index].title),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text('할 일'),
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text('제목: ${todos[index].title}'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child:
                                      Text('설명: ${todos[index].description}'),
                                )
                              ],
                            );
                          });
                    },
                    trailing: Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child: Icon(Icons.edit),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    String title = todos[index].title;
                                    String description =
                                        todos[index].description;
                                    return AlertDialog(
                                      title: Text('할 일 수정하기'),
                                      content: Container(
                                        height: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              onChanged: (value) {
                                                title = value;
                                              },
                                              decoration: InputDecoration(
                                                  hintText: todos[index].title),
                                            ),
                                            TextField(
                                              onChanged: (value) {
                                                description = value;
                                              },
                                              decoration: InputDecoration(
                                                  hintText:
                                                      todos[index].description),
                                            )
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('수정'),
                                          onPressed: () async {
                                            Todo newTodo = Todo(
                                                id: todos[index].id,
                                                title: title,
                                                description: description);
                                            await todoSqlite
                                                .updateTodo(newTodo);
                                            List<Todo> newTodos =
                                                await todoSqlite.getTodos();
                                            setState(() {
                                              // todoDefault.updateTodo(newTodo);
                                              todos = newTodos;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('취소'))
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: InkWell(
                              child: Icon(Icons.delete),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('할 일 삭제하기'),
                                        content: Container(
                                          child: Text('삭제?'),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                await todoSqlite.deleteTodo(
                                                    todos[index].id ?? 0);
                                                List<Todo> newTodos =
                                                    await todoSqlite.getTodos();
                                                setState(() {
                                                  // todoDefault.deleteTodo(
                                                  todos = newTodos;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('삭제')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('취소'))
                                        ],
                                      );
                                    });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (contet, index) {
                  return Divider();
                },
                itemCount: todos.length));
  }
}
