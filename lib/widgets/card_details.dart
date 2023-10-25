import 'package:flutter/material.dart';
import 'package:mobile_checklist/widgets/card_data.dart';
import 'package:mobile_checklist/widgets/checklists.dart';
import 'package:mobile_checklist/widgets/custom_card.dart';

import '../utils/variables.dart';
import 'color_sliders.dart';

class CardDetailsAdd extends StatefulWidget {
  const CardDetailsAdd({super.key});

  @override
  State<CardDetailsAdd> createState() => _CardDetailsAddState();
}

class _CardDetailsAddState extends State<CardDetailsAdd> {
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

  @override
  Widget build(BuildContext context) {
    int checkedCount = isCheckedList.where((isChecked) => isChecked).length;
    if (isCheckedList.isEmpty) {
      barProgress = 0.0;
    } else {
      barProgress = checkedCount / isCheckedList.length;
    }
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: double.infinity,
          height: 70,
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              createUser(
                  title: title.text,
                  text: text.text,
                  progress: barProgress,
                  color: "color");
              buildStream();
              if (title.text == "") {
                title.clear();
                text.clear();
                isCheckedList.clear();
              } else {
                title.text = cardtitle.text;
                text.text = cardtitle.text;
                checkListIndex = cardIndexCheckList;
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              // fixedSize: Size(250, 50),
            ),
            child: Text(
              "Submit",
            ),
          ),
        ),
        backgroundColor: colorSwitch.currentColor1,
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_sharp,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            width: double.maxFinite,
                            child: TextField(
                              controller: title,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Title',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: PopupMenuButton<String>(
                                onSelected: (String result) {
                                  switch (result) {
                                    case 'New Check Box':
                                      _showAddItemDialog();
                                      break;
                                    case 'filter2':
                                      print('filter 2 clicked');
                                      break;
                                    case 'clearFilters':
                                      print('Clear filters');
                                      break;
                                    default:
                                  }
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    value: 'New Check Box',
                                    child: Text('CheckBox'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'filter2',
                                    child: Text('Filter 2'),
                                  ),
                                  const PopupMenuItem<String>(
                                    value: 'clearFilters',
                                    child: Text('Clear filters'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 100,
                      child: TextField(
                        maxLines: double.maxFinite.toInt(),
                        style: TextStyle(
                          overflow: TextOverflow.clip,
                        ),
                        textInputAction: TextInputAction.newline,
                        controller: text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
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
                    ),
                    ColorSliders(
                        rgbColor: rgbColor1,
                        onChanged: (newRgbColor) {
                          setState(() {
                            rgbColor1 = newRgbColor;
                            updateColor();
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
