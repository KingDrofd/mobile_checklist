import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_checklist/main.dart';
import 'package:mobile_checklist/widgets/sign_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () async {
          AuthService().checkSignedIn().then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => MainCheckList(),
                  ),
                ),
              );
        },
        icon: const Icon(
          Icons.login,
        ),
        label: const Text(
          "Login With Google",
        ),
      ),
    );
  }
}
