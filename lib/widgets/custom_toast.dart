import 'package:flutter/material.dart';
import 'package:healthbubba/res/app_colors.dart';

class CustomToast extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
  final String subtitle;
  final VoidCallback onClose;

  const CustomToast({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: Material(
          elevation: 3,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.lightPrimary,  
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leadingIcon,
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors
                              .lightSecondary, // Replace with your color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Color(0xFF4B5563),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  height: 80,
                  width: 0.5,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(width: 10.0),
                Center(
                  child: GestureDetector(
                    onTap: onClose,
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Color(
                            0xFF4B5563,
                          ),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class ToastService {
  static final ToastService _instance = ToastService._internal();

  factory ToastService() {
    return _instance;
  }

  ToastService._internal();

  OverlayEntry? _overlayEntry;

  void showToast(
    BuildContext context, {
    required Widget leadingIcon,
    required String title,
    required String subtitle,
    Duration duration = const Duration(seconds: 5),
  }) {
    _overlayEntry?.remove();

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 30.0,
        left: 0,
        right: 0,
        child: CustomToast(
          leadingIcon: leadingIcon,
          title: title,
          subtitle: subtitle,
          onClose: _removeToast,
        ),
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);

    Future.delayed(duration, () {
      _removeToast();
    });
  }

  void _removeToast() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
