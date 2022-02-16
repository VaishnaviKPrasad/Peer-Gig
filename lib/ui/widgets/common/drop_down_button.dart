import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatefulWidget {
  final List<String>? fields;
  String txt;
  String? currentValue;
  bool filter;

  CustomDropDownButton(
      {Key? key, required this.txt, required this.fields, required this.filter})
      : super(key: key);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    widget.fields?.add('Other');
    return FormField(builder: (FormFieldState state) {
      return InputDecorator(
        decoration: InputDecoration(
          isDense: true,
          label: Text(widget.txt,
              style: GoogleFonts.mallanna(
                color: AppColors.primaryDark,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          labelStyle: GoogleFonts.mallanna(
            color: AppColors.primaryDark,
            fontSize: 15,
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
          hintText: 'Enter ${widget.txt}',
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
        isEmpty: widget.currentValue == '',
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            hint: Text('Select ${widget.txt}',
              style: GoogleFonts.mallanna(
                color: AppColors.primaryDark,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
            items: widget.fields?.map((String dropdownStringItem) {
              return DropdownMenuItem<String>(
                value: dropdownStringItem,
                child: Text(
                  dropdownStringItem,
                  style: GoogleFonts.mallanna(
                    color: AppColors.primaryDark,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                widget.currentValue = newValue!;
              });
            },
            value: widget.currentValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: (widget.filter) ? 15 : 25,
            iconEnabledColor: AppColors.primaryDark,
            iconDisabledColor: AppColors.primaryDark,
          ),
        ),
      );
    });
  }
}
