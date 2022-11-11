// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:telesmile/src/constants/loggers.dart';
import 'package:telesmile/src/controller/blindmode_controller.dart';
import 'package:telesmile/src/models/gallery_model.dart';
import 'package:telesmile/src/services/http_services.dart';
import 'package:telesmile/src/view/widgets/widgets.dart';

import 'image_photoview.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final blindcontroller = Get.put(Blindmode());

  var galleryphotos;
  bool isLoading = true;

  loadgallery() async {
    var result = await HttpService.getGalleryModel();
    setState(() {
      galleryphotos = GalleryModel.fromJson(result);
      isLoading = false;
      logger.d("[GalleryPage] imaglink data: " +
          galleryphotos.category[0].imagePath);
    });
  }

  @override
  void initState() {
    loadgallery();
    blindcontroller.blind(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          heading: 'Gallery',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        // leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {},),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: galleryphotos.category.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      pushNewScreen(
                        context,
                        withNavBar: false,
                        screen: FullScreenImage(
                          imageUrl: galleryphotos.category[index].imagePath,
                          // tag: "anything",
                        ),
                      );
                    },
                    child: Card(
                      child: Image(
                        image: CachedNetworkImageProvider(
                          galleryphotos.category[index].imagePath,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
