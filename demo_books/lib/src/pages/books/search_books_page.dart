
import 'package:demo_books/src/controllers/search_books_controller.dart';
import 'package:demo_books/src/widgets/books/widget_list_books.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:demo_books/src/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_books/src/theme/theme.dart' as th;
import 'package:demo_books/src/utils/utils.dart' as utils;

class SearchBooksPage extends StatelessWidget {
  const SearchBooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchBooksController>(
      init: SearchBooksController(),
      id: 'radio',
      builder: (_) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 10.0),
              _searchFieldText(),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _cBtnRadioButton(true, 'Titulo'),
                  _cBtnRadioButton(false, 'Autor'),
                ]
              ),

              const Expanded( child: WidgetListBooks() )
      
            ]
          )
        )
      )
    );
  }

  Widget _searchFieldText() {
    return GetBuilder<SearchBooksController>(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomTextField(
          iconSuffix: IconButton(
            icon: Icon(Icons.clear_sharp, color: th.primaryColor),
            onPressed: () => _.gxBookCtrl.clear(), 
          ),
           textLabel: 'Buscar',
           capitalization: TextCapitalization.sentences,
          fieldController: _.gxBookCtrl,
          onSubmit: (value) => _.gxSearchBooks(value)
        )
      )
    );
  }

  Widget _cBtnRadioButton(bool _value, String _txtLbl) {
    return GetBuilder<SearchBooksController>(
      builder: (_) => SizedBox(
        width: utils.porcientoW(Get.context, 42.5),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          minWidth: utils.porcientoW(Get.context, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<bool>(
                activeColor: th.titlesColor,
                value: _value,
                groupValue: _.gxByTitle,
                onChanged: _.changeRadioBtn
              ),
              Flexible(
                child: CustomText(
                  fTxt: _txtLbl,
                  fSize: 16.0, fColor: th.subTitleColor,
                  fFamily: 'Bold',
                  fAlign: TextAlign.center,
                ),
              )
            ]
          ),
          onPressed: () => _.changeRadioBtn(_value)
        )
      )
    );
  }

}