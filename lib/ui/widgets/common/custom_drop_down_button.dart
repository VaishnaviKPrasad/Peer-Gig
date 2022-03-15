import '../../config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends FormField<String> {
  final List<String> fields;
  final String txt;
  final String? Function(dynamic)? validatorFunc;
  String? currentValue = "";
  final bool isfilter;

  CustomDropDownButton({
    Key? key,
    required this.txt,
    required this.fields,
    required this.validatorFunc,
    required this.isfilter,
  }) : super(
          key: key,
          validator: validatorFunc,
          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputDecorator(
                  decoration: InputDecoration(
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text(
                      txt,
                      style: GoogleFonts.mallanna(
                        color: AppColors.primaryDark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                      borderRadius: (isfilter)
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(10),
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
                      borderRadius: (isfilter)
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryDark!,
                        width: 2.0,
                      ),
                      borderRadius: (isfilter)
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(10),
                    ),
                  ),
                  // isEmpty: currentValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      itemHeight: null,
                      isDense: true,
                      hint: Text(
                        'Select $txt',
                        style: GoogleFonts.mallanna(
                          color: AppColors.primaryDark,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      items: fields.map((String dropdownStringItem) {
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
                        state.didChange(newValue);
                      },
                      value: state.value,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: (isfilter) ? 20 : 25,
                      iconEnabledColor: AppColors.primaryDark,
                      iconDisabledColor: AppColors.primaryDark,
                      dropdownColor: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                state.hasError
                    ? Padding(
                        padding: EdgeInsets.only(left: 9, top: 6),
                        child: Text(
                          state.errorText!,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      )
                    : Container(),
              ],
            );
          },
        );
}
// ignore: must_be_immutable
/*class CustomDropDownButton extends StatefulWidget {
  final List<String> fields;
  final String txt;
  final String? Function(dynamic)? validatorFunc;
  String? currentValue;
  final bool isfilter;

  CustomDropDownButton({
    Key? key,
    required this.txt,
    required this.fields,
    required this.validatorFunc,
    required this.isfilter,
  }) : super(key: key);

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    //widget.fields?.add('Other');
    return FormField(
        validator: widget.validatorFunc,
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              isDense: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              label: Text(
                widget.txt,
                style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                borderRadius: (widget.isfilter)
                    ? BorderRadius.circular(30)
                    : BorderRadius.circular(10),
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
                borderRadius: (widget.isfilter)
                    ? BorderRadius.circular(30)
                    : BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryDark!,
                  width: 2.0,
                ),
                borderRadius: (widget.isfilter)
                    ? BorderRadius.circular(30)
                    : BorderRadius.circular(10),
              ),
            ),
            isEmpty: widget.currentValue == '',
            child: DropdownButtonHideUnderline(
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
                    widget.currentValue = newValue!;
                  });
                },
                value: widget.currentValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: (widget.isfilter) ? 20 : 25,
                iconEnabledColor: AppColors.primaryDark,
                iconDisabledColor: AppColors.primaryDark,
                dropdownColor: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        });
  }
}
*/
