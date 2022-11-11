import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {
  final String? imageUrl;

  const FullScreenImage({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black87,
      body: GestureDetector(
        child: Center(
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(
              imageUrl!,
            ),
          ),
        ),
        // onVerticalDragDown: (details) {
        //   Navigator.pop(context);
        // },
      ),
    );
  }
}
