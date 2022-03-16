import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CustomMultiSelectorFieldWidget extends StatefulWidget {
  final List<String> fields;
  final String displayText;
  final void Function(List<String?>) onSavedFunc;
  const CustomMultiSelectorFieldWidget(
      {Key? key,
      required this.displayText,
      required this.fields,
      required this.onSavedFunc})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomMultiSelectorFieldWidgetState();
}

class _CustomMultiSelectorFieldWidgetState
    extends State<CustomMultiSelectorFieldWidget> {
  late List<MultiSelectItem<String?>> _items;
  bool _isOtherSelected = false;

  List<String?> _selectedValues = [];
  List<String?> _tagValues = [];
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
          onSaved: (_) {
            if (_isOtherSelected) {
              _selectedValues.addAll(_tagValues);
            }
            widget.onSavedFunc(_selectedValues);
          },
          onConfirm: (values) {
            _selectedValues = values as List<String?>;
            if ((values).any((element) => (element?.compareTo("Other") == 0))) {
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
              textSeparators: const [','],
              tagsStyler: TagsStyler(),
              textFieldStyler: TextFieldStyler(),
              validator: (val) {
                if (widget.fields.any((element) =>
                    element.toLowerCase().compareTo(val.toLowerCase()) == 0)) {
                  return "This value is already present in the drop down above.";
                }
                return null;
              },
              onTag: (val) {
                _tagValues.add(val);
              },
              onDelete: (val) {
                _tagValues.remove(val);
              }),
      ],
    );
  }
}
