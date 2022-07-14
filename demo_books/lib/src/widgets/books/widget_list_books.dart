

import 'package:demo_books/src/controllers/search_books_controller.dart';
import 'package:demo_books/src/pages/books/detail_book_page.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:demo_books/src/theme/theme.dart' as th;

class WidgetListBooks extends StatelessWidget {
  const WidgetListBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchBooksController>(
      id: 'books',
      builder: (_) => (_.gxIsloaded && _.gxListBooksModel.isEmpty)
      ? Center(
        child: CustomText(
          fTxt: 'No hay ninguna coincidencia',
          fSize: 17.0,
          fColor: th.subTitleColor
        )
      )
      : ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        shrinkWrap: true,
        itemCount: _.gxListBooksModel.length,
        separatorBuilder: (__, int i) => Divider(color: th.primaryColor),
        itemBuilder: ( ___, int index) {
          return ListTile(
              onTap: () => Get.to(() => DetailBookPage(
                index: index,
                book: _.gxListBooksModel,
              ) ),
              leading: Icon(Icons.book, color: th.secondaryColor, size: 32.0),
              title: CustomText(
              fTxt: _.gxListBooksModel[index].title!,
              fSize: 17.0,
              fColor: th.subTitleColor,
              fWeight: 'Bold',
            ),
            subtitle: CustomText(
              fTxt: 'Año de publicación: ${_.gxListBooksModel[index].firstPublishYear.toString()}',
              fSize: 15.0,
              fColor: th.subTitleColor,
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomText(
                  fTxt: 'Ediciones',
                  fSize: 14.0
                ),
                CustomText(
                  fTxt: _.gxListBooksModel[index].editionCount.toString(),
                  fSize: 14.0
                )
              ]
            )
          );
        }
      )
    );
  }
}