import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:smart_home/util/util_smarthome.dart';

class AddNewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
      child: DottedBorder(
        dashPattern: [2],
        color: Colors.grey[400],
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        strokeWidth: 2,
        child: Container(
          height: 70,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(Icons.add,color: Colors.grey,size: 30,),
              ),
              Expanded(
                flex: 2,
                child:Text('Add new device',style: dateTextStyle.copyWith(fontSize: 20),),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
