

import 'package:flutter/material.dart';
import 'package:healthbubba/widgets/custom_toast.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/radio_button.dart';

class RadioButtonWidget extends StatefulWidget {
  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String? _selectedOption = 'Personal'; 

  String _radValue = '0';

 

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
    
        Row(
          children: [
            CustomRadioWidget(
               value: "0",
               groupValue: _radValue,
               onChanged: (String value) {
                  setState(() {
                     _radValue = value;
                  });
                   
               },
                  ),
                  const SizedBox(width: 12,),
                    Text('Personal emergency', style: TextStyle(color: (_radValue == '0') ? Colors.black : const Color(0xFF6B7280), fontWeight: (_radValue == '0') ? FontWeight.w500 : FontWeight.w400, fontSize: 14),)
          ],
        ),
      Row(
        children: [
          CustomRadioWidget(
               value: "1",
               groupValue: _radValue,
               onChanged: (String value) {
                  setState(() {
                    _radValue = value;
                    
                  });
               },
          ),
           const SizedBox(width: 12,),
                    Text('Unavailable', style: TextStyle(color: (_radValue == '1') ? Colors.black :   Color(0xFF6B7280), fontWeight: (_radValue == '1') ? FontWeight.w500 : FontWeight.w400, fontSize: 14),)
        ],
      ),
      
      ],
    );
  }
}