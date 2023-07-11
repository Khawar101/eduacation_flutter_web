import 'package:education_flutter_web/services/Model/EbookModel.dart';
import 'package:education_flutter_web/ui/dialogs/ebook_dialogs/add_lecture.dart';
import 'package:education_flutter_web/ui/views/e_book/upload_ebook/uploadebook_widget/ebook_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/ebook_service.dart';
import '../../../../services/rating_service.dart';
import '../../../../utils/snakBar.dart';
import '../../../dialogs/ebook_dialogs/add_questions.dart';
import '../../../widgets/common/video_player.dart';
import 'uploadebook_widget/ebook_screen_1.dart';
import 'uploadebook_widget/ebook_screen_3.dart';
import 'uploadebook_widget/ebook_screen_detail.dart';

class UploadebookViewModel extends BaseViewModel {
  final rateingService = locator<RatingService>();
  final _ebookService = locator<EbookService>();
  EbookService get ebookService => _ebookService;
  EbookModel get ebookData => _ebookService.ebookData;
  var formKey = GlobalKey<FormState>();

  var screenNo = 0;
  var screens = [
    const EbookScreen1(),
    const EbookScreen2(),
    const EbookScreen3(false),
    const EbookDetails(),
  
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
  List<PdfFile> pdfFile = [];
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
    _ebookService.ebookData.title = value;
  }

  getCategoryValue(value) {
    _ebookService.ebookData.category = value;
    notifyListeners();
  }

  getChapterValue(value) {
    _ebookService.ebookData.chapter = value;
  }

  getDescriptionValue(value) {
    _ebookService.ebookData.description = value;
  }

  getPriceValue(value) {
    _ebookService.ebookData.price = value;
  }

  getDurationValue(value) {
    _ebookService.ebookData.duration = value;
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
        if (_ebookService.ebookData.pdfFile == [] ||
            _ebookService.ebookData.pdfFile == null) {
          snakBar(context, "Please enter lecture details");
        } else {
          nextPage();
        }
      }  else {
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

  ebookAddQuestion(context) {
    ebookAddQuesAlert(
        context, questionCtrl, answerCtrl, faq, ebookData, notifyListeners);
  }

  ebookremoveQuestion(index) {
    ebookData.fAQ!.removeAt(index);
    notifyListeners();
  }

  ebookaddThumbnail(newSetState) async {
    await _ebookService.uploadToStorage(
        titleCtrl.text, "Thumbnail", notifyListeners, newSetState);
  }

  ebookaddVideo(newSetState) async {
    await _ebookService.uploadVideoToStorage(
        titleCtrl.text, "Video", notifyListeners, newSetState);
  }

  ebookAddLecture(context) {
    ebookAddLectureAlert(
        context,
        videoTitleCtrl,
        videoDescriptionCtrl,
        _ebookService,
        notifyListeners,
        pdfFile,
        ebookData,
        ebookaddThumbnail,
        ebookaddVideo);
  }

  ebookRemoveLecture(index) {
    ebookData.pdfFile!.removeAt(index);
    notifyListeners();
  }

  ebookAddAssigment(context) {
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

  ebookRemoveAssigment(index) {
    // courseData.assigment!.removeAt(index);
    // notifyListeners();
  }

  ebookAddAssigmentThumbnail(newSetState) async {
    // await _coursesService.uploadToStorage(
    //     titleCtrl.text, "Thumbnail", notifyListeners, newSetState);
  }

  ebookAddAssigmentFile(newSetState) async {
    // await _coursesService.uploadFile(
    //     titleCtrl.text, "Assigments", notifyListeners, newSetState);
  }

  ebookAddCoverPhoto() async {
    await _ebookService.uploadToStorage(
        titleCtrl.text, "Cover", notifyListeners, null);
  }

  ebookWatchvideo(context, _url) async {
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

  ebookPublish(publish) {
    _ebookService.publishData(publish);
  }
}
