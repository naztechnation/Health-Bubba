

import 'package:flutter/material.dart';

import '../../../../widgets/radio_button.dart';

class RadioButtonWidget extends StatefulWidget {
  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String? _selectedOption = 'Personal';  

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomRadioButton(
              title: 'Personal emergency',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            
            CustomRadioButton(
              title: 'Unavailable',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
          ],
        ),
       
    );
  }
}