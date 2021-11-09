import 'package:flutter/material.dart';

const kEditTextstyle = TextStyle(color: Color(0xFFFFABAB),fontSize: 15);
const kpadding = EdgeInsets.only(top: 22,left: 50,right: 50);

const kWidgetDecor = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'ENTER USERNAME',
    border: InputBorder.none,
    hintStyle: kEditTextstyle
);

const kContainerforPages = BoxDecoration(color: Color(0xFFA80000),borderRadius: BorderRadius.all(Radius.circular(30)));