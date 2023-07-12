
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

import '../../services/Model/EbookModel.dart';
class pdfViewer extends StatefulWidget {
  final PdfFile pdfData;
  const pdfViewer({super.key, required this.pdfData});

  @override
  State<pdfViewer> createState() => _pdfViewerState();
}

class _pdfViewerState extends State<pdfViewer> {
  static const int _initialPage = 1;
  late PdfController _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openData(
          InternetFile.get(widget.pdfData.pdfUrl??"")),
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.pdfData.title??""),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
          PdfPageNumber(
            controller: _pdfController,
            builder: (_, loadingState, page, pagesCount) => Container(
              alignment: Alignment.center,
              child: Text(
                '$page/${pagesCount ?? 0}',
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
        ],
      ),
      body: PdfView(
        builders: PdfViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          documentLoaderBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
        ),
        controller: _pdfController,
      ),
    );
  }
}