import 'package:education_flutter_web/services/Model/CoursesModel.dart';
import 'package:education_flutter_web/ui/dialogs/addLecture.dart';
import 'package:education_flutter_web/ui/dialogs/addQuestion.dart';
import 'package:education_flutter_web/ui/widgets/common/video_player.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/courses_service.dart';
import '../../../dialogs/addAssigment.dart';
import '../../../widgets/common/icon_text_field/icon_text_field.dart';
import 'upload_view_1.dart';
import 'upload_view_2.dart';
import 'upload_view_3.dart';
import 'upload_view_4.dart';
import 'upload_view_5.dart';
import 'upload_view_6.dart';
import 'widgets/dropAddBtn.dart';

class UploadCoursesViewModel extends BaseViewModel {
  final _coursesService = locator<CoursesService>();
  get coursesService => _coursesService;
  CoursesModel get courseData => _coursesService.courseData;

  var screenNo = 3;
  var screens = [
    const UploadView_1(),
    const UploadView_2(),
    const UploadView_3(),
    const UploadView_4(),
    const UploadView_5(),
    const UploadView_6(),
  ];
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController categoryCtrl = TextEditingController();
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

  addAssigmentThumbnail(newSetState) async {
    await _coursesService.uploadToStorage(
        titleCtrl.text, "Thumbnail", notifyListeners, newSetState);
  }

  addAssigmentFile(newSetState) async {
    await _coursesService.uploadFile(
        titleCtrl.text, "Assigments", notifyListeners, newSetState);
  }

  watchvideo(context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Video',
        ),
        content: const SizedBox(
          height: 200,
          width: 300,
          child: videoPlayer(
            url:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Cancel',
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              'Add Question',
            ),
            child: const Text(
              'OK',
            ),
          ),
        ],
      ),
    );
  }
}
