import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class SingleDropDown extends StatefulWidget {
  String _question;
  List<String> _answers;
  SingleDropDown(this._question, this._answers);

  @override
  _SingleDropDownState createState() => _SingleDropDownState( _question, _answers );
}

class _SingleDropDownState extends State<SingleDropDown> {
  final List<DropdownMenuItem> items = [];
  List<String> answers;
  String selectedValue, question;
  _SingleDropDownState( this.question, this.answers );

@override
  void initState() {
    for( String element in answers ) {
      items.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets = {
      question : SearchableDropdown.single(
        items: items,
        value: selectedValue,
        hint: "Selecione uma das alternativas",
        searchHint: "Selecione uma das alternativas",
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        closeButton: "Salvar",
        doneButton: "Sair",
        displayItem: (item, selected) {
          return Row(
            children: [
              selected ? Icon(
                Icons.radio_button_checked,
                color: Colors.grey,
              ) : Icon(
                Icons.radio_button_unchecked,
                color: Colors.grey,
              ),
              SizedBox(width: 7),
              Expanded( child: item ),
           ]
          );
        },
        isExpanded: true,
      )
    };

    return Column(
      children: widgets
        .map((k, v) {
          return MapEntry(
            k,
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text("$k:"),
                      v,
                    ],
                  ),
                )
              )
            )
          );
        })
        .values
        .toList(),
    );
  }
}