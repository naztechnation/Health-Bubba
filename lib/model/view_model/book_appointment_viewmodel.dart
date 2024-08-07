import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../res/app_images.dart';
import '../../res/enum.dart';
import '../../widgets/image_view.dart';
import 'base_viewmodel.dart';

class BookAppointmentViewModel extends BaseViewModel {
 
  late DateTime? _selectedDate;
  late String _formattedMonth;
  late String _formattedYear;
  late int? _selectedDay;
  
  List<File> _imageUrls = [];

  ImageSourceType imageType = ImageSourceType.none;

  ImagePicker picker = ImagePicker();
  
  BookAppointmentViewModel() {
    _selectedDate = DateTime.now();
    _formattedMonth = _formatMonth(DateTime.now());
    _formattedYear = _formatYear(DateTime.now()); 
     _selectedDay = null;
  }
 
  void setSelectedDate(DateTime? date) {  
    if (date != null) {
      _selectedDate = date;
      _formattedMonth = _formatMonth(date);
      _formattedYear = _formatYear(date);
      _selectedDay = date.day;
    }
    setViewState(ViewState.success);
  }

  loadImage(BuildContext context, Function() onTap) async {
  await showModalBottomSheet<dynamic>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext bc) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (_imageUrls.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                     
                      onTap();
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                Text(
                  'Choose from Gallery',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    ..._imageUrls.map((file) => Container(
                          height: 69,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey.shade300, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0A000000),
                                offset: Offset(0, 1),
                                blurRadius: 1.5,
                              ),
                              BoxShadow(
                                color: Color(0x0D2F3037),
                                offset: Offset(0, 24),
                                blurRadius: 34,
                              ),
                              BoxShadow(
                                color: Color(0x0A222A35),
                                offset: Offset(0, 4),
                                blurRadius: 3,
                              ),
                              BoxShadow(
                                color: Color(0x0D000000),
                                offset: Offset(0, 1),
                                blurRadius: 0.5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ImageView.file(
                              file,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    GestureDetector(
                      onTap: () async {
                        final images = await ImagePicker().pickMultiImage(
                          imageQuality: 30,
                          maxHeight: 500,
                          maxWidth: 500,
                        );
                        if (images != null) {
                          setState(() {
                            _imageUrls.addAll(images.map((image) => File(image.path)));
                          });
                          imageType = ImageSourceType.gallery;
                          setViewState(ViewState.success);
                        }
                      },
                      child: Container(
                        height: 69,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300, width: 2),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0A000000),
                              offset: Offset(0, 1),
                              blurRadius: 1.5,
                            ),
                            BoxShadow(
                              color: Color(0x0D2F3037),
                              offset: Offset(0, 24),
                              blurRadius: 34,
                            ),
                            BoxShadow(
                              color: Color(0x0A222A35),
                              offset: Offset(0, 4),
                              blurRadius: 3,
                            ),
                            BoxShadow(
                              color: Color(0x0D000000),
                              offset: Offset(0, 1),
                              blurRadius: 0.5,
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: ImageView.svg(AppImages.gallery),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Take photo',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                          imageQuality: 30,
                          maxHeight: 500,
                          maxWidth: 500,
                        );
                        if (image != null) {
                          setState(() {
                            _imageUrls.add(File(image.path));
                          });
                          imageType = ImageSourceType.camera;
                          setViewState(ViewState.success);
                        }
                      },
                      child: Container(
                        height: 69,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300, width: 2),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x0A000000),
                              offset: Offset(0, 1),
                              blurRadius: 1.5,
                            ),
                            BoxShadow(
                              color: Color(0x0D2F3037),
                              offset: Offset(0, 24),
                              blurRadius: 34,
                            ),
                            BoxShadow(
                              color: Color(0x0A222A35),
                              offset: Offset(0, 4),
                              blurRadius: 3,
                            ),
                            BoxShadow(
                              color: Color(0x0D000000),
                              offset: Offset(0, 1),
                              blurRadius: 0.5,
                            ),
                          ],
                        ),
                        child: const SizedBox(
                          height: 20,
                          width: 20,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: ImageView.svg(AppImages.photo),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


  String _formatMonth(DateTime date) {
    return DateFormat('MMM').format(date);
  }

  String _formatYear(DateTime date) {
    return DateFormat('yyyy').format(date);
  }

  DateTime? get selectedDate => _selectedDate; 
  
  String get formattedMonth => _formattedMonth;

  String get formattedYear => _formattedYear;
  List<File> get imageUrls => _imageUrls;

  int get selectedDay => _selectedDay ?? 0;

    

}
