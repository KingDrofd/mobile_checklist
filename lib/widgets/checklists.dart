import 'package:flutter/material.dart';
import 'package:mobile_checklist/utils/variables.dart';

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  State<CheckList> createState() => _CheckListState();
}

double barProgress = 0.0;

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    int checkedCount = isCheckedList.where((isChecked) => isChecked).length;
    if (isCheckedList.isEmpty) {
      barProgress = 0.0;
    } else {
      barProgress = checkedCount / isCheckedList.length;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Checklist Example'),
      ),
      body: ListView.builder(
        itemCount: isCheckedList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(customNames[index]),
            leading: Checkbox(
              value: isCheckedList[index],
              onChanged: (value) {
                setState(() {
                  isCheckedList[index] = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _showAddItemDialog();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                print(customNames.toString());
                print(isCheckedList.length);
              });
            },
            child: Icon(Icons.text_decrease),
          ),
        ],
      ),
      bottomNavigationBar: LinearProgressIndicator(
        value: barProgress,
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a new item'),
          content: TextField(
            controller: customNameController,
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final customName = customNameController.text;
                setState(() {
                  isCheckedList.add(false);
                  customNames.add(customName);
                });
                customNameController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
