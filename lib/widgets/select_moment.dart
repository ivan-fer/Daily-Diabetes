import 'package:flutter/material.dart';
import '../constants.dart';

class SelectMoment extends StatefulWidget {
  final ValueChanged<String> onSelectedChip;
  final EdgeInsets margin;

  const SelectMoment({Key key, @required this.onSelectedChip, this.margin})
      : super(key: key);

  @override
  _SelectMomentState createState() => _SelectMomentState();
}

class _SelectMomentState extends State<SelectMoment> {
  String selectedChoice = momentList[0];

  _buildChoiceList() {
    widget.onSelectedChip(selectedChoice);
    List<Widget> choices = List();
    choices.add(Text('momento'));
    choices.add(Divider());
    momentList.forEach(
      (element) {
        choices.add(
          ChoiceChip(
            label: Text(
              element,
              style: TextStyle(fontSize: 12, color: primaryTextColor),
            ),
            selected: selectedChoice == element,
            onSelected: (selected) {
              setState(
                () {
                  selectedChoice = element;
                  widget.onSelectedChip(selectedChoice);
                },
              );
            },
          ),
        );
      },
    );
    choices.add(Divider());
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Wrap(
        spacing: 3.0,
        runSpacing: 1.0,
        children: _buildChoiceList(),
      ),
    );
  }
}
