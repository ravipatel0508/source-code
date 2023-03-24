import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as flutter_blurhash;
import 'package:blurhash/blurhash.dart';

class BlurHashDemo extends StatefulWidget {
  const BlurHashDemo({super.key});

  @override
  State<BlurHashDemo> createState() => _BlurHashDemoState();
}

class _BlurHashDemoState extends State<BlurHashDemo> {
  late final List<String> _imageBlurHash = [
    'L35#U_I=00^O~VR*4:%1E1n%xuSg',
    'L7CQeZH^00%wQLy9L9ID02Vu~To{',
    'L4ATfp%hE2-U00%K9FRR_NM|M|M|',
    'L28;V-rB00ys01M|00o~Dhx]~qMJ',
    'L271TSNC=|5SKP^40yaL}?5Q\$kT0',
    'L5C#S\$|E3;0|:Tv}0|AC^6S2J6\$Q',
    'L3A[.v0h0c^bxgoM0vxZ02};wH0,',
    'L29jGq-TyC5958ae01NJ%eWB}?%2',
  ];
  late final List<String> _image = [
    'https://i.pinimg.com/564x/26/ee/cb/26eecb6e5f89fa599d83e0e6681f9824.jpg',
    'https://i.pinimg.com/564x/9a/14/36/9a143639afb94d9e232db22997885819.jpg',
    'https://i.pinimg.com/564x/1b/38/11/1b3811c6ed52955e64a4c2f643b3b8ec.jpg',
    'https://i.pinimg.com/564x/bc/fe/69/bcfe690cacaa72570f26e8c11914ff37.jpg',
    'https://i.pinimg.com/564x/d9/f5/cd/d9f5cdd455c3c1f0351250a4aa2ceaa3.jpg',
    'https://i.pinimg.com/564x/3a/f2/71/3af271dcaaf387790e74787f1a414eef.jpg',
    'https://i.pinimg.com/564x/58/5d/aa/585daa4855b693358777d04d7dbe5082.jpg',
    'https://i.pinimg.com/564x/d3/4a/0b/d34a0b6db4370aaa33340312af3fefdf.jpg',
  ];

  Future<void> generateImageHash() async {
    ByteData bytes = await NetworkAssetBundle(Uri.parse(_image[0])).load(_image[0]);
    Uint8List pixels = bytes.buffer.asUint8List();
    var blurHash = await BlurHash.encode(pixels, 4, 3);
    log("This is image blurHash :  $blurHash");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            AppBar(automaticallyImplyLeading: false, title: const Text("Flutter BlurHash Demo")),
        body: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: _imageBlurHash.length,
            itemBuilder: (context, index) {
              return flutter_blurhash.BlurHash(
                hash: _imageBlurHash[index],
                // image: _image[index],
                imageFit: BoxFit.cover,
                duration: const Duration(milliseconds: 20000),
              );
            },
          ),
        ),
      );
}
