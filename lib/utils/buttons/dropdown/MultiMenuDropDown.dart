import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class MultiMenuDropDown extends StatefulWidget {
  String _question;
  List<String> _answers;
  MultiMenuDropDown(this._question, this._answers);

  @override
  _MultiMenuDropDownState createState() => _MultiMenuDropDownState( _question, _answers );
}

class _MultiMenuDropDownState extends State<MultiMenuDropDown> {
  final List<DropdownMenuItem> items = [];
  List<String> answers;
  String selectedValue, question;
  List<int> selectedItems = [];
  _MultiMenuDropDownState( this.question, this.answers );

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
        hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Selecione as opções"),
        ),
        searchHint: "Selecione as opções",
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        closeButton: (selectedItems) {
          return (selectedItems.isNotEmpty
            ? "Salvar ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' +selectedItems.length.toString() + ')'}"
            : "Selecione para salvar!");
        },
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
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
        isExpanded: true,
        dialogBox: false,
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