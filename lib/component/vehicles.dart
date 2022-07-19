import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/models/vehicles.dart';


class VehicleCard extends StatelessWidget {
final List<vehicleDataType> items;
VehicleCard(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item){
        return Container(
          margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[500],
        border: Border.all(color: Colors.transparent,width:2,),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: NetworkImage(item.imageUrl),width: 250, height: 150,
                    ),
                  ),
                ),
                Gap(10),
                Text(item.vehicleName,style: TextStyle(color:Colors.lightGreen[50], fontSize: 24,fontWeight: FontWeight.bold),),
                Gap(5),
                Text(item.destination,style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.normal),),
                Gap(5),
                Text(item.price,style: TextStyle(color:Colors.lightGreen[50],fontSize: 28,fontWeight: FontWeight.normal),),
              ],
            ),
          ],
        ),
      ),
    );
      }).toList(),
    );
  }
}
