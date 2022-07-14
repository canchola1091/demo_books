
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  
  static final GlobalPreferences _instancia = GlobalPreferences._internal(); 
  factory GlobalPreferences() {
    return _instancia;
  }
  GlobalPreferences._internal();
  late SharedPreferences _globalPreferences;
  initVarsPermanentes() async {
    _globalPreferences = await SharedPreferences.getInstance();
  }

  /// NOMBRE DE USUARIO
  String? get userName => _globalPreferences.getString('userName');
  set userName(String? value) => _globalPreferences.setString('userName', value ?? '');

  /// APELLIDOS DE USUARIO
  String? get userLastName => _globalPreferences.getString('userLastName');
  set userLastName(String? value) => _globalPreferences.setString('userLastName', value ?? '');

  /// TELÉFONO DE USUARIO
  String? get userPhone => _globalPreferences.getString('userPhone');
  set userPhone(String? value) => _globalPreferences.setString('userPhone', value ?? '');

  /// EMAIL DE USUARIO
  String? get userEmail => _globalPreferences.getString('userEmail');
  set userEmail(String? value) => _globalPreferences.setString('userEmail', value ?? '');

  /// FECHA DE NACIMIENTO DE USUARIO
  String? get userDateOfBirth => _globalPreferences.getString('userDateOfBirth');
  set userDateOfBirth(String? value) => _globalPreferences.setString('userDateOfBirth', value ?? '');

  /// EDAD DE USUARIO
  int? get userAge => _globalPreferences.getInt('userAge');
  set userAge(int? value) => _globalPreferences.setInt('userAge', value ?? 1);

  /// GENERO DE USUARIO
  String? get userGender => _globalPreferences.getString('userGender');
  set userGender(String? value) => _globalPreferences.setString('userGender', value ?? '');

  // DATA GUARDADA
  bool get hasDataUser => _globalPreferences.getBool('hasDataUser') ?? false;
  set hasDataUser(bool value) => _globalPreferences.setBool('hasDataUser', value);
} 