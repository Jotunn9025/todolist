import 'package:flutter/material.dart';
import 'newPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: TodoList(),
  ));
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Color containerColor = Color.fromARGB(255, 68, 68, 68);
  List<Widget> containerChildren = [];
  int i = 0;

  void deleteContainer(int value) {
    setState(() {
      containerChildren.removeWhere((widget) => widget.key == ValueKey<int>(value));
    });
  }

  void addContainer() {
    TextEditingController unnamedlist = TextEditingController(text: 'Unnamed List');
    setState(() {
      int value = i;
      containerChildren.add(
        Container(
          key: ValueKey<int>(value),
          padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0),
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {},
                title: Container(
                  width: 100.0,
                  child: TextField(
                    controller: unnamedlist,
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250.0,
                      margin: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(255, 52, 52, 52),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPage(data: unnamedlist.text),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteContainer(value);
                      },
                      color: Colors.white54,
                    ),
                  ],
                ),
              ),
            ],
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
      i++;
    });
  }

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
}