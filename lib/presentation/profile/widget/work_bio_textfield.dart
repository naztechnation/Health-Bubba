 
import 'package:flutter/material.dart';
import 'package:healthbubba/widgets/modals.dart';
 
import 'package:healthbubba/widgets/text_edit_view.dart';
import 'package:provider/provider.dart';

import '../../../model/view_model/onboard_view_model.dart';

 

class BioWidget extends StatelessWidget {
  final Function(String bio) onTap;

  final BuildContext contex;
  BioWidget({super.key, required this.contex, required this.onTap});

  var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    
     final onboard =
        Provider.of<OnboardViewModel>(context, listen: false);
    return   Padding(
        padding: const EdgeInsets.all(
          15.0),
        
        child: SingleChildScrollView(
          child: Container(
             padding: EdgeInsets.only(bottom: MediaQuery.of(contex).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bio', style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 8,
                ),
                TextEditView(
                  controller: bioController,
                  maxLines: 5,
                  onTap: () {
                          onboard.updateScroll(true);
            
                      
            
                    
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                          
                      },
                      child: const Text('Cancel', style: TextStyle( fontSize: 14, fontWeight: FontWeight.w500))),
                   const SizedBox(
                      width: 15,
                    ),
                   GestureDetector(
                    onTap: () {
                      if (bioController.text.isNotEmpty) {
                        Navigator.pop(context);
            
                       
                          

                        onTap(bioController.text) ; 
                      } else {
                        Modals.showToast('bio required');
                           
            
                      }
                    },
                    child: const Text('Save', style: TextStyle(color: Colors.green,
                     fontSize: 14, fontWeight: FontWeight.w500),)),
                  ],
                ),
                  const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
     
    );
  }
}
