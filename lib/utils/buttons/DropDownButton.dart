import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  double _left, _top, _right, _bottom;
  List<String> _answers;
  DropDownButton(this._answers, this._left, this._top, this._right, this._bottom);

  @override
  _DropDownButtonState createState() => _DropDownButtonState(this._answers, this._left, this._top, this._right, this._bottom);
}

class _DropDownButtonState extends State<DropDownButton> {
  double _left, _top, _right, _bottom;
  String dropdownValue;
  List<String> _answers;
  _DropDownButtonState(this._answers, this._left, this._top, this._right, this._bottom){
    dropdownValue = _answers.first;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(_left, _top, _right, _bottom),
      padding: EdgeInsets.fromLTRB(_left, _top, _right, _bottom),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          itemHeight: 100.0,
          autofocus: true,
          iconSize: 50,
          dropdownColor: Colors.black,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.white,
          style: TextStyle(
            color: Colors.lightBlue
          ),
          underline: Container(
            height: 2,
            color: Colors.lightBlue,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: _answers
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.5),
                    child: SingleChildScrollView(
                      child: Text(
                        value,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15
                        ),
                      )
                    )
                  ),
                ),
              );
            })
            .toList(),
        )
      )
    );
  }
}