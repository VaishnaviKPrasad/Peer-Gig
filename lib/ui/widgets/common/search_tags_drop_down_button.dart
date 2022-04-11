import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/constants/colors.dart';

class SearchTagsDropDown extends StatefulWidget {
  final String txt;
  final List<String> fields;
  final void Function(String?)? onChangedFunc;
  @override
  State<StatefulWidget> createState() => _SearchTagsDropDownState();

  const SearchTagsDropDown(
      {required this.txt,
      required this.fields,
      required this.onChangedFunc,
      Key? key})
      : super(key: key);
}

class _SearchTagsDropDownState extends State<SearchTagsDropDown> {
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
          child: DropdownButton<String>(
            itemHeight: null,
            isDense: true,
            hint: Text(
              'Select ${widget.txt}',
              style: GoogleFonts.mallanna(
                color: AppColors.primaryDark,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            items: widget.fields.map((String dropdownStringItem) {
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
                dropDownValue = newValue;
              });
              widget.onChangedFunc!(newValue);
            },
            value: dropDownValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 20,
            iconEnabledColor: AppColors.primaryDark,
            iconDisabledColor: AppColors.primaryDark,
            dropdownColor: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
