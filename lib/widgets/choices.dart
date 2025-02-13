import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Choices extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onSelected;
  final bool lockSecondOption;

  const Choices({
    required this.items,
    required this.onSelected,
    this.lockSecondOption = false,
    Key? key,
  }) : super(key: key);

  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.lockSecondOption && widget.items.length > 1) {
      _selectedIndex = 1; // Auto-select second option
    }
  }

  @override
  void didUpdateWidget(covariant Choices oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.lockSecondOption && _selectedIndex != 1 && widget.items.length > 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _selectedIndex = 1; // Auto-switch to second option after the build phase
          });
          widget.onSelected(widget.items[1]);
        }
      });
    }
  }

  void _onDaySelected(int index) {
    if (widget.lockSecondOption && index != 1) return; // Prevent changing selection if locked

    setState(() {
      _selectedIndex = index;
    });
    widget.onSelected(widget.items[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: widget.items.asMap().entries.map((entry) {
        int index = entry.key;
        String time = entry.value;
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
                  time,
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
      }).toList(),
    );
  }
}
