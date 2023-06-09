import 'dart:developer';
import 'package:adminapp/const/colors.dart';
import 'package:adminapp/const/const.dart';
import 'package:adminapp/fuctions/image_picker.dart';
import 'package:flutter/material.dart';

List<String> image = [];

class AddImageWidget extends StatefulWidget {
  AddImageWidget({super.key});

  @override
  State<AddImageWidget> createState() => _AddImageWidgetState();
}

class _AddImageWidgetState extends State<AddImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kwhite, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() async {
                    final imageurl = await Images.getimage();
                    image.add(imageurl.toString());
                    setState(() {});
                    log(image.toString());
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.add,
                      size: 36,
                      color: kblue,
                    ),
                    Text(
                      'Add Images',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: image.length,
                    itemBuilder: (BuildContext context, int index) {
                      return imageContainer(
                          context, image[index], image, index);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        kheight20,
                  ),
                )),
            kheight20,
          ],
        ),
      ),
    );
  }

  imageContainer(context, imgUrl, List imagelist, int index) {
    final srcWidth = MediaQuery.of(context).size.width * 0.9;
    return Stack(children: [
      Container(
        width: srcWidth,
        height: srcWidth * 0.7,
        decoration: BoxDecoration(
          color: kwhite,
          image: DecorationImage(
            image: NetworkImage(imgUrl),
          ),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 5,
        child: GestureDetector(
          onTap: () {
            setState(() {
              imagelist.removeAt(index);
            });
          },
          child: const CircleAvatar(
            backgroundColor: kblue,
            radius: 20,
            child: Icon(Icons.remove),
          ),
        ),
      )
    ]);
  }
}
