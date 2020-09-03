import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class XOptionDropDown extends StatefulWidget {
  String _question;
  List<String> _answers;
  int _xoption;
  XOptionDropDown(this._question, this._answers, this._xoption);

  @override
  _XOptionDropDownState createState() => _XOptionDropDownState( _question, _answers, _xoption );
}

class _XOptionDropDownState extends State<XOptionDropDown> {
  final List<DropdownMenuItem> items = [];
  List<String> answers;
  String selectedValue, question;
  List<int> selectedItems = [];
  int xoption;
  _XOptionDropDownState( this.question, this.answers, this.xoption );

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
      question : SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: "Selecione $xoption itens",
        searchHint: "Selecione $xoption alternativas",
        validator: (selectedItemsForValidator) {
          if (selectedItemsForValidator.length != xoption) {
            return ("Deve selecionar $xoption alternativas");
          }
          return (null);
        },
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        closeButton: (selectedItems) {
          return (selectedItems.length == xoption ? "Finalizar" : null);
        },
        doneButton: (selectedItemsDone, doneContext) {
          return RaisedButton(
            onPressed: selectedItemsDone.length != xoption
              ? null
              : () {
                  Navigator.pop(doneContext);
                  setState(() {});
                },
            child: Text("Salvar")
          );
        },
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