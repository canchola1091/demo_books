
import 'package:demo_books/src/controllers/books_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class DetailBookPage extends StatelessWidget {
  const DetailBookPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BooksController>(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Hola Mundo'),
       ),
       ),
    );
  }
}