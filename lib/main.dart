import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_checklist/config/color_switch.dart';
import 'package:mobile_checklist/firebase_options.dart';
import 'package:mobile_checklist/widgets/card_data.dart';
import 'package:mobile_checklist/widgets/card_details.dart';
import 'package:mobile_checklist/widgets/checklists.dart';
import 'package:mobile_checklist/widgets/color_sliders.dart';
import 'package:mobile_checklist/utils/variables.dart';
import 'package:mobile_checklist/widgets/custom_card.dart';
import 'package:mobile_checklist/widgets/floating_button.dart';
import 'package:mobile_checklist/widgets/landing_page.dart';
import 'package:mobile_checklist/widgets/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: LandingPage()),
    );
  }
}

class MainCheckList extends StatefulWidget {
  const MainCheckList({super.key});

  @override
  State<MainCheckList> createState() => _MainCheckListState();
}

final colorSwitch = ColorSwitch();

class _MainCheckListState extends State<MainCheckList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: colorSwitch.currentColor1,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    AuthService().signOut();
                    Navigator.pop(context);
                  });
                },
                child: Text("Sign Out")),
            GestureDetector(
              onTapUp: (details) => setState(() {
                print(cardtitle.text);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardDetailsAdd()));
              }),
              child: SizedBox(
                width: double.maxFinite,
                height: 400,
                child: ColorBox(
                    color: isColor1Selected
                        ? colorSwitch.currentColor1
                        : colorSwitch.currentColor2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
