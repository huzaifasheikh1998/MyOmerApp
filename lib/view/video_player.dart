import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/loader.dart';
import 'package:video_player/video_player.dart';

// Video Plater from URL_LINK Screen
class MyVideoPlayerFromURlScreen extends StatefulWidget {
  const MyVideoPlayerFromURlScreen({super.key, required this.url});
  final String url;
  @override
  State<MyVideoPlayerFromURlScreen> createState() =>
      _MyVideoPlayerFromURlScreenState();
}

class _MyVideoPlayerFromURlScreenState
    extends State<MyVideoPlayerFromURlScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.network(widget.url);
    _videoPlayerController.initialize().then((_) {
      setState(() {
        _chewieController = ChewieController(
          allowedScreenSleep: false,
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          materialProgressColors: ChewieProgressColors(
              handleColor: Colors.white,
              playedColor: AppColors.thirdColor,
              backgroundColor: Colors.black.withOpacity(0.5),
              bufferedColor: AppColors.greyColor),
          looping: false,
          showOptions: false,
          showControls: true,
          aspectRatio: _videoPlayerController.value.aspectRatio,
        );
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: SafeArea(
          child: _videoPlayerController.value.isInitialized
              ? Stack(
                  children: [
                    Chewie(controller: _chewieController),
                    Positioned(
                      top: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                              // Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Loader(
                  loadingColor: AppColors.thirdColor,
                )
          //  loading(
          //     padding: EdgeInsets.symmetric(vertical: Get.height * 0.4)),
          ),
    );
  }
}
