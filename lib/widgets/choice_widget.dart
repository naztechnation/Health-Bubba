import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceSelector extends StatefulWidget {
  final List<String> days;
  final ValueChanged<String> onSelected;

  const ChoiceSelector({
    required this.days,
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
    widget.onSelected(widget.days[index]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,  
        childAspectRatio: 2.5, 
        mainAxisSpacing: 7.0, 
        crossAxisSpacing: 7.0,  
      ),
      itemCount: widget.days.length,
      itemBuilder: (context, index) {
        bool isSelected = _selectedIndex == index;
        return GestureDetector(
          onTap: () => _onDaySelected(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: .0),
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
                widget.days[index],
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
        );
      },
    );
  }
}
