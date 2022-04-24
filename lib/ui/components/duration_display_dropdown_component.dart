import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/search_tags_drop_down_button.dart';
import '../config/constants/colors.dart';
import '../widgets/common/custom_drop_down_button.dart';

// ignore: must_be_immutable
class DurationDisplayDropdownComponent extends StatefulWidget {
  List<String> start;
  List<String> end;
  Function(String?)? startTimeOnChangedFunc;
  Function(String?)? endTimeOnChangedFunc;
  DurationDisplayDropdownComponent(
      {Key? key,
      required this.start,
      required this.end,
      required this.startTimeOnChangedFunc,
      required this.endTimeOnChangedFunc})
      : super(key: key);

  @override
  _DurationDisplayDropdownComponentState createState() =>
      _DurationDisplayDropdownComponentState();
}

class _DurationDisplayDropdownComponentState
    extends State<DurationDisplayDropdownComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SearchTagsDropDown(
            txt: 'Start Time',
            fields: widget.start,
            onChangedFunc: widget.startTimeOnChangedFunc,
          ),
        ),
        Icon(
          Icons.horizontal_rule_rounded,
          color: AppColors.primaryLight,
          size: 20.0,
        ),
        Expanded(
          child: SearchTagsDropDown(
            txt: 'End Time',
            fields: widget.end,
            onChangedFunc: widget.endTimeOnChangedFunc,
          ),
        ),
      ],
    );
  }
}
