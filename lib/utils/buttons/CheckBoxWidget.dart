import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  bool _isCheck;
  double _left, _top, _right, _bottom;
  CheckBoxWidget(this._isCheck, this._left, this._top, this._right, this._bottom);
  
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState(_isCheck, _left, _top, _right, _bottom);
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isCheck;
  double left, top, right, bottom;
  _CheckBoxWidgetState(this._isCheck,this.left, this.top, this.right, this.bottom);
  

  void toggle() {
    setState(() {
      _isCheck = !_isCheck;
    });
    // print("Estado do check: $_isCheck");
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Checkbox(
        value: _isCheck,
        onChanged: (value) { toggle(); },
        activeColor: Colors.lightBlueAccent,
        checkColor: Colors.white,
        tristate: false,
      ),
    );
  }
}