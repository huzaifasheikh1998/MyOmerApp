import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/repository/video_repo.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/appbar.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/components/video_widget.dart';
import 'package:mvvm/res/size.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    VideoRepo videoRepo = VideoRepo();
    return Scaffold(
      appBar: MyAppBar(title: "Video"),
      body: Container(
        margin: EdgeInsets.all(sized.primaryMargin),
        child: Column(
          children: [
            FutureBuilder(
                future: videoRepo.fetchVideoList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: PageView.builder(
                          itemCount: videoRepo.videoList.length,
                          itemBuilder: (conterxt, index) {
                            final iteration = videoRepo.videoList[index];
                            return VideoWidget(
                              day: iteration.day.toString(),
                              title: iteration.mainHeading.toString(),
                              subTitle: iteration.subHeading.toString(),
                              heading: iteration.title.toString(),
                              content: iteration.content.toString(),
                              link: iteration.link.toString(),
                            );
                          }),
                    );
                  } else {
                    return Content(data: snapshot.error.toString(), size: 12);
                  }
                })
          ],
        ),
      ),
    );
  }
}
