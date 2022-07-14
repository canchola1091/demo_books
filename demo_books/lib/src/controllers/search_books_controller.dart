
import 'package:demo_books/src/models/books_model.dart';
import 'package:demo_books/src/services/books_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:demo_books/src/utils/utils.dart' as utils;
import 'package:get/route_manager.dart';

class SearchBooksController extends GetxController {

  final TextEditingController _bookCtrl = TextEditingController();
  final BooksService _booksService      = BooksService();
  List<BooksModel> _listOfBooksModel    = [];
  bool _byTitle                         = true;
  bool _isLoaded                        = false;

  //? GETTERS
  TextEditingController get gxBookCtrl  => _bookCtrl;
  List<BooksModel> get gxListBooksModel => _listOfBooksModel;
  bool get gxByTitle                    => _byTitle;
  bool get gxIsloaded                   => _isLoaded;
  
  //==========================================================
  /// LLAMA LA FUNCION QUE CONSUME EL ENDPOINT DE BUSQUEDA
  /// DE LIBROS, MAPEA LA RESPUESTA EN EL MODELO
  /// Y ACTUALIZA LA VISTA
  //==========================================================
  Future<void> gxSearchBooks(String valueParam) async {
    utils.msginfo('Buscando libros desde controller...');
    utils.cLoading();
    _listOfBooksModel = await _booksService.serviceSearchBooks(_byTitle, valueParam);
    _isLoaded = true;
    Get.back();
    update(['books']);
  }

  //==========================================================
  /// CAMBIA EL VALOR DEL RADIOBUTON PARA ELLEGIR SI LA BUSQUEDA
  /// SERÁ POR TITULO O AUTOR
  //==========================================================
  void changeRadioBtn(bool? _newVal) {
    _byTitle = _newVal!;
    update(['radio']);
  }

}