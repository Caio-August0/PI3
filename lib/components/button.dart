// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonGray extends StatelessWidget {
  const ButtonGray({
    super.key,
    required this.context,
    required this.toGo,
    required this.text,
  });

  final BuildContext context;
  final Widget toGo;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.zero),
        border: Border.all(width: 3, color: Color.fromARGB(255, 150, 150, 150)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 5.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xff2C2C2C)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          textStyle: MaterialStateProperty.all(GoogleFonts.inika(
            color: Colors.white,
          )),
          minimumSize: MaterialStatePropertyAll(Size(100, 46)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => toGo),
          );
        },
        child: Text(text),
      ),
    );
  }
}

class ButtonGrayFunc extends StatelessWidget {
  const ButtonGrayFunc({
    super.key,
    required this.context,
    required this.onPressed,
    required this.text,
  });

  final BuildContext context;
  final VoidCallback? onPressed; // Optional parameter
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.zero),
        border: Border.all(width: 3, color: Color.fromARGB(255, 150, 150, 150)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 5.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xff2C2C2C)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          textStyle: MaterialStateProperty.all(GoogleFonts.inika(
            color: Colors.white,
          )),
          minimumSize: MaterialStatePropertyAll(Size(100, 46)),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
