import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getStorageInstance = GetStorage();

  @override
  Widget build(BuildContext context) {
    final user = getStorageInstance.read('user');
    //print(user['name']);
    return Scaffold(
      body: Text('User data: $user'),
    );
  }
}
