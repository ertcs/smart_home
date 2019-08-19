import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

DateFormat dateFormat = DateFormat("MMM dd, yyyy");

String get getCurrentDate{
  return dateFormat.format(DateTime.now());
}


const dateTextStyle = TextStyle(color: Colors.grey, fontSize: 16);

const homeTitleTextStyle = TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold);

const notificationTextStyle = TextStyle(color: Colors.white,fontSize: 12);

const cardTitleStyle = TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold);

