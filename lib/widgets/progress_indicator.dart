import 'package:flutter/material.dart';

Widget circularProgressIndicator() =>
    Center(child: CircularProgressIndicator());

Widget buttonProgressIndicator() => SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      ),
    );
