import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceSelector extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onSelected;
  final bool shouldSelectInitially; 

  const ChoiceSelector({
    required this.items,
    required this.onSelected,
    this.shouldSelectInitially = true,  
    Key? key,
  }) : super(key: key);

  @override
  _ChoiceSelectorState createState() => _ChoiceSelectorState();
}

class _ChoiceSelectorState extends State<ChoiceSelector> {
  int? _selectedIndex; // Change to nullable so nothing is selected initially

  @override
  void initState() {
    super.initState();
    if (widget.shouldSelectInitially && widget.items.isNotEmpty) {
      _selectedIndex = 0; // Select the first item by default if allowed
    }
  }

  void _onDaySelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onSelected(widget.items[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3,
        ),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final time = widget.items[index];
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
        },
      ),
    );
  }
}
