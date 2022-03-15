import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:peer_gig/ui/widgets/authentication/custom_text_field.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CustomMultiSelectorFieldWidget extends StatefulWidget {
  final List<String> fields;
  final String displayText;
  const CustomMultiSelectorFieldWidget(
      {Key? key, required this.displayText, required this.fields})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomMultiSelectorFieldWidgetState();
}

class _CustomMultiSelectorFieldWidgetState
    extends State<CustomMultiSelectorFieldWidget> {
  late List<MultiSelectItem<String?>> _items;
  bool _isOtherSelected = false;
  @override
  void initState() {
    _items =
        widget.fields.map((val) => MultiSelectItem<String?>(val, val)).toList();
    _items.add(const MultiSelectItem<String?>("Other", "Other"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MultiSelectDialogField(
          items: _items,
          onConfirm: (values) {
            if ((values as List<String?>)
                .any((element) => (element?.compareTo("Other") == 0))) {
              setState(() {
                _isOtherSelected = true;
              });
            } else {
              setState(() {
                _isOtherSelected = false;
              });
            }
          },
          title: Text(widget.displayText),
          buttonText: Text(widget.displayText),
        ),
        if (_isOtherSelected)
          TextFieldTags(
              letterCase: LetterCase.none,
              textSeparators: [','],
              tagsStyler: TagsStyler(),
              textFieldStyler: TextFieldStyler(),
              onTag: (_) {},
              onDelete: (_) {}),
      ],
    );
  }
}
/*
CustomTextField(
              txt:
                  "You chose 'Other'. Enter your desired ${widget.displayText}.",
              textController: TextEditingController()),
              */