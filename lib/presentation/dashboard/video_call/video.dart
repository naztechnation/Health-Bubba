import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

import '../../../handlers/secure_handler.dart';

class VideoCall extends StatefulWidget {
  final String patientName;
  final num patientId;
  final num doctorsId;
  const VideoCall(
      {Key? key,
      required this.patientName,
      required this.patientId,
      required this.doctorsId})
      : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  String createChannelName(num patientId, num doctorsId) {
    List<num> sortedId = [patientId, doctorsId]..sort();

    String channelName = sortedId.join("_");

    return channelName;
  }

  String channelName = "";

  late AgoraClient client;

  String userType = '';

  num doctorsId = 0;

  @override
  void initState() {
    super.initState();

    channelName =
        createChannelName(widget.patientId, widget.doctorsId).toLowerCase();
    initAgora();
  }

  void initAgora() async {
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: "164e47eb399248f5856e254d0e429047",
          channelName: channelName,
          username: widget.patientName,
          tempToken: ''),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );

    await client.initialize();
  }

  @override
  void dispose() {
    onBackPress();
    super.dispose();
  }

  Future<bool> onBackPress() async {
    Navigator.pop(context);

    await client.release();

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true,
              ),
              AgoraVideoButtons(
                client: client,
                addScreenSharing: false,
              ),
              Positioned(
                  top: 100,
                  left: 30,
                  right: 30,
                  child: Align(
                      child: Column(
                    children: [
                      const Text(
                        'Ringing...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.patientName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
