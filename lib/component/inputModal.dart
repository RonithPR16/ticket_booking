// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import 'dart:math';

class InputModalState extends StatefulWidget {
  final Function pressed;
  InputModalState(this.pressed);

  @override
  State<InputModalState> createState() => _InputModalStateState();
}

class _InputModalStateState extends State<InputModalState> {
  int totalInputsFilled=0;
  
  bool _autovalidate = false;
  List<String> _options = ["Arrival Time", "Departure Time"];
  late String _selectedTime = " ";
  bool ticket = false;
  int _randomNumber1 = Random().nextInt(40);
  int id = Random().nextInt(4000);
  var swipebuttonText = "Book Tickets";
  var swipebuttonText2 = "";
  late String fccLabel = "";
  late String fcnLabel = "";
  late String tccLabel = "";
  late String tcnLabel = "";
  late String date = "";
  late String option = "";
  late int ticketNm = _randomNumber1;
  final _formKey = GlobalKey<FormState>();

  Widget finalTicketNumber() {
    if (true) {
      return Center(
        child: Text(
          _selectedTime == " " ? " " : "Your ticket number is $_randomNumber1",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      );
    }
  }



  addTicket(BuildContext context) {
    if(_formKey.currentState!.validate()){
      Navigator.pop(context);
    widget.pressed(
      id,
      fccLabel,
      fcnLabel,
      tccLabel,
      tcnLabel,
      date,
      option,
      ticketNm,
    );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: ticket ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
            child: ListView(
          children: [
            TextFormField(
              autocorrect: false,
              cursorColor: Colors.grey[900],
              decoration: InputDecoration(
                hintText: "Enter City code",
                prefixIcon: Icon(
                  Icons.location_pin,
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field cannot be empty";
                }
                else if(value.length >3){
                  return "Code should be less than 4 letters";
                }
                else if(value.length < 3){
                  return "Code should be 3 letters";
                }
                return null;
              },
              
              onChanged: (value){ 
                fccLabel = value.toUpperCase();
                totalInputsFilled = totalInputsFilled+1;
              },
            ),
          
            TextFormField(
              autocorrect: false,
              cursorColor: Colors.grey[900],
              decoration: InputDecoration(
                hintText: "Enter city name",
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
              onChanged: (value) {
                fcnLabel = value;
                totalInputsFilled++;
                        print(totalInputsFilled);

              },
            ),
            TextFormField(
              autocorrect: false,
              cursorColor: Colors.grey[900],
              decoration: InputDecoration(
                hintText: "Enter city code",
                prefixIcon: Icon(
                  Icons.location_pin,
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field cannot be empty";
                }
                else if(value.length >3){
                  return "Code should be less than 4 letters";
                }
                else if(value.length < 3){
                  return "Code should be 3 letters";
                }
                return null;
              },
              onChanged:  (value){
                tccLabel = value.toUpperCase();
                totalInputsFilled++;
                        print(totalInputsFilled);

              },
            ),
            TextFormField(
              autocorrect: false,
              cursorColor: Colors.grey[900],
              decoration: InputDecoration(
                hintText: "Enter destination city name",
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
              onChanged: (value){
                tcnLabel = value;
                totalInputsFilled++;
                        print(totalInputsFilled);

              }
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11.0,
              ),
              child: DateTimePicker(
                
                initialValue:
                    '', // initialValue or controller.text can be null, empty or a DateTime string otherwise it will throw an error.
                type: DateTimePickerType.date,
                icon: Icon(
                  Icons.event,
                  color: Colors.black,
                ),
                dateLabelText: 'Select Date',
                firstDate: DateTime.now(),
                validator: (value) {
                if (value!.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              },
                lastDate: DateTime.now().add(Duration(days: 3650)),
                onChanged: (value){
                date = value.toString();
                totalInputsFilled++;
                        print(date);

              },
              ),
            ),
            Container(
              width: 340,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: DropdownButton(
                  
                  icon: Icon(Icons.arrow_drop_down_outlined),
                  dropdownColor: Colors.grey[500],
                  underline: Container(
                    height: 1,
                    color: Colors.grey[500],
                  ),
                  isExpanded: true,
                  hint: _selectedTime == " "
                      ? Text(
                          'Select Arrival or Departure Time',
                          style: TextStyle(fontSize: 15),
                       )
                      : Text(
                          _selectedTime,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.white),
                  items: _options.map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    option = value.toString();
                    setState(
                      () {
                        _selectedTime = value.toString();
                        (value) => option = value;
                        totalInputsFilled++;
                        print(totalInputsFilled);
                  totalInputsFilled ==6 ? ticket = false: ticket=true;

                      },
                    );
                  },
                ),
              ),
            ),
            totalInputsFilled!=0 ? Container(child: finalTicketNumber()): Container() ,
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 20),
              child: SwipingButton(
                text: swipebuttonText,
                height: 50,
                backgroundColor: Colors.grey,
                // height: 20,
                swipeButtonColor: Colors.black,
                onSwipeCallback: () => addTicket(context),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
