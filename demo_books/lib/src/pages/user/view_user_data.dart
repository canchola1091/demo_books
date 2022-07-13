
import 'package:demo_books/src/controllers/user_data_controller.dart';
import 'package:demo_books/src/widgets/buttons/custom_button.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:demo_books/src/theme/theme.dart' as th;
import 'package:demo_books/src/utils/utils.dart' as utils;
import 'package:get/get.dart';

class ViewUserDataPage extends StatelessWidget {
  const ViewUserDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDataController>(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _itemUserData('Nombre(s)', '${_.gxGlobalPrefs.userName}'),
            _itemUserData('Apellidos', '${_.gxGlobalPrefs.userLastName}'),
            _itemUserData('Teléfono', '${_.gxGlobalPrefs.userPhone}'),
            _itemUserData('Email', '${_.gxGlobalPrefs.userEmail}'),
            _itemUserData('Fecha de Nacimiento', '${_.gxGlobalPrefs.userDateOfBirth}'),
            _itemUserData('Edad', '${_.gxUserAge}'),
            _itemUserData('Genero', '${_.gxGlobalPrefs.userGender}'),
            const SizedBox(height: 30.0),
            SizedBox(
              width: utils.porcientoW(Get.context, 30.0),
              child: CustomButton(
                bgColor: th.secondaryColor,
                childWidget: const CustomText(
                  fTxt: 'Aceptar',
                  fSize: 17.0,
                ),
                btnFunction: _.backToBooksPage
              )
            )
          ]
        )
      )
    );
  }

  Widget _itemUserData(String title, String valueData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        fTxt: '$title: $valueData',
        fSize: 18.0,
        fColor: th.primaryColor
      ),
    );
  }

}