import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  String _text, _warning;
  double _left, _top, _right, _bottom;
  TextEditingController _controller;
  EmailForm(this._text, this._warning, this._left, this._top, this._right, this._bottom, this._controller);
  
  @override
  _EmailFormState createState() => _EmailFormState(_text, _warning, _left, _top, _right, _bottom, _controller);
}

class _EmailFormState extends State<EmailForm> {
  String _text, _warning;
  double _left, _top, _right, _bottom;
  TextEditingController _controller;
  _EmailFormState(this._text, this._warning, this._left, this._top, this._right, this._bottom, this._controller);

  void _toggle() {
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(_left, _top, _right, _bottom),
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black26,     
          prefixIcon: Icon(Icons.account_circle, color: Colors.lightBlue,),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Colors.white,), 
            onPressed: _toggle
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