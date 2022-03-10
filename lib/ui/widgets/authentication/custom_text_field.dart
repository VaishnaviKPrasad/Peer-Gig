import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? txt;
  final bool? password;
  const CustomTextField({Key? key, required this.txt, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            validator: (String? value){
              return (value == null) ? 'This field cannot be empty' : null;
            },
            textAlign: TextAlign.start, 
            textAlignVertical: TextAlignVertical.center,
            obscureText: (password!) ? true : false,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              label: Text(txt!,
                  style: GoogleFonts.mallanna(
                    color: AppColors.primaryDark,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
                ),
              labelStyle: GoogleFonts.mallanna(
                  color: AppColors.primaryDark,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ), 
              filled: true,
              fillColor: AppColors.primaryLight,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryDark!,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),                
              hintText: 'Enter $txt',
              hintStyle: GoogleFonts.mallanna(
                  color: AppColors.primaryDark,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ), 
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryDark!,
                  width: 2.0,
                ),                
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryDark!,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: GoogleFonts.mallanna(
              color: AppColors.primaryDark,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            )
        );        
  }
}
