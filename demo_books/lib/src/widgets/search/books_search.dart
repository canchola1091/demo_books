
import 'package:demo_books/src/models/books_model.dart';
import 'package:demo_books/src/models/detail_books_model.dart';
import 'package:demo_books/src/pages/books/detail_book_page.dart';
import 'package:demo_books/src/services/books_service.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
                            // TODO: Especificar tipo
class BooksSearchDelegate extends SearchDelegate<BooksModel?> {

  @override
  final String searchFieldLabel;
  final List<BooksModel> books;

  BooksSearchDelegate(
    this.searchFieldLabel,
    this.books
  );
  

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: const Icon( Icons.clear ), 
          onPressed: () => query = ''
        )
      ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon( Icons.arrow_back_ios ),
      onPressed: () => close(context, null )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if ( query.trim().isEmpty) {
      return const CustomText(
        fTxt: 'no hay valor en el query', 
        fSize: 16.0,
        fColor: Colors.black,
      );
    }

    final BooksService _booksService = BooksService();
    return FutureBuilder(
      future: _booksService.serviceSearchBooks(query),
      builder: ( _ , AsyncSnapshot snapshot) {
        
        if ( snapshot.hasError ) {
          return const ListTile( 
            title:  CustomText(
              fTxt: 'No exite libro con este termino', 
              fSize: 16.0,
              fColor: Colors.black,
            )
          );
        }

        if ( snapshot.hasData ) {
          return _showBooks( snapshot.data );
        } else {
          return const Center(child: CircularProgressIndicator( strokeWidth: 4 ));
        }
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _showBooks( books );
  }

  Widget _showBooks( List<BooksModel> books ) {

    final BooksService _booksService = BooksService(); //TODO:Poner en un lugar mejor
    late DetailBookModel? detailBookModel;

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: ( context , i) {
        return ListTile(
          title: CustomText(
            fTxt: books[i].title!,
            fSize: 17.0,
            fColor: Colors.orange,
            ),
          onTap: () async{
            detailBookModel = await _booksService.serviceDetailBook(books[i].key!);
            if(detailBookModel != null) Get.to(() => const DetailBookPage() );
          },
        );
      }
    );

  }

}

