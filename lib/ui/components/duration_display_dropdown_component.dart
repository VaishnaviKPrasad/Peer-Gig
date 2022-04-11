import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/search_tags_drop_down_button.dart';

import '../../config/constants/colors.dart';
import '../../widgets/common/custom_drop_down_button.dart';

// ignore: must_be_immutable
class DurationDisplayDropdownComponent extends StatefulWidget {
  List<String> start;
  List<String> end;
  DurationDisplayDropdownComponent(
      {Key? key, required this.start, required this.end})
      : super(key: key);

  @override
  _DurationDisplayDropdownComponentState createState() =>
      _DurationDisplayDropdownComponentState();
}

class _DurationDisplayDropdownComponentState
    extends State<DurationDisplayDropdownComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
<<<<<<< HEAD
<<<<<<< HEAD
          child: CustomDropDownButton(
        txt: 'Start Time',
        fields: widget.start,
        isfilter: true,
        onSavedFunc: (String) {},
        validatorFunc: (String) {},
      )),
=======
          child: SearchTagsDropDown(txt: 'Start Time', fields: widget.start, onChangedFunc: null,),
      ),
>>>>>>> bdb41a362755f4ff8588b27e6cc8e3a9d27c9f8b
=======
          child: SearchTagsDropDown(txt: 'Start Time', fields: widget.start, onChangedFunc: null,),
      ),
>>>>>>> bdb41a362755f4ff8588b27e6cc8e3a9d27c9f8b
      Icon(
        Icons.horizontal_rule_rounded,
        color: AppColors.primaryLight,
        size: 20.0,
      ),
      Expanded(
<<<<<<< HEAD
<<<<<<< HEAD
          child: CustomDropDownButton(
        txt: 'End Time',
        fields: widget.end,
        isfilter: true,
        onSavedFunc: (String) {},
        validatorFunc: (String) {},
      )),
=======
          child: SearchTagsDropDown(txt: 'End Time', fields: widget.end, onChangedFunc: null,),
      ),
>>>>>>> bdb41a362755f4ff8588b27e6cc8e3a9d27c9f8b
=======
          child: SearchTagsDropDown(txt: 'End Time', fields: widget.end, onChangedFunc: null,),
      ),
>>>>>>> bdb41a362755f4ff8588b27e6cc8e3a9d27c9f8b
    ]);
  }
}
