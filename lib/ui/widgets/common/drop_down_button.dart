import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatefulWidget {
  
  final List<String>? fields;
  String currentValue = "";
  bool filter;

  CustomDropDownButton({ Key? key, required this.fields, required this.filter }) : super(key: key);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: widget.fields?.map(
          (String dropdownStringItem){
            return DropdownMenuItem<String>(
              value: dropdownStringItem,
              child: Text(
                dropdownStringItem,
                style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          }
        ).toList(),
        onChanged: (String? newValue) {
          setState((){
            widget.currentValue = newValue!;
          });
        },
        value: widget.currentValue,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: (widget.filter) ? 10 : 14,
        iconEnabledColor: AppColors.primaryDark,
        iconDisabledColor: AppColors.primaryDark, 
    );
  }
}