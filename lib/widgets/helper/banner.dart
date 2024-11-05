import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro/core/const_data/app_colors.dart';

class banner extends StatelessWidget {
  final String firstLine;

  const banner({
    super.key,
    required this.firstLine,
  });
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      //MainAxisAlignment:MainAxisAlignment.min,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          //      height: 40,
          child: Text(
            firstLine,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF2B2B2B),
              fontSize: 32,
              fontFamily: 'Raleway',
              height: 0,
            ),
          ),
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.019,
          width: mediaQuery.size.width * 0.019,
        ),
        Container(
          child: Text(
            'Fill Your Details Or Continue With \n Social Media ',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              //    fontWeight: FontWeight.bold,
              color: ColorManger.grey, height: 0,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
