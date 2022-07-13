
import 'package:demo_books/src/models/books_model.dart';
import 'package:demo_books/src/services/books_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:demo_books/src/utils/utils.dart' as utils;
import 'package:get/route_manager.dart';

class BooksController extends GetxController {

  final TextEditingController _bookCtrl = TextEditingController();
  final BooksService _booksService = BooksService();
  late BooksModel _booksModel;
  List<BooksModel> _listOfBooksModel = [];
  bool _isLoading = false;
  

  //? GETTERS
  TextEditingController get gxBookCtrl => _bookCtrl;
  BooksModel get gxBooksModel => _booksModel;
  List<BooksModel> get gxListBooksModel => _listOfBooksModel;
  bool get gxIsloading => _isLoading;

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> gxSearchBooks(String valueParam) async {
    utils.cLoading();
    _isLoading = true;
    _listOfBooksModel = await _booksService.serviceSearchBooks(valueParam);
    Get.back();
    _isLoading = false;
    update(['books']);
  }

}