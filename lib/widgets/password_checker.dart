import 'package:flutter/material.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

class PasswordStrengthChecker extends StatefulWidget {
  const PasswordStrengthChecker({
    Key? key,
    required this.password,
    required this.onStrengthChanged,
  }) : super(key: key);

  final String password;

  final Function(bool isStrong) onStrengthChanged;

  @override
  State<PasswordStrengthChecker> createState() =>
      _PasswordStrengthCheckerState();
}

class _PasswordStrengthCheckerState extends State<PasswordStrengthChecker> {
  @override
  void didUpdateWidget(covariant PasswordStrengthChecker oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.password != oldWidget.password) {
      final isStrong = _validators.entries.every(
        (entry) => entry.key.hasMatch(widget.password),
      );

      WidgetsBinding.instance!.addPostFrameCallback(
        (_) => widget.onStrengthChanged(isStrong),
      );
    }
  }

  
  final Map<RegExp, String> _validators = {
    RegExp(r'[A-Z]'): 'At least 1 uppercase',
    RegExp(r'\d'): 'At least 1 number',
    RegExp(r'^.{8,32}$'): 'At least 8 characters',
  };

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.password.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _validators.entries.map(
            (entry) {
              final hasMatch = entry.key.hasMatch(widget.password);
              final barColor = hasMatch ? Colors.green : Colors.red;
              final barWidth = MediaQuery.of(context).size.width *
                  (_validators.length / (_validators.length + 1));

              return Expanded(
                child: Container(
                  width: barWidth,
                  
                  height: 4,
                  decoration: BoxDecoration(
                    color: hasValue ? barColor : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.only(right: 4),
                ),
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 10,),
         const Text('Weak password. Must contain;'),
        
        const SizedBox(height: 10),
        ..._validators.entries.map(
          (entry) {
            final hasMatch = entry.key.hasMatch(widget.password);
            final color = hasValue ? (hasMatch ? true : false) : false;
            return Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                children: [
                 color ? const ImageView.svg(AppImages.good) : const ImageView.svg(AppImages.bad),
        const SizedBox(width: 10),

                  Text(
                    entry.value,
                  //  style: TextStyle(color: color),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ],
    );
  }
}
