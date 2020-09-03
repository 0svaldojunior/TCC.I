import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  String _text, _warning;
  double _left, _top, _right, _bottom;
  TextEditingController _controller;
  PasswordForm(this._text, this._warning, this._left, this._top, this._right, this._bottom, this._controller);
  
  @override
  PasswordFormState createState() => PasswordFormState(_text, _warning, _left, _top, _right, _bottom, _controller);
}

class PasswordFormState extends State<PasswordForm> {
  double _left, _top, _right, _bottom;
  String _text, _warning;
  TextEditingController _controller;

  bool _obscureText = true;
  Icon _icon = Icon(Icons.visibility, color: Colors.grey);
  PasswordFormState(this._text, this._warning, this._left, this._top, this._right, this._bottom, this._controller);

  void _toggle() {
    setState(() {
      if(_obscureText){
        _obscureText = !_obscureText;
        _icon = Icon(Icons.visibility_off, color: Colors.grey);
      } else {
        _obscureText = !_obscureText;
        _icon = Icon(Icons.visibility, color: Colors.grey);
      }

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(_left, _top, _right, _bottom),
      child: TextFormField(
        controller: _controller,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12
        ),
        decoration: InputDecoration(  
          filled: true,
          fillColor: Colors.black26,   
          prefixIcon: Icon(Icons.vpn_key, color: Colors.lightBlue,),
          suffixIcon: IconButton(
            icon: _icon,
            onPressed: _toggle,
          ),
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