

import 'package:get/route_manager.dart';
import 'package:demo_books/src/pages/books/books_page.dart';
import 'package:demo_books/src/pages/user_data_page.dart';

class Routes {

  static List<GetPage> routes = [
    GetPage( name: '/books_page',     page: () => const BooksPage() ),
    GetPage( name: '/user_data_page', page: () => const UserDataPage() ),
  ];

}