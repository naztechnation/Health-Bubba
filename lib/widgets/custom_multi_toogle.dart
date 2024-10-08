

import 'package:flutter/material.dart';

import '../../res/app_colors.dart';



class CustomMultiToggle extends StatefulWidget {
  final Color? color;
  final Color? selectedColor;
  final Color? textColor;
  final Color? selectedTextColor;
  final Color? backgroundColor;
  final List<dynamic> title;
  final List<String>? subtitle;
  final List<int>? selectedIndex;
  final double elevation;
  final double height;
  final double fontSize;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? contentMargin;
  final void Function(int index)? onSelected;
  const CustomMultiToggle(
      {Key? key,
        this.color,
        this.selectedColor,
        this.textColor,
        this.selectedTextColor,
        this.backgroundColor,
        required this.title,
        this.subtitle,
        this.onSelected,
        this.selectedIndex,
        this.height=40.0,
        this.contentPadding=const EdgeInsets
            .symmetric(horizontal: 15.0, vertical: 8),
        this.contentMargin=const EdgeInsets.all(12.0),
        this.fontSize = 16,
        this.elevation = 0})
      : super(key: key);

  @override
  _CustomMultiToggleState createState() => _CustomMultiToggleState();
}

class _CustomMultiToggleState extends State<CustomMultiToggle> {

  final List<int> _selectedIndex = [];


  Widget _toggle(
      {required bool selected,
      required String title,
        String? subtitle,
       
      required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),

        ),
        color: selected
                  ? (widget.selectedColor ??
                      AppColors.lightSecondary)
                  : (widget.color ?? Theme.of(context).primaryColor),
        child: Container(
            height: widget.height,
            padding: widget.contentPadding,
            margin: widget.contentMargin,
            decoration: BoxDecoration(
              color: selected
                  ? (widget.selectedColor ??
                      AppColors.lightSecondary)
                  : (widget.color ?? Theme.of(context).primaryColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
               
                border: Border.all(
                    width: 1.0,
                    color:  selected
                  ? 
                      widget.selectedColor ?? AppColors.lightSecondary
                  : (widget.color ?? Theme.of(context).primaryColor),
                    style: BorderStyle.solid)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: selected
                              ? (widget.selectedTextColor ??
                                  Theme.of(context).primaryColor)
                              : (widget.textColor ??
                                  Theme.of(context).textTheme.bodyMedium!.color),
                          fontSize: widget.fontSize,
                
                          fontWeight: FontWeight.w600)),
                ),
               
              ],
            )),
      ),
    );
  }

  Widget _toggleButton() {
    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          )),
      child: Builder(builder: (context) {
        return Wrap(
          children: List.generate(
              widget.title.length,
                  (index){
                final selected=(widget.selectedIndex ?? _selectedIndex).contains(index);
                return _toggle(
                    onTap: () {
                      setState((){
                       _selectedIndex.clear();
                        _selectedIndex.add(index);
                      });
                      widget.onSelected!(index);
                    },
                    title: widget.title[index],
                    subtitle: widget.subtitle?[index],
                    selected: selected,
                    );
              }),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _toggleButton();
  }

}