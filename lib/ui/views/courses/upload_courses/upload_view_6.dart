// ignore_for_file: camel_case_types

import 'package:education_flutter_web/ui/common/ui_helpers.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/upload_view_4.dart';
import 'package:education_flutter_web/ui/views/courses/upload_courses/widgets/card.dart';
import 'package:education_flutter_web/ui/widgets/common/sized_text/sized_text.dart';
import 'package:education_flutter_web/ui/widgets/common/video_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'upload_courses_viewmodel.dart';

class UploadView_6 extends StackedView<UploadCoursesViewModel> {
  const UploadView_6({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UploadCoursesViewModel viewModel,
    Widget? child,
  ) {
    // var width = MediaQuery.of(context).size.width;
    return  const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: "Title:", color: Colors.black),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    ButtonText(text: "Price:", color: Colors.black),
                    SmallText(text: "29000\$", color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: [
              Column(
                children: [
                  ButtonText(text: "Catogery:", color: Colors.black),
                  SmallText(text: "dsfsdffffffff", color: Colors.black),
                ],
              ),
              horizontalSpaceLarge,
              Column(
                children: [
                  ButtonText(text: "Duration:", color: Colors.black),
                  SmallText(text: "23 hours", color: Colors.black),
                ],
              ),
            ],
          ),
          verticalSpaceSmall,
          ButtonText(text: "Description:", color: Colors.black),
          SmallText(
            color: Colors.black,
            text:
                "We reserve the right to require credit card or alternate non-promotional payment method information for verification purposes, even if the Gift Card or Gift Certificate fully covers the transaction order total. We do not allow the purchase of a Gift Card with another Gift Card, Gift Certificate, Savings Pass, Appreciation Award, Award Card, or Rewards Pass. One gift card per order online, please call the specific phone lines listed aWe reserve the right to require credit card or alternate non-promotional payment method information for verification purposes, even if the Gift Card or Gift Certificate fully covers the transaction order total. We do not allow the purchase of a Gift Card with another Gift Card, Gift Certificate, Savings Pass, Appreciation Award, Award Card, or Rewards Pass. One gift card per order online, please call the specific phone lines listed aWe reserve the right to require credit card or alternate non-promotional payment method information for verification purposes, even if the Gift Card or Gift Certificate fully covers the transaction order total. We do not allow the purchase of a Gift Card with another Gift Card, Gift Certificate, Savings Pass, Appreciation Award, Award Card, or Rewards Pass. One gift card per order online, please call the specific phone lines listed a",
          ),
          verticalSpaceSmall,
          StarText(text: 'Lectures',),
          UploadView_4(),
          verticalSpaceSmall,
          
              StarText(text: 'Videos',),
              verticalSpaceSmall,
              videoPlayer(url: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4' ),
                verticalSpaceSmall,
          
              StarText(text: 'Feedback',),
           
        ],
      ),
    );
  }

  @override
  UploadCoursesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UploadCoursesViewModel();
}
