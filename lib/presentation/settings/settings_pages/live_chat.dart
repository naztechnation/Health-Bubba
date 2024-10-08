
import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';


import '../../../res/app_colors.dart'; 



class LiveChat
 extends StatelessWidget {
  final String username;
  final String email;
  const LiveChat({Key? key, required this.username, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HealthBubba Live Chat',style: TextStyle(color: Colors.white,),),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
        ),
        body: Tawk(
          directChatLink: 'https://tawk.to/chat/655e1d2b91e5c13bb5b2b7f4/1hfrq3t2j',
          visitor: TawkVisitor(
            name: username,
            email: email,
          ),
          
          placeholder:   Center(
            child: Container(
              color: AppColors.indicatorBgColor,
              child:   Center(
                child: CircularProgressIndicator(color: AppColors.indicatorColor,),
              ),
            ),
          ),
        ),
       
    );
  }
}