 
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'res/app_strings.dart';

class CallInviteScreen extends StatelessWidget {
  final String inviteeId;
  final String inviteeName;
  const CallInviteScreen({super.key, required this.inviteeId, required this.inviteeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZegoSendCallInvitationButton(
                          invitees: [
                            ZegoUIKitUser(
                              id: inviteeId,
                              name: inviteeName,
                            ),
                          ],
                          isVideoCall: true,
                          resourceID: AppStrings.zegoResourceId,
                        ),
      ),
    );
  }
}