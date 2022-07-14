
import 'package:demo_books/src/data/global_preferences.dart';
import 'package:demo_books/src/pages/user/view_user_data_page.dart';
import 'package:demo_books/src/widgets/alerts/alert_logout.dart';
import 'package:demo_books/src/widgets/alerts/snackbar_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_books/src/utils/utils.dart' as utils;

class UserDataController extends GetxController {

  final GlobalPreferences _globalPreferences       = GlobalPreferences();
  final GlobalKey<FormState> _formKey              = GlobalKey<FormState>();
  final TextEditingController _userNameCtrl        = TextEditingController();
  final TextEditingController _userLastNameCtrl    = TextEditingController();
  final TextEditingController _userPhoneCtrl       = TextEditingController();
  final TextEditingController _userEmailCtrl       = TextEditingController();
  final TextEditingController _userDateOfBirthCtrl = TextEditingController();
  final TextEditingController _userGenderCtrl      = TextEditingController();
  int _userAge = 0;
  bool _hasDate = false;

  //? GETTERS
  GlobalPreferences get gxGlobalPrefs             => _globalPreferences;
  GlobalKey<FormState> get gxFormKey              => _formKey;
  TextEditingController get gxUserNameCtrl        => _userNameCtrl;
  TextEditingController get gxUserLastNameCtrl    => _userLastNameCtrl;
  TextEditingController get gxUserPhoneCtrl       => _userPhoneCtrl;
  TextEditingController get gxUserEmailCtrl       => _userEmailCtrl;
  TextEditingController get gxUserDateOfBirthCtrl => _userDateOfBirthCtrl;
  TextEditingController get gxUserGenderCtrl      => _userGenderCtrl;
  int get gxUserAge => _userAge;
  bool get gxhasDate => _hasDate;

  @override
  void onClose() {
    super.onClose();
    _userNameCtrl.dispose();
    _userLastNameCtrl.dispose();
    _userPhoneCtrl.dispose();
    _userEmailCtrl.dispose();
    _userDateOfBirthCtrl.dispose();
    _userGenderCtrl.dispose();
  }

//==========================================================
/// VALIDA EL FORMULARIO Y GUARDA LOS DATOS DE USUARIO EN 
/// LAS SHAREDPREFERENCES
//==========================================================
  void saveDataUser() {
    final bool _isValidForm = _formKey.currentState!.validate();

    if (_isValidForm) {
      _globalPreferences.userName        = _userNameCtrl.text.trim();
      _globalPreferences.userLastName    = _userLastNameCtrl.text.trim();
      _globalPreferences.userPhone       = _userPhoneCtrl.text.trim();
      _globalPreferences.userEmail       = _userEmailCtrl.text.trim();
      _globalPreferences.userDateOfBirth = _userDateOfBirthCtrl.text.trim();
      _globalPreferences.userAge         = _userAge;
      _globalPreferences.userGender      = _userGenderCtrl.text.trim();
      _globalPreferences.hasDataUser     = true;
      Get.offAll( 
        () => const ViewUserDataPage(),
        transition: Transition.native,
        duration: const Duration(milliseconds: 700)
      );
      SnackBarAlert.cSnackBar(Icons.check, 'Datos guardado con exito');
    }
  }

//==========================================================
/// MUESTRE UN DATEPICKER PARA SELECCIONAR LA FECHA DE 
/// NACIEMIENTO, CALCULA LA EDAD DEL USUARIO
//==========================================================
  Future<void> selectedDateOfBirth() async{

    final DateTime _initialDate = DateTime.now();
    final DateTime _firstDate = DateTime(DateTime.now().year - 70, DateTime.now().month, DateTime.now().day);
    final DateTime? _selectedDate = await showDatePicker(
      context: Get.context!, 
      initialDate: _initialDate, 
      firstDate: _firstDate,
      lastDate: _initialDate,
      locale: const Locale('es', 'ES'),
    );

    if(_selectedDate != null) {
      _userAge = _initialDate.year - _selectedDate.year;
      _userDateOfBirthCtrl.text = utils.dateFormat(_selectedDate);
      _hasDate = true;
      update(['form']);
    } 

  }

  //==========================================================
  /// MUESTRA LA ALERTA PARA PREGUNTAR SI DESEA BORRAR LOS 
  /// DATOS DE USUARIO
  //==========================================================
  void showAlertDeleteData() {
    Get.dialog(
      AlertDelete(
        fnDone: () {
          _globalPreferences.userName        = null;
          _globalPreferences.userLastName    = null;
          _globalPreferences.userPhone       = null;
          _globalPreferences.userEmail       = null;
          _globalPreferences.userDateOfBirth = null;
          _globalPreferences.userAge         = null;
          _globalPreferences.userGender      = null;
          _globalPreferences.hasDataUser     = false;
          backToHomePage();
        }, 
        fnCancel: () => Get.back()
      ),
      barrierDismissible: false
    );
  }

  //****************NAVEGACIONES********************************
  
  //==========================================================
  /// NAVEGA DE REGRESO HACIA HOMEPAGE
  //==========================================================
  void backToHomePage() => Get.offAllNamed('/home_page');

  //************************************************************

}