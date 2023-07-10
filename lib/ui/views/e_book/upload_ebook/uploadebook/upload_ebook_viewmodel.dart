import 'package:education_flutter_web/services/Model/EbookModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../services/ebook_service.dart';
import '../../../../../services/rating_service.dart';
import '../../../../../utils/snakBar.dart';

import '../../../../widgets/common/video_player.dart';

class UploadebookViewModel extends BaseViewModel {
  
  final rateingService = locator<RatingService>();
  final _ebookService = locator<EbookService>();
  EbookService get ebookService => _ebookService;
  EbookModel get ebookData => _ebookService.ebookData;
  var formKey = GlobalKey<FormState>();

  var screenNo = 0;
  var screens = [
    // const UploadView_1(),
    // const UploadView_2(),
    // const UploadView_3(),
    // const UploadView_4(false),
    // const UploadView_5(false),
    // const CourseDetails(),
  ];
  TextEditingController titleCtrl = TextEditingController();
  String? categoryValue;
  TextEditingController chapterCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController questionCtrl = TextEditingController();
  TextEditingController answerCtrl = TextEditingController();
  List<FAQ> faq = [];
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController durationCtrl = TextEditingController();
  final TextEditingController videoTitleCtrl = TextEditingController();
  final TextEditingController videoDescriptionCtrl = TextEditingController();
  late String videoThubnailUrl;
  late String videoUrl;
  List<Lecture> lectures = [];
  final TextEditingController assigmentTitleCtrl = TextEditingController();
  final TextEditingController assigmentDescriptCtrl = TextEditingController();
  late String assigmentThubnailUrl;
  late String assigmentUrl;
  List<Assigment> assigments = [];
  backPage() {
    if (screenNo != 0) {
      screenNo -= 1;
      notifyListeners();
    }
  }

  getTitleValue(value) {
    // _coursesService.courseData.title = value;
  }

  getCategoryValue(value) {
    // _coursesService.courseData.category = value;
    notifyListeners();
  }

  getChapterValue(value) {
    // _coursesService.courseData.chapter = value;
  }

  getDescriptionValue(value) {
    // _coursesService.courseData.description = value;
  }

  getPriceValue(value) {
    // _coursesService.courseData.price = value;
  }

  getDurationValue(value) {
    // _coursesService.courseData.duration = value;
  }

  validation(context) {
    final isValid = formKey.currentState?.validate();
    if (isValid!) {
      if (screenNo == 0) {
        if (_ebookService.ebookData.coverPic == "" ||
            _ebookService.ebookData.coverPic == null) {
          snakBar(context, "Please upload cover photo");
        } else if (_ebookService.ebookData.category == "" ||
            _ebookService.ebookData.category == null) {
          snakBar(context, "Please select category");
        } else {
          nextPage();
        }
      } else if (screenNo == 1) {
        if (_ebookService.ebookData.fAQ == [] ||
            _ebookService.ebookData.fAQ == null) {
          snakBar(context, "Please add FAQ");
        } else {
          nextPage();
        }
      } else if (screenNo == 3) {
        if (_ebookService.ebookData.lecture == [] ||
            _ebookService.ebookData.lecture == null) {
          snakBar(context, "Please enter lecture details");
        } else {
          nextPage();
        }
      } else if (screenNo == 4) {
        if (_ebookService.ebookData.assigment == [] ||
            _ebookService.ebookData.assigment == null) {
          snakBar(context, "Please enter assignment details");
        } else {
          nextPage();
        }
      } else {
        nextPage();
      }
    }
    formKey.currentState?.save();
  }

  nextPage() {
    if (screenNo != screens.length - 1) {
      screenNo += 1;
      notifyListeners();
    }
  }

  addQuestion(context) {
    // addQuestionAlert(
        // context, questionCtrl, answerCtrl, faq, ebookData, notifyListeners);
  }

  removeQuestion(index) {
    ebookData.fAQ!.removeAt(index);
    notifyListeners();
  }

  addThumbnail(newSetState) async {
    await _ebookService.uploadToStorage(
        titleCtrl.text, "Thumbnail", notifyListeners, newSetState);
  }

  addVideo(newSetState) async {
    await _ebookService.uploadVideoToStorage(
        titleCtrl.text, "Video", notifyListeners, newSetState);
  }

  addLecture(context) {
    // addLectureAlert(
    //     context,
    //     videoTitleCtrl,
    //     videoDescriptionCtrl,
    //     _ebookService,
    //     notifyListeners,
    //     lectures,
    //     ebookData,
    //     addThumbnail,
    //     addVideo);
  }

  removeLecture(index) {
    // courseData.lecture!.removeAt(index);
    // notifyListeners();
  }

  addAssigment(context) {
    // addAssigmentAlert(
    //     context,
    //     assigmentTitleCtrl,
    //     assigmentDescriptCtrl,
    //     _coursesService,
    //     notifyListeners,
    //     assigments,
    //     courseData,
    //     addThumbnail,
    //     addAssigmentFile);
  }

  removeAssigment(index) {
    // courseData.assigment!.removeAt(index);
    // notifyListeners();
  }

  addAssigmentThumbnail(newSetState) async {
    // await _coursesService.uploadToStorage(
    //     titleCtrl.text, "Thumbnail", notifyListeners, newSetState);
  }

  addAssigmentFile(newSetState) async {
    // await _coursesService.uploadFile(
    //     titleCtrl.text, "Assigments", notifyListeners, newSetState);
  }

  addCoverPhoto() async {
    // await _coursesService.uploadToStorage(
    //     titleCtrl.text, "Cover", notifyListeners, null);
  }

  watchvideo(context, _url) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 600,
              child: videoPlayer(
                url: _url,
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const CircleAvatar(
                      backgroundColor: Colors.white, child: Icon(Icons.close))),
            )
          ],
        ),
      ),
    );
  }

  publish(publish) {
    _ebookService.publishData(publish);
  }
}



