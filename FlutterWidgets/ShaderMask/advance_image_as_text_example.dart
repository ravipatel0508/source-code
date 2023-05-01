// Source and Credit: https://medium.com/@reliable_jet_macaw_29/fill-the-widget-with-graphics-using-shadermask-2c7a4b4ad79a
//
//
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
const Color background = Colors.white;

const text = 'BUGS\nFIXES';

class ShaderMaskExample extends StatelessWidget {
  const ShaderMaskExample({super.key});

  @override
  Widget build(BuildContext context) {
    const textChild = TextChild(text: text);
    const imageProvider = NetworkImage(
      'https://media.giphy.com/media/5VKbvrjxpVJCM/giphy.gif',
      // 'https://picsum.photos/1000',
    );
    const textWithShader = ImageShaderBuilder(
      imageProvider: imageProvider,
      child: textChild,
    );

    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        title: const Text('ShaderMask'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: background,
              child: textWithShader,
            );
          },
        ),
      ),
    );
  }
}

class ImageShaderBuilder extends StatefulWidget {
  const ImageShaderBuilder({
    super.key,
    required this.imageProvider,
    // Add child widget
    required this.child,
  });

  // Add child widget
  final Widget child;
  final ImageProvider imageProvider;

  @override
  State<ImageShaderBuilder> createState() => _ImageShaderBuilderState();
}

class _ImageShaderBuilderState extends State<ImageShaderBuilder> {
  ImageStream? _imageStream;
  ImageInfo? _imageInfo;

  // Create image shader for given Rect size
  ShaderCallback createImageShader(ui.Image image) {
    shaderCalback(Rect bounds) {
      // Calculate scale for X and Y sides
      final scaleX = bounds.width / image.width / 3;
      final scaleY = bounds.height / image.height / 3;
      final scale = max(scaleX, scaleY);

      // Calculate offset to center resized image
      final scaledImageWidth = image.width * scale;
      final sacledImageHeight = image.height * scale;
      final offset = Offset(
        (scaledImageWidth - bounds.width) / 2,
        (sacledImageHeight - bounds.height) / 2,
      );
      final matrix = Matrix4.identity()
        // Scale image horizontally and vertically
        ..scale(scale, scale)
        // Center horizontally and vertically
        ..leftTranslate(
          -offset.dx,
          -offset.dy,
        );

      // Image shader
      return ImageShader(
        image,
        TileMode.decal,
        TileMode.decal,
        // matrix.storage,
        Matrix4.identity().storage,
      );
    }

    return shaderCalback;
  }

  @override
  Widget build(BuildContext context) {
    final image = _imageInfo?.image;
    if (image == null) {
      return widget.child;
    }
    final shaderCallback = createImageShader(image);
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: shaderCallback,
      child: widget.child,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We call _getImage here because createLocalImageConfiguration() needs to
    // be called again if the dependencies changed, in case the changes relate
    // to the DefaultAssetBundle, MediaQuery, etc, which that method uses.
    _getImage();
  }

  @override
  void didUpdateWidget(ImageShaderBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) {
      _getImage();
    }
  }

  void _getImage() {
    final ImageStream? oldImageStream = _imageStream;
    _imageStream =
        widget.imageProvider.resolve(createLocalImageConfiguration(context));
    if (_imageStream!.key != oldImageStream?.key) {
      // If the keys are the same, then we got the same image back, and so we don't
      // need to update the listeners. If the key changed, though, we must make sure
      // to switch our listeners to the new image stream.
      final ImageStreamListener listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream!.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo?.dispose();
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream?.removeListener(ImageStreamListener(_updateImage));
    _imageInfo?.dispose();
    _imageInfo = null;
    super.dispose();
  }
}

// TEXT CHILD
class TextChild extends StatelessWidget {
  final String text;
  const TextChild({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        text,
        textAlign: TextAlign.center,
        softWrap: false,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 1000,
        ),
      ),
    );
  }
}
