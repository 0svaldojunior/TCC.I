import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class XOptionMenuDropDown extends StatefulWidget {
  String _question;
  List<String> _answers;
  int _xoption;
  XOptionMenuDropDown(this._question, this._answers, this._xoption);

  @override
  _XOptionMenuDropDownState createState() => _XOptionMenuDropDownState( _question, _answers, _xoption );
}

class _XOptionMenuDropDownState extends State<XOptionMenuDropDown> {
  final List<DropdownMenuItem> items = [];
  List<String> answers;
  String selectedValue, question;
  List<int> selectedItems = [];
  int xoption;
  _XOptionMenuDropDownState( this.question, this.answers, this.xoption );

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
            return ("$xoption Seleções");
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
        dialogBox: false,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
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