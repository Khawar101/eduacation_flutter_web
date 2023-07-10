import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:education_flutter_web/ui/common/app_const.dart';
import 'package:flutter/material.dart';

import '../../../views/e_book/upload_ebook/upload_ebook_viewmodel.dart';

Widget booksSearch(context,UploadebookViewModel viewModel) {
  final TextEditingController searchCtrl = TextEditingController();

  var width = MediaQuery.of(context).size.width;
  return Scaffold(
    body: Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: const Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          items: bookslist
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value:  viewModel.ebookData.category,
          onChanged: (value) {
            viewModel.getCategoryValue(value);
          },
          buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: width / 1.8,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: const Color(0xff4873a6).withOpacity(0.7),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              )),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: searchCtrl,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: searchCtrl,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for an item...',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);
            },
          ),
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              searchCtrl.clear();
            }
          },
        ),
      ),
    ),
  );
}
