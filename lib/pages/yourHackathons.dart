import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class YourHackathonPage extends StatefulWidget {
  const YourHackathonPage({super.key});

  @override
  State<YourHackathonPage> createState() => _YourHackathonPageState();
}

class _YourHackathonPageState extends State<YourHackathonPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Your hackathons page"),
    );
  }
}
