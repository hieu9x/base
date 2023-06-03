import 'package:base/helpers/size_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageLink,
    this.width,
    this.height,
    this.fit,
    this.rootImage = false,
  }) : super(key: key);

  final String imageLink;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool rootImage;

  @override
  Widget build(BuildContext context) {
    if (!imageLink.contains('https')) {
      return const SizedBox();
    }
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageLink,
      memCacheWidth: rootImage ? null : 100.w.toInt(),
      fit: fit,
      errorWidget: (context, url, error) => Stack(
        children: [
          Image.asset(
            "assets/images/apps/not_found.png",
            fit: BoxFit.fill,
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Text(
          //     "Not found: $url",
          //     softWrap: true,
          //     style: const TextStyle(fontSize: 8),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ],
      ),
    );
  }
}
