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
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),

      child: Container(

            margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0.0),

        decoration: BoxDecoration(
                  color: AppColors.lightPrimary,  
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFF0F0F0),
                              offset: Offset(0, 0),
                              blurRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x409F9E9E),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                            ),
                          ],
                ),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(16),
          type: MaterialType.card,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
            
            decoration: BoxDecoration(
              color: AppColors.lightPrimary,  
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFF0F0F0),
                          offset: Offset(0, 0),
                          blurRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x409F9E9E),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                        ),
                      ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
               
                  
                Padding(
                  padding: const EdgeInsets.only(bottom:18.0),
                  child: leadingIcon,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors
                              .lightSecondary,  
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        maxLines: 2,
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
                const SizedBox(width: 16.0),
                Align(
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
        ),
      ),
    );
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
        top: MediaQuery.of(context).padding.top + 20.0,
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
