
import 'package:demo_books/src/data/global_preferences.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();
  
  //? GETTERS
  GlobalPreferences get gxGlobalPresf => _globalPreferences;


  //****************NAVEGACIONES********************************
  //==========================================================
  /// NAVEGA HACIA EL BUSCADOR DE LIBROS
  //==========================================================
  void goToSearchBooksPage () => Get.toNamed('/search_books_page');

  //==========================================================
  /// NAVEGA HACIA LA VISTA PARA VER LOS DATOS DEL USUARIO
  //==========================================================
  void goToviewDataUser () => Get.toNamed('view_data_page');

  //==========================================================
  /// NAVEGA HACIA EL FORMULARIO PARA DATOS DEL USUARIO
  //==========================================================
  void goToFormDataUser () => Get.toNamed('user_data_page');

  //************************************************************


}