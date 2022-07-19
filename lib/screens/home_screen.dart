// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/component/Heading_text.dart';
import 'package:ticket_booking/component/inputModal.dart';
import 'package:ticket_booking/component/vehicles.dart';
import 'package:ticket_booking/component/ticket_card.dart';
import 'package:ticket_booking/models/tickets.dart';
import 'package:ticket_booking/models/vehicles.dart';
import '../component/inputModal.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Ticket> totalTickets = [
    Ticket(
      id: 1,
      fromCityShortform: "NYC",
      fromCityFullForm: "New York",
      toCityShortForm: "LDN",
      toCityFullForm: "London",
      day: "1 May",
      dateText: "Date",
      time: "08:00 AM",
      departureInfo: "Departure Time",
      ticketNumber: 23,
      numberText: "Number",
    ),
    Ticket(
      id: 2,
      fromCityShortform: "EUR",
      fromCityFullForm: "Europe",
      toCityShortForm: "DHI",
      toCityFullForm: "Dubai",
      day: "21 July",
      dateText: "Date",
      time: "11:00 PM",
      departureInfo: "Arrival Time",
      ticketNumber: 86,
      numberText: "Number",
    ),
  ];
  void ticketHandler(int id,String fcc, String fcn, String tcc, String tcn,
      String date, String aodt, int tn) {
    final newTicket = Ticket(
      id: id, 
      fromCityShortform: fcc,
      fromCityFullForm: fcn,
      toCityShortForm: tcc,
      toCityFullForm: tcn,
      day: date,
      dateText: "Date",
      time: "1:30AM",
      departureInfo: aodt,
      ticketNumber: tn,
      numberText: "Number",
    );
    setState(() {
      totalTickets.add(newTicket);
    });
  }
   void deletedItem(int id){
    setState(() {
      totalTickets.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  final List<vehicleDataType> vehicleData = [
    vehicleDataType(
        imageUrl:
            "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/12/722825-indigo-1575280634.jpg",
        vehicleName: "IndiGo",
        destination: "London",
        price: "\$ 25,000"),
    vehicleDataType(
        imageUrl:
            "https://content.presspage.com/uploads/2431/1920_emiratesboeing777-300er2020.jpg?10000",
        vehicleName: "Emirates",
        destination: "Dubai",
        price: "\$ 1,25,000"),
    vehicleDataType(
        imageUrl:
            "https://cdn.businesstraveller.com/wp-content/uploads/fly-images/1219228/resized-image-Promo-2022-06-28T150031.051-916x515.jpeg",
        vehicleName: "Emirates",
        destination: "Dubai",
        price: "\$ 1,25,000"),
    vehicleDataType(
        imageUrl:
            "https://www.lufthansa.com/content/dam/lh/images/pixels_variations/c-144352286-3176493.transform/lh-dcep-transform-width-1440/img.jpg",
        vehicleName: "Emirates",
        destination: "Dubai",
        price: "\$ 1,25,000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Good Morning",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Username",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26, width: 3),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/images/aircraft.png"),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Gap(20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black26,
                          width: 2,
                        )),
                    child: TextFormField(
                      autocorrect: false,
                      cursorColor: Colors.grey[900],
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            // borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Gap(30),
                  HeadingText("Upcoming Flights", "View all"),
                ],
              ),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TicketCard(totalTickets,deletedItem),
                    Gap(20),
                  ],
                ),
              ),
              Gap(30),
              HeadingText("Vehicles", "View all"),
              Gap(30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    VehicleCard(vehicleData),
                    // Gap(0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            // enableDrag: false,
            // isDismissible: false,
            // isScrollControlled: true,
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            // isDismissible: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            context: context,
            builder: (context) {
              return InputModalState(ticketHandler);
            },
          );
        },
      ),
    );
  }
}
