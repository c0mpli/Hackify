import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hackify/card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  List inputItemList=[
  ['Rubix','March 23'],['Stratagem','April 23'],['Technovanza','March 17'],['Inspiron','December 1'],['Enigma','February 14']];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Current Events'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: inputItemList.map((inputItem) => ItemCard(
              inputName:inputItem[0],
              inputTime: inputItem[1],
              delete: (){
                setState(() {
                  inputItemList.remove(inputItem);
                });
              }
          )).toList(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );

  }
}


