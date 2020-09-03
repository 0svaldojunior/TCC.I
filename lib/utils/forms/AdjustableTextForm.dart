import 'package:flutter/material.dart';

class AdjustableTextForm extends StatefulWidget {
  String _text, _warning;
  List<double> _padding;
  TextInputType _keyboardType;
  AdjustableTextForm(this._text, this._warning, this._padding, this._keyboardType);

  @override
  _AdjustableTextFormState createState() => _AdjustableTextFormState(_text, _warning, _padding, _keyboardType);
}

class _AdjustableTextFormState extends State<AdjustableTextForm> {
  String _text, _warning;
  List<double> _padding;
  TextInputType _keyboardType;
  _AdjustableTextFormState(this._text, this._warning, this._padding, this._keyboardType);
    
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(_padding[0], _padding[1], _padding[2], _padding[3]),
      child: TextFormField(        
        keyboardType: _keyboardType,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        decoration: InputDecoration(      
          filled: true,          
          fillColor: Colors.black26,
          labelText: _text,
          hintText: _warning,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15,
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
