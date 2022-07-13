

import 'package:demo_books/src/controllers/user_data_controller.dart';
import 'package:demo_books/src/validations/validations.dart';
import 'package:demo_books/src/widgets/buttons/custom_button.dart';
import 'package:demo_books/src/widgets/dropdown/custom_dropdown.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:demo_books/src/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_books/src/theme/theme.dart' as th;
import 'package:demo_books/src/utils/utils.dart' as utils;

class UserDataPage extends StatelessWidget {
  const UserDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TOCAR CUALQUIER PARTE DE LA PANTALLA PARA QUE SE OCULTE EL TECLADO
      onTap:() => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: _body()
       )
    );
  }

  Widget _body() {
    return GetBuilder<UserDataController>(
      init: UserDataController(),
      builder: (_) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _.gxFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _inputUserName(_.gxUserNameCtrl),
              _inputUserLastName(_.gxUserLastNameCtrl),
              _inputUserPhone(_.gxUserPhoneCtrl),
              _inputUserEmail(_.gxUserEmailCtrl),
              _inputUserDateOfBirht(_.gxUserDateOfBirthCtrl, _.selectedDateOfBirth),             
              _inputUserGender(_.gxUserGenderCtrl),
              _formButon(_.saveDataUser)
            ]
          )
        )
      )
    );
  }

  Widget _inputUserName(TextEditingController _userNameCtrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: CustomTextField(
        textLabel: 'Nombre(s)',
        fieldController: _userNameCtrl,
        capitalization: TextCapitalization.words,
        validation: (value) => Validations.validNames(value!),
      )
    );
  }

  Widget _inputUserLastName(TextEditingController _userLastNameCtrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CustomTextField(
        textLabel: 'Apellidos',
        fieldController: _userLastNameCtrl,
        capitalization: TextCapitalization.words,
        validation: (value) => Validations.validNames(value!),
      )
    );
  }

  Widget _inputUserPhone(TextEditingController _userPhoneCtrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CustomTextField(
        textLabel: 'Teléfono',
        fieldController: _userPhoneCtrl,
        containsFormat: true,
        maxCaracteres: 10,
        typeKeyboard: TextInputType.phone,
        validation: (value) => Validations.validOnlyNumbers(value!, 10),
      )
    );
  }

  Widget _inputUserEmail(TextEditingController _userEmailCtrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CustomTextField(
        textLabel: 'Email',
        fieldController: _userEmailCtrl,
        typeKeyboard: TextInputType.emailAddress,
        validation: (value) => Validations.validEmail(value!),
      )
    );
  }
  
  Widget _inputUserDateOfBirht(TextEditingController _userDateOfBirhtCtrl, void Function() _selectedDate) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CustomTextField(
        textLabel: 'Fecha de Nacimiento',
        fieldController: _userDateOfBirhtCtrl,
        isOnclick: true,
        iconSuffix: Icon(
          Icons.calendar_month,
          color: th.primaryColor,
          size: 35.0,
        ),
        onClick: _selectedDate,
        validation: (value) => Validations.validRequiredAndLength(value),
      )
    );
  }

  Widget _inputUserGender(TextEditingController _userGenderCtrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CustomDropDown(
        lblText: 'Genero',
        hintText: 'Selecciona tu genero',
        isEnable: true,
        listItems: const ['Femenino', 'Masculino'],
        fnChanged: (_value) {
          _userGenderCtrl.text = _value;
        },
        validation: (value) => Validations.validDrop(value),
      )
    );
  }

  Widget _formButon(void Function() _saveDataUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: SizedBox(
        width: utils.porcientoW(Get.context, 50.0),
        child: CustomButton(
          bgColor: th.secondaryColor,
          splashColor: th.primaryColor.withOpacity(0.6),
          childWidget: const CustomText(
            fTxt: 'Guardar',
            fSize: 17.0
          ),
          btnFunction: _saveDataUser
        )
      )
    );
  }

}