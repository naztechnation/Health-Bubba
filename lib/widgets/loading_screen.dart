import 'package:flutter/material.dart';
import 'package:healthbubba/res/app_colors.dart';

class LoadersPage extends StatelessWidget {
  final int length;
  const LoadersPage({this.length = 5, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.lightSecondary),
              backgroundColor: AppColors.lightSecondary.withOpacity(0.2),
              strokeWidth: 6,
            ),
            
          ],
        ),
      ),
    );
  }
}

class OverlayHelper {
  static final OverlayHelper _singleton = OverlayHelper._internal();

  factory OverlayHelper() {
    return _singleton;
  }

  OverlayHelper._internal();

  OverlayEntry? _overlayEntry;

  void showOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (context) => LoadersPage(),
      );
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  void hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
