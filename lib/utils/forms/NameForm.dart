import 'package:flutter/material.dart';

class NameForm extends StatefulWidget {
  String _text, _warning;
  double _left, _top, _right, _bottom;
  TextEditingController _controller;
  TextInputType _inputType;
  NameForm(this._text, this._warning, this._left, this._top, this._right, this._bottom, this._controller, this._inputType);

  @override
  _NameFormState createState() => _NameFormState(_text, _warning, _left, _top, _right, _bottom, _controller, _inputType);
}

class _NameFormState extends State<NameForm> {
  String _text, _warning;
  double _left, _top, _right, _bottom;
  TextEditingController _controller;
  TextInputType _inputType;
  _NameFormState(this._text, this._warning, this._left, this._top, this._right, this._bottom, this._controller, this._inputType);
    
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(_left, _top, _right, _bottom),
      child: TextFormField(
        controller: _controller,
        keyboardType: _inputType,
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