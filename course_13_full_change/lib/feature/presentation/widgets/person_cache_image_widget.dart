import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_13_full/common/app_colors.dart';
import 'package:flutter/material.dart';

class PersonCacheImage extends StatelessWidget {
  final String? imageUrl;
  final double? width, height;

  const PersonCacheImage({super.key, this.imageUrl, this.width, this.height});

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return Container(color: AppColors.cellBackground,
          child: const Center(child: SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))));
      },
      errorWidget: (context, url, error) {
        return _imageWidget(
          AssetImage('assets/images/noimage.jpg'),
        );
      },
    );
  }
}
