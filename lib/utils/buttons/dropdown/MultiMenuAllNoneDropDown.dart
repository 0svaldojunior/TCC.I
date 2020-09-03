import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class MultiMenuAllNoneDropDown extends StatefulWidget {
  String _question;
  List<String> _answers;
  MultiMenuAllNoneDropDown(this._question, this._answers);

  @override
  _MultiMenuAllNoneDropDownState createState() => _MultiMenuAllNoneDropDownState( _question, _answers );
}

class _MultiMenuAllNoneDropDownState extends State<MultiMenuAllNoneDropDown> {
  final List<DropdownMenuItem> items = [];
  List<String> answers;
  String selectedValue, question;
  List<int> selectedItems = [];
  _MultiMenuAllNoneDropDownState( this.question, this.answers );

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
        searchHint: "Selecione as Alternativas",
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        closeButton: (selectedItemsClose) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    selectedItems.clear();
                    selectedItems.addAll(
                      Iterable<int>.generate(items.length).toList()
                    );
                  });
                },
                child: Text("Selecionar tudo"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    selectedItems.clear();
                  });
                },
                child: Text("Limpar seleção"),
              )
            ],
          );
        },
        doneButton: "Salvar",
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