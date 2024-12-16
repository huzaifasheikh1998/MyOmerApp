import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/loader.dart';
import 'package:mvvm/view/video_player.dart';
import 'package:video_player/video_player.dart';

// ALL widgets for Video Player from_url
class VideoFromUrl extends StatefulWidget {
  const VideoFromUrl({super.key, required this.url});
  final String url;
  @override
  State<VideoFromUrl> createState() => _VideoFromUrlState();
}

class _VideoFromUrlState extends State<VideoFromUrl> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyVideoPlayerFromURlScreen(url: widget.url)));
                // Get.to(
                //   () => MyVideoPlayerFromURlScreen(
                //     url: widget.url,
                //   ),
                //   transition: Transition.rightToLeft,
                // );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          : Loader(
              loadingColor: AppColors.thirdColor,
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoFromAsset extends StatefulWidget {
  const VideoFromAsset({super.key, required this.filePath});
  final String filePath;
  @override
  State<VideoFromAsset> createState() => _VideoFromAssetState();
}

class _VideoFromAssetState extends State<VideoFromAsset> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.filePath))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? GestureDetector(
              onTap: () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: VideoPlayer(
                  _controller,
                ),
              ),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
