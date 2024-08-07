import 'package:flutter/material.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

    const CustomRadioWidget({super.key, required this.value,required this.groupValue,required this.onChanged, this.width = 30, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onChanged(this.value);
        },
        child: Container(
          height: this.height,
          width: this.width,
          decoration:   ShapeDecoration(
            shape: const CircleBorder(),
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade300,
              ],
            ),
          ),

          child: Center(
            child: Container(
              height: this.height - 8,
              width: this.width - 8,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                gradient: LinearGradient(
                  colors: value == groupValue ? [
                    const Color(0xFF40B93C),
                    const Color(0xFF40B93C),
                  ] : [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}