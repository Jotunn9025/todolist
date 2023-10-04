import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NewPage(data: 'Your Data Here'),
  ));
}

class NewPage extends StatefulWidget {
  final String data;

  NewPage({required this.data});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<Widget> listChildren = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.data),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              addListItem();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 89, 89, 89),
        ),
        child: ListView.builder(
          itemCount: listChildren.length,
          itemBuilder: (BuildContext context, int index) {
            return listChildren[index];
          },
        ),
      ),
    );
  }

  void addListItem() {
    setState(() {
      listChildren.add(
        AddedContainer(),
      );
    });
  }
}

class AddedContainer extends StatefulWidget {
  @override
  _AddedContainerState createState() => _AddedContainerState();
}

class _AddedContainerState extends State<AddedContainer> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: checkboxValue,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue = value!;
              });
            },
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(hintText: 'List item'),
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
