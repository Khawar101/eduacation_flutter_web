import 'package:education_flutter_web/services/Model/EbookModel.dart';
import 'package:education_flutter_web/services/ebook_service.dart';
import 'package:education_flutter_web/ui/views/e_book/e_book_widgets/ebook_drop_add_btn.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/icon_text_field/icon_text_field.dart';

ebookAddLectureAlert(
    context,
    videoTitleCtrl,
    videoDescriptionCtrl,
    EbookService _ebookService,
    notifyListeners,
    List<PdfFile> pdfFile,
    EbookModel ebookData,
    addThumbnail,
    addVideo) async {
  var _formKey = GlobalKey<FormState>();

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'Upload Lecture',
      ),
      content: StatefulBuilder(builder: (context, newSetState) {
        return Form(
          key: _formKey,
          child: SizedBox(
            height: 290,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTextField(
                  titleText: "Title",
                  controller: videoTitleCtrl,
                  hintText: 'Enter your title...',
                ),
                IconTextField(
                  titleText: "Description",
                  controller: videoDescriptionCtrl,
                  hintText: 'Write a description...',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ebookAddBtn("Thumbnail", _ebookService.progressshow,
                        _ebookService.thubnailUrl, () {
                      addThumbnail(newSetState);
                    }, context),
                    const SizedBox(width: 20),
                    ebookAddBtn("Video", _ebookService.videoProgress,
                        _ebookService.videoUrl, () {
                      addVideo(newSetState);
                    }, context),
                    // dropAddBtn(),
                  ],
                )
              ],
            ),
          ),
        );
      }),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(
            context,
            'Cancel',
          ),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final isValid = _formKey.currentState?.validate();
            if (isValid!) {
              pdfFile.add(PdfFile(
                title: videoTitleCtrl.text,
                description: videoDescriptionCtrl.text,
                duration: _ebookService.duration,
                thumbnail: _ebookService.thubnailUrl,
                videoUrl: _ebookService.videoUrl,
              ));
              ebookData.pdfFile = pdfFile;
              notifyListeners();
              videoTitleCtrl.clear();
              videoDescriptionCtrl.clear();
              _ebookService.thubnailUrl = "";
              _ebookService.videoUrl = "";
              _ebookService.progressshow = 0;
              _ebookService.videoProgress = 0;
              Navigator.pop(context);
            }
            _formKey.currentState?.save();
          },
          child: const Text(
            'Add Pdf File',
          ),
        ),
      ],
    ),
  );
}
