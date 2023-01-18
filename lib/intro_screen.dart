import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgLoc;
  const IntroScreen(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imgLoc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            title,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 23),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Image.asset(imgLoc),
        ],
      ),
    );
  }
}
