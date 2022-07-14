
import 'package:animate_do/animate_do.dart';
import 'package:demo_books/src/models/books_model.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:demo_books/src/theme/theme.dart' as th;

class DetailBookPage extends StatelessWidget {

  final int index;
  final List<BooksModel> book;

  const DetailBookPage({
    required this.index,
    required this.book,
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
     body: _body()
    );
  }

  Widget _body() {
    return FadeInRight(
      from: 0.5,
      delay: const Duration(milliseconds: 400),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            _titleBook(),
            const SizedBox(height: 30.0),
            (book[index].firstSentence!.isNotEmpty) ? _firstSentence() : const SizedBox.shrink(),
            _infoBook(),
            _authors(),
            const SizedBox(height: 20.0),
            (book[index].language!.isNotEmpty) ? _lenguages() : const SizedBox.shrink(),
            const SizedBox(height: 20.0),
            (book[index].contributor!.isNotEmpty) ? _contributors() : const SizedBox.shrink()
          ]
        )
      )
    );
  }

  Widget _titleBook() {
    return CustomText(
      fTxt: book[index].title!,
      fSize: 18.0,
      fWeight: 'Bold',
      fAlign: TextAlign.center,
    );
  }

  Widget _firstSentence() {
    return CustomText(
      fTxt: book[index].firstSentence!.first,
      fSize: 16.0,
      fAlign: TextAlign.justify,
    );
  }

  Widget _infoBook() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iteminfo('No. de páginas',book[index].numberOfPagesMedian.toString()),
          _iteminfo('No.de ediciones',book[index].editionCount.toString()),
          _iteminfo('Año de publicación',book[index].editionCount.toString())
        ],
      ),
    );
  }

  Widget _authors() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          fTxt: 'Autores',
          fSize: 17.0,
          fColor: th.subTitleColor,
        ),
        const SizedBox(height: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: book[index].authorName!.map((autor) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: CustomText(
              fTxt: '- $autor',
              fSize: 14.0,
              fColor: th.subTitleColor
            ),
          )).toList()
        )
      ]
    );
  }

  Widget _iteminfo(String label, String datainfo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          fTxt: label,
          fSize: 14.0,
          fAlign: TextAlign.center,
        ),
        const SizedBox(height: 7.0),
        CustomText(
          fTxt: datainfo,
          fSize: 14.0,
          fAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _lenguages() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          fTxt: 'Lenguajes',
          fSize: 17.0,
          fColor: th.subTitleColor,
        ),
        const SizedBox(height: 5.0),
        Wrap(
          spacing: 10.0,
          alignment: WrapAlignment.start,
          children: book[index].language!.map((e) => Chip(
            backgroundColor: th.primaryColor.withOpacity(0.7),
            label: CustomText(
              fTxt: e.toUpperCase(),
              fSize: 13.0,
              fColor: Colors.white,
            )
          )).toList()
        ),
      ],
    );
  }

  Widget _contributors() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          fTxt: 'Contribuciones',
          fSize: 17.0,
          fColor: th.subTitleColor,
        ),
        const SizedBox(height: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: book[index].contributor!.map((c) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: CustomText(
              fTxt: '- $c',
              fSize: 14.0,
              fColor: th.subTitleColor
            ),
          )).toList()
        )
      ]
    );
  }

}