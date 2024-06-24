import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceSelector extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onSelected;

  const ChoiceSelector({
    required this.items,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  _ChoiceSelectorState createState() => _ChoiceSelectorState();
}

class _ChoiceSelectorState extends State<ChoiceSelector> {
  int _selectedIndex = 0;  

  void _onDaySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onSelected(widget.items[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,  
      runSpacing: 8.0,  
      children: List<Widget>.generate(widget.items.length, (index) {
        bool isSelected = _selectedIndex == index;
        return GestureDetector(
          onTap: () => _onDaySelected(index),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 9.0),  
              decoration: isSelected
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(9999),
                      color: const Color(0xFF2F3037),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x4D2F3037),
                          offset: Offset(0, 2),
                          blurRadius: 2,
                        ),
                        BoxShadow(
                          color: Color(0xFF2F3037),
                          offset: Offset(0, 0),
                          blurRadius: 0,
                        ),
                      ],
                    )
                  : null,
              child: Center(
                child: Text(
                  widget.items[index],
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
