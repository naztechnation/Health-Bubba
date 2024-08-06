import 'package:flutter/material.dart';
import 'package:healthbubba/res/app_colors.dart';

class LoadersPage extends StatelessWidget {
  final int length;
  const LoadersPage({this.length = 5, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
                  Container(color: Colors.white,height: MediaQuery.sizeOf(context).height,width: MediaQuery.sizeOf(context).height,)
,
        Container(
                    color: AppColors.indicatorBgColor,
                    child:   Center(
                      child: CircularProgressIndicator(color: AppColors.indicatorColor),
                    ),
                  ),
      ],
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
        builder: (context) => const LoadersPage(),
      );
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  void hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
