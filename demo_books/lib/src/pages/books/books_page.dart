
import 'package:demo_books/src/controllers/books_controller.dart';
import 'package:demo_books/src/widgets/search/books_search.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:demo_books/src/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';


class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BooksController>(
      init: BooksController(),
      id: 'books',
      builder: (_) => Scaffold(
        appBar: AppBar(),
        floatingActionButton: _fab(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            MaterialButton(
              color: Colors.blue,
              child: const Text('Buscar Libros'),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: BooksSearchDelegate('Buscar', _.gxListBooksModel)
                );
              }
            ),

            const SizedBox(height: 20.0),

            MaterialButton(
              color: Colors.blue,
              child: const Text('Get books!!!'),
              onPressed: () =>_.gxSearchBooks('Batman')
            ),

             _inputText(),

            (_.gxIsloading)
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _.gxListBooksModel.length,
                itemBuilder: ( context, int index) {
                  return CustomText(
                    fTxt: _.gxListBooksModel[index].title!,
                    fSize: 19.0,
                    fColor: Colors.blue,
                  );
                }
              ),
            ),

          ]
        )
      )
    );
  }

  Widget _fab() {
    return FloatingActionButton(
      child: const Icon(Icons.people),
      tooltip: 'Formulario',
      onPressed: () => Get.toNamed('/user_data_page')
    );
  }

  Widget _inputText() {
    return GetBuilder<BooksController>(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomTextField(
           textLabel: 'Buscar',
          fieldController: _.gxBookCtrl,
          onChanged: (value) => _.gxSearchBooks(value)
        )
      ),
    );
  }

}