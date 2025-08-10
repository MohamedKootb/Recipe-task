import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  final ImageParams params;
  AppImage(
    String path, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
    super.key,
  }) : params = ImageParams(
         path,
         width: width,
         height: height,
         fit: fit,
         color: color,
       );

  String get _path => params.path;
  bool get _isNetwork => _path.startsWith('http');
  bool get _isSvg => _path.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    if (params.path.isEmpty) return const SizedBox.shrink();

    if (_isSvg && _isNetwork) return _SvgImage.network(params);
    if (_isSvg) return _SvgImage.asset(params);

    if (_isNetwork) return _NetworkImage(params);
    return _AssetImage(params);
  }
}

class _SvgImage extends StatelessWidget {
  final ImageParams params;
  final bool _isAsset;
  const _SvgImage.asset(this.params) : _isAsset = true;
  const _SvgImage.network(this.params) : _isAsset = false;

  @override
  Widget build(BuildContext context) {
    if (_isAsset) {
      return SvgPicture.asset(
        params.path,
        fit: params.fit ?? BoxFit.contain,
        width: params.width,
        height: params.height,
        // ignore:  deprecated_member_use
        color: params.color,
      );
    }

    return SvgPicture.network(
      params.path,
      fit: params.fit ?? BoxFit.contain,
      width: params.width,
      height: params.height,
      // ignore:  deprecated_member_use
      color: params.color,
      // headers: UserService.getHeaders(),
    );
  }
}

class _AssetImage extends StatelessWidget {
  final ImageParams params;
  const _AssetImage(this.params);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      params.path,
      width: params.width,
      height: params.height,
      fit: params.fit,
      color: params.color,
    );
  }
}

class _NetworkImage extends StatelessWidget {
  final ImageParams params;
  const _NetworkImage(this.params);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: params.path,
      fit: params.fit,
      width: params.width,
      height: params.height,
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fadeInDuration: const Duration(milliseconds: 300),
    );
  }
}

class ImageParams {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const ImageParams(this.path, {this.width, this.height, this.fit, this.color});
}
