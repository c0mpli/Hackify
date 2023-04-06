import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

const List<Widget> mode = <Widget>[
  Text('Offline'),
  Text('Online')
];

class HackathonFormPage extends StatefulWidget {
  HackathonFormPage({Key? key}) : super(key: key);

  @override
  State<HackathonFormPage> createState() => _HackathonFormPageState();
}

class _HackathonFormPageState extends State<HackathonFormPage> {
  final dateController = TextEditingController();
  final List<bool> _selectedMode = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe6eef5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(

              children: [

                const SizedBox(height: 30),

                // welcome back, you've been missed!
                Text(
                  'Create A Hackathon',
                  style: TextStyle(
                    color: Color(0xFF114a73),
                    fontSize: 22,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 25),

                // Hackathon Name textfield
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0,4.0,0.0,10.0),
                      child: Container(
                        width: 350,
                        child: Text(
                          'Hackathon Name',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF1e2933),
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Eg. Hackify",
                          hintStyle: TextStyle(
                            color: Color(0xFFABABAB),
                            fontFamily: 'Ubuntu',
                            letterSpacing: 1,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Color(0xFFEBF6FF),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Color(0xFFB4DEFF),
                            ),
                          ),
                        ),

                        obscureText: false,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Date textfield

                Container(
                  width: 350,
                  child: TextField(
                      controller: dateController, //editing controller of this TextField
                      decoration: InputDecoration(
                          fillColor: Color(0xFFe1e6eb),
                          labelText: "Date",
                        labelStyle: TextStyle(
                          color: Color(0xFF1e2933),
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                        ),
                        //label text of field
                          icon: Icon(Icons.calendar_today), //icon of text field

                      ),
                      readOnly: true,  // when true user cannot edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101)
                        );

                        if(pickedDate != null ){
                          print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                          String formattedDate = DateFormat.yMMMMd().format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          print(formattedDate); //formatted date output using intl package =>  2022-07-04
                          //You can format date as per your need

                          setState(() {
                            dateController.text = formattedDate; //set formatted date to TextField value.
                          });
                        }else{
                          print("Date is not selected");
                        }
                      }
                  ),
                ),

                const SizedBox(height: 10),
                // password textfield

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,16.0,0.0,10.0),
                      child: Container(
                        width: 350,
                        child: Text(
                          'Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF1e2933),
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Hint: Make it Exciting !",
                          hintStyle: TextStyle(
                            color: Color(0xFFABABAB),
                            fontFamily: 'Ubuntu',
                            letterSpacing: 1,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Color(0xFFEBF6FF),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Color(0xFFB4DEFF),
                            ),
                          ),
                        ),

                        obscureText: false,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,16.0,0.0,10.0),
                      child: Container(
                        width: 350,
                        child: Text(
                          'Venue',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF1e2933),
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 350,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Eg. Thadomal Shahani",
                          hintStyle: TextStyle(
                            color: Color(0xFFABABAB),
                            fontFamily: 'Ubuntu',
                            letterSpacing: 1,

                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Color(0xFFEBF6FF),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Color(0xFFB4DEFF),
                            ),
                          ),
                        ),

                        obscureText: false,
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,16.0,0.0,10.0),
                      child: Container(
                        width: 350,
                        child: Text(
                          'Mode',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF1e2933),
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0,0.0,0.0,0.0),
                      child: ToggleButtons(
                        direction:  Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                          for (int i = 0; i < _selectedMode.length; i++)
                          _selectedMode[i] = i == index;
                          });
                        },
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Color(0xFF01496e),
                        selectedColor: Colors.white,
                        fillColor: Color(0xFF6b99b0),
                        color: Color(0xFF01496e),
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: _selectedMode,
                        children: mode,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0,16.0,0.0,10.0),
                      child: Container(
                        width: 350,
                        child: Text(
                          'Entry Fees',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF1e2933),
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,36.0),
                      child: Container(
                        width: 350,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Eg. Free",
                            hintStyle: TextStyle(
                              color: Color(0xFFABABAB),
                              fontFamily: 'Ubuntu',
                              letterSpacing: 1,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                color: Color(0xFFEBF6FF),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                color: Color(0xFFB4DEFF),
                              ),
                            ),
                          ),

                          obscureText: false,
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Create'),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
