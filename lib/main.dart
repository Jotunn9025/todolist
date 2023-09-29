import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: TodoList(),
    ));

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Color containerColor = Color.fromARGB(255, 68, 68, 68);
  List<Widget> containerChildren = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('TodoList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addContainer();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 89, 89, 89),
        ),
        child: ListView.builder(
          itemCount: containerChildren.length,
          itemBuilder: (BuildContext context, int index) {
            return containerChildren[index];
          },
        ),
      ),
    );
  }

  void addContainer() {
    TextEditingController unnamedlist=TextEditingController(text: 'Unnamed List');
    setState(() {
      containerChildren.add(
        Container(
          padding: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
          child: ListTile(
            onTap: () {},
            title: TextField(
              controller: unnamedlist,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
              color: const Color.fromARGB(60, 255, 255, 255),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 16.0,
            right: 16.0,
          ),
        ),
      );
    });
  }
}
