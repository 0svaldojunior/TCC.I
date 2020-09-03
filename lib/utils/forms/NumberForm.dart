import 'package:flutter/material.dart';

class NumberForm extends StatefulWidget {
  String _text, _warning;
  double _left, _top, _right, _bottom;
  NumberForm(this._text, this._warning, this._left, this._top, this._right, this._bottom);

  @override
  _NumberFormState createState() => _NumberFormState(_text, _warning, _left, _top, _right, _bottom);
}

class _NumberFormState extends State<NumberForm> {
  String _text, _warning;
  double _left, _top, _right, _bottom;
  _NumberFormState(this._text, this._warning, this._left, this._top, this._right, this._bottom);
    
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(_left, _top, _right, _bottom),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15
        ),
        decoration: InputDecoration(      
          filled: true,
          fillColor: Colors.black26,
          labelText: _text,
          hintText: _warning,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 1.0
            )
          ),
          labelStyle: TextStyle(
            color: Colors.lightBlue
          )
        ),
      ),
    );
  }

}