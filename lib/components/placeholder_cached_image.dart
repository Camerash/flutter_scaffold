import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlaceholderCachedImage extends StatelessWidget {
  const PlaceholderCachedImage({
    super.key,
    required this.url,
    this.fit,
    this.color,
    this.colorBlendMode,
    this.onTap,
    this.child,
  });

  final String? url;
  final BoxFit? fit;
  final Color? color;
  final BlendMode? colorBlendMode;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return url == null
        ? _getImageInkWell(const AssetImage('assets/images/placeholder.png'))
        : CachedNetworkImage(
            imageUrl: url!,
            fit: fit,
            color: color,
            colorBlendMode: colorBlendMode,
            imageBuilder: (context, imageProvider) {
              return _getImageInkWell(imageProvider);
            },
            placeholder: (context, _) => _getPlaceholder(),
            errorWidget: (context, _, __) => _getPlaceholder(),
          );
  }

  Widget _getImageInkWell(ImageProvider imageProvider) {
    return Material(
      color: Colors.white,
      child: Ink.image(
        image: imageProvider,
        fit: fit,
        colorFilter: color != null && colorBlendMode != null
            ? ColorFilter.mode(
                color!,
                colorBlendMode!,
              )
            : null,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }

  Widget _getPlaceholder() {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
