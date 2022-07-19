// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../models/tickets.dart';
import 'dart:math';

class TicketCard extends StatelessWidget {
  final List<Ticket> items;
  final Function deleteItem;
  TicketCard(this.items, this.deleteItem);



  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: ()=> deleteItem(item),
      child: Row(
        children: items.map((item) {
          return Container(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    child: Container(
                      width: 300,
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.fromCityShortform,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  item.fromCityFullForm,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.local_airport,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item.toCityShortForm,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  item.toCityFullForm,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300, 
                    color: item.departureInfo=="Arrival Time" ? Colors.green : Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.day,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                item.dateText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                item.time,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                item.departureInfo,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                item.ticketNumber.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                item.numberText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.only(top:8,bottom:4),
                    width: 100,
                    height: 30,
                    child: ElevatedButton(
                      child: Text('Delete', style: TextStyle(color:Colors.white),),
                      onPressed: () {
                        deleteItem(item.id);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
                          textStyle:
                              MaterialStateProperty.all(TextStyle(fontSize: 10,color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
