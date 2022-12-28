import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const String brokenImage =
    'https://static.thenounproject.com/png/3237447-200.png';

class CachedImage extends StatelessWidget {
  final String source;
  final Widget Function(BuildContext context, String error, dynamic stackrace)?
      errorBuilder;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Clip clipBehavior;
  final BoxShape shape;
  final BoxBorder? border;

  const CachedImage({
    Key? key,
    required this.source,
    this.fit = BoxFit.cover,
    this.errorBuilder,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.shape = BoxShape.rectangle,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFromAsset = source.toLowerCase().startsWith('assets');

    return Container(
      width: width,
      height: height,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(shape: shape),
      foregroundDecoration: BoxDecoration(shape: shape, border: border),
      child: CachedNetworkImage(
        imageUrl: isFromAsset ? 'assets/$source' : source,
        fit: fit,
        width: width,
        height: height,
        memCacheHeight: height?.toInt(),
        memCacheWidth: width?.toInt(),
        progressIndicatorBuilder: (context, url, progress) =>
            _progressIndicator(progress),
        errorWidget: errorBuilder ?? (context, e, s) => _errorImage(),
      ),
    );
  }

  Widget _errorImage() {
    return Container(
      color: Colors.grey.shade100,
      child: const FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 0.6,
        child: FittedBox(
          child: Icon(
            Icons.broken_image_outlined,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _progressIndicator(DownloadProgress progress) {
    return Center(
      child: SizedBox.square(
        dimension: 32.0,
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
    );
  }
}
