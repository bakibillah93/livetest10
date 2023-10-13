import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiSelectListScreen(),
    );
  }
}

class MultiSelectListScreen extends StatefulWidget {
  @override
  _MultiSelectListScreenState createState() => _MultiSelectListScreenState();
}

class _MultiSelectListScreenState extends State<MultiSelectListScreen> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  List<bool> selectedItems = List.generate(5, (index) => false);

  void _onItemTap(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
    });
  }

  void _showSelectedCountDialog() {
    int count = selectedItems.where((item) => item).length;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selected Items"),
          content: Text("You have selected $count items."),
          actions: <Widget>[
            TextButton( // Use TextButton here
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection Screen"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () => _onItemTap(index),
            tileColor: selectedItems[index] ? Colors.blue : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSelectedCountDialog,
        child: Icon(Icons.check),
      ),
    );
  }
}
