
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste/src/src.dart';


class ButonnWidget extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
//instaciando o objeto
  const ButonnWidget({Key? key,  required this.text, required this.onpressed }) : super(key: key); 

   @override
   Widget build(BuildContext context) {
       return 
                ElevatedButton(
                  onPressed: onpressed,
                  child: Text(
                    text,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                    style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(105, 40)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.greenAccent),
                  ),
                
          
       );
  }
}