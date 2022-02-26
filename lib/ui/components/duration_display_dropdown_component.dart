import 'package:flutter/material.dart';

import '../config/constants/colors.dart';
import '../widgets/common/drop_down_button.dart';

// ignore: must_be_immutable
class DurationDisplayDropdownComponent extends StatefulWidget {
  List<String> start;
  List<String> end;
  DurationDisplayDropdownComponent({ Key? key, required this.start, required this.end }) : super(key: key);

  @override
  _DurationDisplayDropdownComponentState createState() => _DurationDisplayDropdownComponentState();
}

class _DurationDisplayDropdownComponentState extends State<DurationDisplayDropdownComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: CustomDropDownButton(txt: 'Start Time', fields: widget.start, isfilter: true)), 
        Icon(
          Icons.horizontal_rule_rounded,
          color: AppColors.primaryLight,
          size: 20.0,
        ),
        Expanded(child: CustomDropDownButton(txt: 'End Time', fields: widget.end, isfilter: true)), 
      ]
    );
  }
}