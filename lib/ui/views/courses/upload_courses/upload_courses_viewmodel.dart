// ignore_for_file: iterable_contains_unrelated_type
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_flutter_web/services/Model/ChatMember.dart';
import 'package:education_flutter_web/services/Model/CoursesModel.dart';
import 'package:education_flutter_web/services/courses_service.dart';
import 'package:education_flutter_web/services/login_service.dart';
import 'package:education_flutter_web/ui/dialogs/courses_dialogs/addLecture.dart';
import 'package:education_flutter_web/ui/dialogs/courses_dialogs/addQuestion.dart';
import 'package:education_flutter_web/ui/widgets/common/video_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/rating_service.dart';
import '../../../../utils/snakBar.dart';
import '../../../dialogs/courses_dialogs/addAssigment.dart';
import 'upload_view_1.dart';
import 'upload_view_2.dart';
import 'upload_view_3.dart';
import 'upload_view_4.dart';
import 'upload_view_5.dart';
import 'upload_view_6.dart';

class UploadCoursesViewModel extends BaseViewModel {
  final rateingService = locator<RatingService>();
  final _coursesService = locator<CoursesService>();
  final _loginService = locator<LoginService>();
  // final _navigationService = locator<NavigationService>();
  CoursesService get coursesService => _coursesService;
  CoursesModel get courseData => _coursesService.courseData;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var formKey = GlobalKey<FormState>();

  var screenNo = 0;
  var screens = [
    const UploadView_1(),
    const UploadView_2(),
    const UploadView_3(),
    const UploadView_4(false),
    const UploadView_5(false),
    const CourseDetails(),
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
    _coursesService.courseData.title = value;
  }

  getCategoryValue(value) {
    _coursesService.courseData.category = value;
    notifyListeners();
  }

  getChapterValue(value) {
    _coursesService.courseData.chapter = value;
  }

  getDescriptionValue(value) {
    _coursesService.courseData.description = value;
  }

  getPriceValue(value) {
    _coursesService.courseData.price = value;
  }

  getDurationValue(value) {
    _coursesService.courseData.duration = value;
  }

  validation(context) {
    final isValid = formKey.currentState?.validate();
    if (isValid!) {
      if (screenNo == 0) {
        if (_coursesService.courseData.coverPic == "" ||
            _coursesService.courseData.coverPic == null) {
          snakBar(context, "Please upload cover photo");
        } else if (_coursesService.courseData.category == "" ||
            _coursesService.courseData.category == null) {
          snakBar(context, "Please select category");
        } else {
          nextPage();
        }
      } else if (screenNo == 1) {
        if (_coursesService.courseData.fAQ == [] ||
            _coursesService.courseData.fAQ == null) {
          snakBar(context, "Please add FAQ");
        } else {
          nextPage();
        }
      } else if (screenNo == 3) {
        if (_coursesService.courseData.lecture == [] ||
            _coursesService.courseData.lecture == null) {
          snakBar(context, "Please enter lecture details");
        } else {
          nextPage();
        }
      } else if (screenNo == 4) {
        if (_coursesService.courseData.assigment == [] ||
            _coursesService.courseData.assigment == null) {
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
    addQuestionAlert(
        context, questionCtrl, answerCtrl, faq, courseData, notifyListeners);
  }

  removeQuestion(index) {
    courseData.fAQ!.removeAt(index);
    notifyListeners();
  }

  addThumbnail(newSetState) async {
    await _coursesService.uploadToStorage(
        titleCtrl.text, "Thumbnail", notifyListeners, newSetState);
  }

  addVideo(newSetState) async {
    await _coursesService.uploadVideoToStorage(
        titleCtrl.text, "Video", notifyListeners, newSetState);
  }

  addLecture(context) {
    addLectureAlert(
        context,
        videoTitleCtrl,
        videoDescriptionCtrl,
        _coursesService,
        notifyListeners,
        lectures,
        courseData,
        addThumbnail,
        addVideo);
  }

  removeLecture(index) {
    courseData.lecture!.removeAt(index);
    notifyListeners();
  }

  addAssigment(context) {
    addAssigmentAlert(
        context,
        assigmentTitleCtrl,
        assigmentDescriptCtrl,
        _coursesService,
        notifyListeners,
        assigments,
        courseData,
        addThumbnail,
        addAssigmentFile);
  }

  removeAssigment(index) {
    courseData.assigment!.removeAt(index);
    notifyListeners();
  }

  addAssigmentThumbnail(newSetState) async {
    await _coursesService.uploadToStorage(
        titleCtrl.text, "Thumbnail", notifyListeners, newSetState);
  }

  addAssigmentFile(newSetState) async {
    await _coursesService.uploadFile(
        titleCtrl.text, "Assigments", notifyListeners, newSetState);
  }

  addCoverPhoto() async {
    await _coursesService.uploadToStorage(
        titleCtrl.text, "Cover", notifyListeners, null);
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
    _coursesService.publishData(publish);
  }

  joinGroup() async {
    try {
      final DocumentSnapshot<Map<String, Object?>> snapshot = await firestore
          .collection("chatRoom")
          .doc(courseData.publishDate)
          .get();

      ChatMember _chatMember =
          ChatMember.fromJson(snapshot.data() as Map<String, dynamic>);
      var contain = _chatMember.member!
          .where((element) => element.uID == _loginService.UserData.uID);
      if (contain.isEmpty) {
        Member cruntUser = Member(
            name: _loginService.UserData.username,
            uID: _loginService.UserData.uID,
            profile: _loginService.UserData.profile);
        _chatMember.member!.add(cruntUser);
        Map<String, dynamic> messageData = {
          "SMS": "${_loginService.UserData.username} joined group",
          "Date": "${DateTime.now().microsecondsSinceEpoch}",
          "type": "notification",
          "UID": _loginService.UserData.uID,
        };
        _chatMember.membersUid?.add(_loginService.UserData.uID.toString());

        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection("chatRoom")
            .doc(courseData.publishDate)
            .update({
          "member": _chatMember.member!.map((e) => e.toJson()),
          "membersUid": _chatMember.membersUid,
          "lastMessage": messageData
        });

        await firestore
            .collection("chatRoom")
            .doc(courseData.publishDate)
            .collection('chats')
            .doc()
            .set(messageData);
        notifyListeners();
      } else {
        log("Already Joined");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
