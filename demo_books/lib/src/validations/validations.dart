
import 'package:demo_books/src/utils/utils.dart' as utils;

class Validations {

  static String? validNames(String value) {
    if (value.isEmpty) return 'Este campo es requerido.';
    if (!utils.validateNames(value)) return 'Solo caracteres alfabeticos';
    return null;
  }

  static String? validEmail(String value) {
    if(value.isEmpty) return 'Este campo es requerido.';
    if(!utils.validarEmail(value)) return 'Email no valido.';
    return null;
  } 

  /// Validar si el campo es requerido (Acepta mínimo de caracteres)
  static String? validRequiredAndLength(String? _val, [int? _minLength]) {
    if (_val == null || _val.isEmpty) return 'Este campo es requerido.';
    if (_minLength != null && _val.length < _minLength) return 'Minimo $_minLength caracteres';
    return null;
  }

  static String? validDrop(String? _val) {
    if (_val == null) return 'Este campo es requerido.';
    return null;
  }

  static String? validOnlyNumbers(String? value, [int? _minLength]) {
    if(value!.isEmpty) return 'Este campo es requerido.';
    if (_minLength != null && value.length < _minLength) return 'Minimo $_minLength caracteres';
    if(!utils.validateContainsNumber(value)) return 'Solo caracteres númericos'; 
    return null;
  }

  static String? validNumbersPhone(String value) {
    if(value.isEmpty) return 'Este campo es requerido.';
    if(!utils.validateContainsNumber(value)) return 'Solo números';
    if(value.length < 10) return 'Minimo 10 digitos';
    return null;
  }

}