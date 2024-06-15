

import 'package:flutter/material.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

class NoInternet extends StatelessWidget {
  final String statusCode;

  const NoInternet({super.key, required this.statusCode});
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               
               
              Container(
                margin: const EdgeInsets.fromLTRB(1, 0, 0, 64),
                child: SizedBox(
                  width: 390,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Text(
                                      'No Internet',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        height: 0.9,
                                        color: const Color(0xFF131316),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'It seems you don’t have active internet',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: const Color(0xFF6B7280),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFECDD3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(18, 6, 16.4, 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(statusCode == "404")...[
                                const ImageView.svg(AppImages.notFound),
                              ]else if(statusCode == "500")...[
                                const ImageView.svg(AppImages.internalError),

                              ]else if(statusCode == "503")...[
                                const ImageView.svg(AppImages.maintenace),

                              ]
                               else...[
                                const ImageView.svg(AppImages.noInternet),

                              ],
                              Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(0, 0),
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: Text(
                                 (statusCode == "404") ? 'Not Found' :  (statusCode == "500")? 'Internal Error' : (statusCode == "503") ? 'Maintenance':'Opps an Error occur',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.6,
                                    color: const Color(0xFF131316),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFF093126),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33212126),
                      offset: Offset(0, 1),
                      blurRadius: 1.5,
                    ),
                    BoxShadow(
                      color: Color(0xFF3BAF37),
                      offset: Offset(0, 0),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 0),
                          blurRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Text(
                      'Refresh',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.6,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}