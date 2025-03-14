import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/handlers/secure_handler.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/app_images.dart';
import '../../../widgets/image_view.dart';
import 'live_chat.dart';

class HelpSupport extends StatefulWidget {
  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  String email = '';
  String username = '';
   late Uri _url;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $_url');
    }
  }

  getUserDetails() async {
    email = await StorageHandler.getUserEmail();
    username = await StorageHandler.getFirstName();
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Help & Support',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 19, bottom: 19),
            child: SizedBox(
              width: 15,
              height: 15,
              child: ImageView.svg(
                AppImages.backBtn,
                height: 15,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                height: 0,
                color: Color(
                  0xFF40B93C,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                    'Need help? You can reach us at any of our official handles',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.4,
                      color: const Color(0xFF0A0D14),
                    )),
              ),const SizedBox(height: 5,),
               Divider(
                color: Colors.grey.shade300,
               
              ),const SizedBox(height: 5,),
              ListTile(
                leading: const SizedBox(
                    width: 17.9,
                    height: 17.9,
                    child: ImageView.svg(AppImages.whatsappIcon)),
                title: Text(
                  'Chat us on Whatsapp',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF5E5F6E),
                  ),
                ),
                subtitle: Text(
                  '+2349163324000',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                trailing: Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 10, 0),
                  width: 4,
                  height: 10,
                  child: SizedBox(
                    width: 4,
                    height: 10,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                onTap: () {
                  AppNavigator.pushAndStackPage(context,
                      page: LiveChat(
                        username: username,
                        email: email,
                      ));
                },
              ),const SizedBox(height: 10,),
              Divider(
                color: Colors.grey.shade300,
                
              ),const SizedBox(height: 10,),
              ListTile(
                onTap: () {
                 
                  _launchUrl("");
                },
                leading: const SizedBox(
                    width: 17.9,
                    height: 17.9,
                    child: ImageView.svg(AppImages.whatsappIcon)),
                title: Text(
                  'Join our whatsapp group to get the latest updates and access the community',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF5E5F6E),
                  ),
                ),
                subtitle: Container(
                   
                  margin:   EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.4, top: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFFFFFFF),
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
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                            width: 18,
                            height: 18,
                            child: ImageView.svg(AppImages.joinIcon)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Join Group',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            height: 1.4,
                            color: const Color(0xFF131316),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                trailing: Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 10, 0),
                  width: 4,
                  height: 10,
                  child: SizedBox(
                    width: 4,
                    height: 10,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),const SizedBox(height: 10,),
              Divider(
                color: Colors.grey.shade300,
                height: 0,
              ),const SizedBox(height: 10,),
               ListTile(
                leading: const SizedBox(
                    width: 17.9,
                    height: 17.9,
                    child: ImageView.svg(AppImages.instagramIcon)),
                title: Text(
                  'Reach out to us on Instagram',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF5E5F6E),
                  ),
                ),
                subtitle: Text(
                  '@Healthbubba',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                trailing: Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 10, 0),
                  width: 4,
                  height: 10,
                  child: SizedBox(
                    width: 4,
                    height: 10,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                onTap: () {
                  
                },
              ),
              const SizedBox(height: 10,),
              Divider(
                color: Colors.grey.shade300,
                height: 0,
              ),
             const SizedBox(height: 10,),
               ListTile(
                
                leading: const SizedBox(
                    width: 17.9,
                    height: 17.9,
                    child: ImageView.svg(AppImages.emailIcon)),
                title: Text(
                  'Email us at',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF5E5F6E),
                  ),
                ),
                subtitle: Text(
                  'info@healthbubba.com',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                trailing: Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 10, 0),
                  width: 4,
                  height: 10,
                  child: SizedBox(
                    width: 4,
                    height: 10,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                onTap: () async{
                  final emailUri = Uri(
                              scheme: 'mailto',
                              path:   "info@healthbubba.com",
                              queryParameters: {
                                'subject': "",
                                'body': "",
                              },
                            );
                            final url = emailUri.toString();

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {}
                },
              ), const SizedBox(height: 10,),Divider(
                color: Colors.grey.shade300,
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
