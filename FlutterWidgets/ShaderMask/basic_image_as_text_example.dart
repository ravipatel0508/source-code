import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShaderMaskExample extends StatelessWidget {
  const ShaderMaskExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShaderMask"),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: const Center(
        child: MaskedImage(
          // image: NetworkImage('https://cdn.eso.org/images/screen/eso1907a.jpg'),
          // image: AssetImage('assets/background.jpg'),
          image: AssetImage('assets/ProfilePic.png'),
          child: Text("Bugs\nFixes",
              style: TextStyle(
                  fontSize: 110,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }
}

class MaskedImage extends StatelessWidget {
  const MaskedImage({
    super.key,
    required this.image,
    required this.child,
  });

  final ImageProvider image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: loadImage(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return ShaderMask(
          shaderCallback: (rect) => ImageShader(
            snapshot.data!,
            TileMode.decal,
            TileMode.decal,
            Matrix4.identity().storage,
          ),
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
    );
  }

  Future<ui.Image> loadImage() async {
    final completer = Completer<ui.Image>();
    final stream = image.resolve(const ImageConfiguration());
    stream.addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));
    return completer.future;
  }
}
