
import 'package:education_flutter_web/services/Model/EbookModel.dart';
import 'package:education_flutter_web/ui/views/e_book/e_book_viewmodel.dart';
import 'package:education_flutter_web/ui/views/e_book/e_book_widgets/ebookCard.dart';
import 'package:flutter/material.dart';
import '../../../../utils/loading.dart';

Widget ebookBuilder(EBookViewModel viewModel) {
  return StreamBuilder<List<EbookModel>>(
    stream: viewModel.ebookServices.ebookStream(),
    builder:
        (BuildContext context, AsyncSnapshot<List<EbookModel>> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Loading(100);
      }
      return GridView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data!.length + 1,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisExtent: 260,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == snapshot.data!.length) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff4873a6).withOpacity(0.7),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: viewModel.nextPage,
                  icon: const Icon(
                    Icons.add_circle_outline,
                    size: 50,
                  ),
                ));
          }
          EbookModel data = snapshot.data![index];
          return ebookCard(data, context, viewModel);
        },
      );
    },
  );
}