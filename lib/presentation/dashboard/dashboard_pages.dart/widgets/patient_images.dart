 
import 'package:flutter/material.dart';
 
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

class PatientImages extends StatelessWidget {
  final List<String> patientImages;
  const PatientImages({super.key, required this.patientImages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  ImageView.svg(
                    AppImages.backBtn,
                    height: 20,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text('Back')
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: patientImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDetailScreen(
                      imageUrl: patientImages[index],
                      tag: 'image$index',
                    ),
                  ),
                );
                    },
                    // height: 60,
                    //         width: 70,
                    child: Hero(
                      tag: 'image$index',
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:  
                          Image.network(
                                      fit: BoxFit.cover,
                                      patientImages[index] ?? '',
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const ImageView.svg(
                                              fit: BoxFit.cover,
                                                AppImages.gallery, );
                                      },
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                         return const ImageView.svg(
                                              fit: BoxFit.cover,
                                                AppImages.gallery, );
                                        }
                                        return const ImageView.svg(
                                              fit: BoxFit.cover,
                                                AppImages.gallery, );
                                      },
                                    ),
                          
                          
                           
                   ) ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 4,
            //       crossAxisSpacing: 8.0,
            //       mainAxisSpacing: 8.0,
            //     ),
            //     itemCount: 1,
            //     itemBuilder: (context, index) {
            //       return ClipRRect(
            //           borderRadius: BorderRadius.circular(10),
            //           child: const ImageView.asset(
            //             AppImages.pdf,
            //             height: 60,
            //             width: 70,
            //             fit: BoxFit.cover,
            //           ));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const ImageDetailScreen({super.key, required this.imageUrl, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            height: MediaQuery.sizeOf(context).height,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Hero(
                tag: tag,
                child: ImageView.asset(imageUrl,fit: BoxFit.cover,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
