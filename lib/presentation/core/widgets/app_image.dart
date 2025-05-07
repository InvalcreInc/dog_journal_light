import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Displays both [AssetImage] and [CachedNetworkImage].
final class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.image = '',
    this.width = 56.0,
    this.height = 56.0,
    this.placeholder = 'assets/images/placeholder.jpeg',
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.fit = BoxFit.cover,
    this.scale = 1.0,
    this.loading = false,
  });
  final bool loading;
  final double width;
  final double height;
  final String image;
  final String placeholder;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final BoxFit fit;
  final double scale;

  @override
  Widget build(BuildContext context) {
    if (loading) return _buildLaoding(context, "");

    final isAsset = image.isEmpty || image.startsWith('assets');

    if (isAsset) {
      return _buildAssetImage(path: image);
    }

    final isFile = !image.startsWith("http");
    if (isFile) {
      return _buildFileImage();
    }
    return CachedNetworkImage(
      imageUrl: image,
      scale: scale,
      imageBuilder: (_, image) => _buildContainer(image: image),
      errorWidget: (context, url, error) => _buildAssetImage(),
      placeholder: _buildLaoding,
    );
  }

  Widget _buildLaoding(BuildContext context, String url) {
    return Container(
      height: height,
      width: width,
      decoration: _getBoxDecoration(),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[350]!,
        highlightColor: Colors.white,
        child: Container(color: Colors.white),
      ),
    );
  }

  BorderRadiusGeometry? _borderRadius() {
    if (shape == BoxShape.circle) {
      return null;
    }
    return borderRadius ?? BorderRadius.circular(8);
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(shape: shape, borderRadius: _borderRadius());
  }

  Widget _buildFileImage() {
    //final isFile = File(image).existsSync();
    //if (!isFile) return _buildAssetImage();
    return _buildContainer(
      image:
          Image.file(
            File(image),
            errorBuilder: (e, _, __) => _buildAssetImage(),
          ).image,
    );
  }

  Widget _buildAssetImage({String path = ''}) => _buildContainer(
    image: Image.asset(image.isEmpty ? placeholder : path).image,
  );

  Widget _buildContainer({ImageProvider<Object>? image}) {
    return Container(
      height: height,
      width: width,
      decoration: _getBoxDecoration().copyWith(
        image:
            image == null
                ? null
                : DecorationImage(image: image, fit: fit, onError: (e, s) {}),
      ),
    );
  }
}
