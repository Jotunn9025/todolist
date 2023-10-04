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
  int deletecounter = 0;

  void addListItem() {
    setState(() {
      int values = deletecounter;
      listChildren.add(
        AddedContainer(
          key: ValueKey<int>(values),
          values: values,
          onDelete: () {
            deleteListItem(values);
          },
        ),
      );
      deletecounter++;
    });
  }

  void deleteListItem(int values) {
    setState(() {
      listChildren.removeWhere((widget) => widget.key == ValueKey<int>(values));
    });
  }

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
}

class AddedContainer extends StatefulWidget {
  final Function onDelete;
  final int values; // Add the values variable to store the item's key.

  AddedContainer({Key? key, required this.onDelete, required this.values})
      : super(key: key);

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
            onPressed: () {
              widget.onDelete(); // Call the onDelete function correctly.
            },
            icon: Icon(Icons.delete, color: Colors.white54),
          ),
        ],
      ),
    );
  }
}
