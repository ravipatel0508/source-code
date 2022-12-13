// NOTE: This is a simple example for media picker, Hence if you try to add more than 1 video then the controller will not work properly.

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Package Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: ImagePickerExample(),
    );
  }
}

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  late VideoPlayerController _controller;
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _media = [];

  Future captureImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      log(image.path);
      setState(() {
        _media.add(image);
      });
    }
  }

  Future getImageFromGallery() async {
    final List<XFile>? image1 = await _picker.pickMultiImage();

    if (image1 != null) {
      // log(image1.path);
      setState(() {
        _media.addAll(image1);
      });
    }
  }

  Future captureVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);

    if (video != null) {
      log(video.path);
      setState(() {
        _media.add(video);
        _controller = VideoPlayerController.file(File(video.path))..initialize();
      });
    }
  }

  Future getVideoFromGallery() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      log(video.path);
      setState(() {
        _media.add(video);
        _controller = VideoPlayerController.file(File(video.path))..initialize();
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _media.isEmpty
            ? const Center(
                child: Text('No Media', style: TextStyle(fontSize: 20, color: Colors.grey)),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1c1d1f),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: _media[index].path.endsWith('.mp4')
                            ? Stack(
                                children: [
                                  Center(
                                    child: AspectRatio(
                                      aspectRatio: _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                        });
                                      },
                                      icon: Icon(
                                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Image.file(
                                File(_media[index].path),
                                height: 200,
                                width: 200,
                              ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _media.removeAt(index);
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: _media.length,
              ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Select Image'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text('Camera'),
                            onTap: () {
                              Navigator.pop(context);
                              captureImage();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Gallery'),
                            onTap: () {
                              Navigator.pop(context);
                              getImageFromGallery();
                            },
                          ),
                        ],
                      ),
                    )),
            child: const Icon(Icons.add_a_photo_rounded),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Select Video'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text('Camera'),
                            onTap: () {
                              Navigator.pop(context);
                              captureVideo();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Gallery'),
                            onTap: () {
                              Navigator.pop(context);
                              getVideoFromGallery();
                            },
                          ),
                        ],
                      ),
                    )),
            child: const Icon(Icons.video_call_rounded),
          ),
        ],
      ),
    );
  }
}
