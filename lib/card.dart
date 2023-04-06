import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  final String inputName;
  final String inputTime;
  final Function() delete;
  ItemCard({required this.inputName,required this.inputTime,required this.delete});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Image.asset(
                      'photos/event1.jpg',
                      width: 150,
                      height: 150,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            inputName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              inputTime,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60.0,20.0,0.0,0.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'View Details',

                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  ],
              )
            ],
          ),


        )
    );
  }
}