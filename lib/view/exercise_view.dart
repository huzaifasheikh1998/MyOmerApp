import 'package:flutter/material.dart';
import 'package:mvvm/main.dart';
import 'package:mvvm/repository/exercise_repo.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/appbar.dart';
import 'package:mvvm/res/components/slider_component.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view_model/exercise_view_model.dart';
import 'package:provider/provider.dart';
import '../res/components/exercise_widget.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    final exerciseViewModel =
        Provider.of<ExerciseViewModel>(context, listen: false);
    ExerciseRepo exerciseRepo = ExerciseRepo();
    // ExerciseRepo exerciseRepo = ExerciseRepo();
    // final exe = ExerciseRepoo();
    // Map<String, String> body = {"id": "1"};
    return Scaffold(
      appBar: MyAppBar(title: "Exercise"),
      body: Container(
        margin: EdgeInsets.all(sized.primaryMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ExerciseViewModel>(builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SliderComponent(
                      title: "Emotional",
                      initialValue: 0,
                      value: value.index,
                      viewModel: exerciseViewModel),
                  SliderComponent(
                      title: "Business",
                      initialValue: 1,
                      value: value.index,
                      viewModel: exerciseViewModel),
                  SliderComponent(
                      title: "Relationship",
                      initialValue: 2,
                      value: value.index,
                      viewModel: exerciseViewModel),
                ],
              );
            }),
            Consumer<ExerciseViewModel>(builder: (context, value, child) {
              var body = {"id": loginId};
              print("fetchExercise <<<<<<<<<<<<<$body");
              return Expanded(
                child: FutureBuilder(
                    future: exerciseRepo.fetchExerciseList(body),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                            strokeWidth: 2,
                          ),
                        );
                      } else if (snapshot.hasData) {
                        var list = exerciseEmotionalList;
                        if (value.index == 0) {
                          list = exerciseEmotionalList;
                        } else if (value.index == 1) {
                          list = exerciseBusinessList;
                        } else if (value.index == 2) {
                          list = exerciseRelationshipList;
                        }
                        return PageView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              final iteration = list[index];
                              return ExerciseWidget(
                                  index: index,
                                  day: iteration.day.toString(),
                                  title: iteration.mainHeading.toString(),
                                  subtitle: iteration.subHeading.toString(),
                                  content: iteration.content.toString(),
                                  iteration: iteration);
                            });
                      } else {
                        print(snapshot.hasData);
                        print(snapshot.hasError);
                        print(snapshot.error);
                        return Content(
                          data: snapshot.error.toString(),
                          size: 30,
                        );
                      }
                    }),
              );
              // : value.index == 1
              //     ? Expanded(
              //         child: FutureBuilder(
              //             future: exerciseRepo.fetchExerciseList(body),
              //             builder: (context, snapshot) {
              //               if (snapshot.connectionState ==
              //                   ConnectionState.waiting) {
              //                 return Center(
              //                   child: CircularProgressIndicator(
              //                     color: AppColors.primaryColor,
              //                     strokeWidth: 2,
              //                   ),
              //                 );
              //               } else
              //               //  if (snapshot.hasData)
              //               {
              //                 return PageView.builder(
              //                     itemCount:
              //                         exerciseRepo.businessApiList.length,
              //                     itemBuilder: (context, index) {
              //                       final iteration =
              //                           exerciseRepo.businessApiList[index];
              //                       print(iteration);
              //                       return ExerciseWidget(
              //                           day: iteration.day.toString(),
              //                           title: iteration.mainHeading
              //                               .toString(),
              //                           subtitle:
              //                               iteration.subHeading.toString(),
              //                           content:
              //                               iteration.content.toString());
              //                     });
              //               }
              //               // else {
              //               //   return Container();
              //               // }
              //             }),
              //       )
              //     : value.index == 2
              //         ? Expanded(
              //             child: FutureBuilder(
              //                 future: exerciseRepo.fetchExerciseList(body),
              //                 builder: (context, snapshot) {
              //                   if (snapshot.connectionState ==
              //                       ConnectionState.waiting) {
              //                     return Center(
              //                       child: CircularProgressIndicator(
              //                         color: AppColors.primaryColor,
              //                         strokeWidth: 2,
              //                       ),
              //                     );
              //                   } else
              //                   //  if (snapshot.hasData)
              //                   {
              //                     return PageView.builder(
              //                         itemCount: exerciseRepo
              //                             .relationshipApiList.length,
              //                         itemBuilder: (context, index) {
              //                           final iteration = exerciseRepo
              //                               .relationshipApiList[index];
              //                           print(iteration);
              //                           return ExerciseWidget(
              //                               day: iteration.day.toString(),
              //                               title: iteration.mainHeading
              //                                   .toString(),
              //                               subtitle: iteration.subHeading
              //                                   .toString(),
              //                               content: iteration.content
              //                                   .toString());
              //                         });
              //                   }
              //                   // else {
              //                   //   return Container();
              //                   // }
              //                 }),
              //           )
              // : Container();
            }),
          ],
        ),
      ),
    );
  }
}

// var  reponse : [
//   { week: "1",
// days :[{"number":"1","active": "0","content":"","mainheading":""},
// {"number":"2","active": "0","content":"","mainheading":""}]},
// { week: "2",
// days :[{"number":"1","active": "0","content":"","mainheading":""},
// {number:"2",active: "0",content:"",""mainheading":""}]}];
