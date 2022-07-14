

import 'package:demo_books/src/pages/home_page.dart';
import 'package:demo_books/src/pages/user/view_user_data_page.dart';
import 'package:get/route_manager.dart';
import 'package:demo_books/src/pages/books/search_books_page.dart';
import 'package:demo_books/src/pages/user/form_user_data_page.dart';

class Routes {

  static List<GetPage> routes = [
    GetPage( name: '/home_page',         page: () => const HomePage() ),
    GetPage( name: '/search_books_page', page: () => const SearchBooksPage() ),
    GetPage( name: '/user_data_page',    page: () => const FormUserDataPage() ),
    GetPage( name: '/view_data_page',    page: () => const ViewUserDataPage() ),
  ];

}