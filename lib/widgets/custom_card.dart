import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_checklist/config/color_switch.dart';
import 'package:mobile_checklist/widgets/card_data.dart';
import 'package:mobile_checklist/widgets/card_details.dart';
import 'package:mobile_checklist/widgets/checklists.dart';
import 'package:mobile_checklist/widgets/sign_in.dart';

class RGBColor {
  int red;
  int green;
  int blue;

  RGBColor({required this.red, required this.green, required this.blue});
}

// class ColorSwitch {
//   static final _colorSwitch = ColorSwitch._internal();
//   Color currentColor1 =
//       Color.fromRGBO(235, 143, 143, 1.0); // Initialize with red color
//   Color currentColor2 =
//       Color.fromRGBO(143, 235, 143, 1.0); // Initialize with green color

//   factory ColorSwitch() {
//     return _colorSwitch;
//   }

//   ColorSwitch._internal();

//   void updateColor(RGBColor rgbColor, int colorIndex) {
//     if (colorIndex == 1) {
//       currentColor1 =
//           Color.fromRGBO(rgbColor.red, rgbColor.green, rgbColor.blue, 1.0);
//     } else if (colorIndex == 2) {
//       currentColor2 =
//           Color.fromRGBO(rgbColor.red, rgbColor.green, rgbColor.blue, 1.0);
//     }
//   }
// }

final colorSwitch = ColorSwitch();

final title = TextEditingController();
final text = TextEditingController();
final progress = TextEditingController();

class ColorBox extends StatefulWidget {
  final Color color;

  ColorBox({required this.color});

  @override
  State<ColorBox> createState() => _ColorBoxState();
}

StreamBuilder<List<CardData>> buildStream() {
  return StreamBuilder<List<CardData>>(
      stream: readUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Some Ting Wong");
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return PageView.builder(
              itemCount: data.length,
              itemBuilder: (context, _) {
                return PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...data.map(_ColorBoxState().customCard).toList(),
                    addNewCard(context),
                  ],
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

class _ColorBoxState extends State<ColorBox> {
  @override
  Widget build(BuildContext context) {
    return buildStream();
  }

  Widget buildUser(CardData cardData) {
    return ListTile(
      subtitle: Text(
        cardData.info,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 17,
          color: Colors.black,
        ),
      ),
      leading: Text(
        cardData.title,
        style: TextStyle(fontSize: 27),
      ),
    );
  }

  Widget customCard(CardData cardData) {
    return Center(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: Border.all(width: 0.0, style: BorderStyle.none),
          shadows: <BoxShadow>[
            BoxShadow(
                offset: const Offset(6.0, 6.0),
                blurRadius: 20.0,
                spreadRadius: -8.0,
                color: Colors.grey.withOpacity(.4)),
          ],
        ),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
          color: Colors.white,
          child: Container(
            height: 350,
            width: 350,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            print("IconBook");
                          });
                        },
                        icon: Icon(
                          Icons.book,
                          size: 30,
                          color: colorSwitch.currentColor1,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            print("IconMore");
                          });
                        },
                        icon: Icon(
                          Icons.more_vert,
                          size: 30,
                          color: colorSwitch.currentColor1,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cardData.title,
                          style: TextStyle(color: Colors.black, fontSize: 27),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cardData.info,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Colors.grey.withOpacity(.7)),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            barProgress.toString(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey.withOpacity(.32),
                          color: colorSwitch.currentColor1,
                          borderRadius: BorderRadius.circular(20),
                          minHeight: 20,
                          value: barProgress,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardData(CardData cardData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            cardData.title,
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            cardData.info,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: Colors.grey.withOpacity(.7)),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "49%",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        SizedBox(
          width: double.maxFinite,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey.withOpacity(.32),
            color: colorSwitch.currentColor1,
            borderRadius: BorderRadius.circular(20),
            minHeight: 20,
            value: barProgress,
          ),
        )
      ],
    );
  }
}

Widget addNewCard(BuildContext context) {
  return Center(
    child: Container(
      width: 350,
      height: 350,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: Border.all(width: 0.0, style: BorderStyle.none),
          shadows: <BoxShadow>[
            BoxShadow(
                offset: const Offset(6.0, 6.0),
                blurRadius: 20.0,
                spreadRadius: -8.0,
                color: Colors.grey.withOpacity(.4)),
          ],
        ),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
          color: Colors.white.withOpacity(.6),
          child: GestureDetector(
            onTapUp: (details) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailsAdd(),
                ),
              );
            },
            child: Center(
              child: Icon(
                Icons.add,
                size: 100,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Future<dynamic> cardDetailsAdd(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(
//                 20.0,
//               ),
//             ),
//           ),
//           contentPadding: EdgeInsets.only(
//             top: 10.0,
//           ),
//           title: const Text(
//             "Create New Card",
//             style: TextStyle(fontSize: 24.0),
//           ),
//           content: Container(
//             height: 350,
//             width: 360,
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Title",
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: title,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter Title here',
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Info",
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextField(
//                       controller: text,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Enter Title here',
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 60,
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                         createUser(
//                             title: title.text,
//                             text: text.text,
//                             progress: barProgress,
//                             color: "color");
//                         buildStream();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         // fixedSize: Size(250, 50),
//                       ),
//                       child: Text(
//                         "Submit",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }

Future createUser(
    {required String title,
    required String text,
    required double progress,
    required String color}) async {
  final docUser = FirebaseFirestore.instance.collection(idToken).doc();
  final todo = CardData(
      info: text,
      title: title,
      progress: progress,
      id: docUser.id,
      cardColor: color);
  final json = todo.toJson();
  await docUser.set(json);
}

Stream<List<CardData>> readUser() {
  return FirebaseFirestore.instance
      .collection(idToken)
      .orderBy('title', descending: false)
      .limit(3)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => CardData.fromJson(e.data())).toList());
}
