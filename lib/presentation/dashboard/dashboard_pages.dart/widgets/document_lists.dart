import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

class DocumentLists extends StatelessWidget {
  const DocumentLists({super.key});

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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDetailScreen(
                      imageUrl: AppImages.onboardingThree,
                      tag: 'image$index',
                    ),
                  ),
                );
                    },
                    child: Hero(
                      tag: 'image$index',
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const ImageView.asset(
                            AppImages.onboardingThree,
                            height: 60,
                            width: 70,
                            fit: BoxFit.cover,
                          )),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const ImageView.asset(
                        AppImages.pdf,
                        height: 60,
                        width: 70,
                        fit: BoxFit.cover,
                      ));
                },
              ),
            ),
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
