import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  CustomRadioButton({
    required this.title,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Radio<String>(
        value: title,
        groupValue: groupValue,
        onChanged: onChanged,
        
      ),
      
    );
  }
}