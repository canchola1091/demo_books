
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
      init: UserDataController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            (_.gxGlobalPrefs.hasDataUser)
            ? IconButton(
              iconSize: 35.0,
              icon: const Icon(Icons.delete),
              onPressed: _.showAlertDeleteData
            )
            : const SizedBox.shrink()
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _itemUserData(Icons.person, 'Nombre(s)', '${_.gxGlobalPrefs.userName}'),
            _itemUserData(Icons.person, 'Apellidos', '${_.gxGlobalPrefs.userLastName}'),
            _itemUserData(Icons.phone_android, 'Teléfono', '${_.gxGlobalPrefs.userPhone}'),
            _itemUserData(Icons.email, 'Email', '${_.gxGlobalPrefs.userEmail}'),
            _itemUserData(Icons.date_range, 'Fecha de Nacimiento', '${_.gxGlobalPrefs.userDateOfBirth}'),
            _itemUserData(Icons.assignment, 'Edad', '${_.gxGlobalPrefs.userAge}'),
            _itemUserData(Icons.g_mobiledata, 'Genero', '${_.gxGlobalPrefs.userGender}'),
            const SizedBox(height: 30.0),
            _btnDone(_.backToHomePage)
          ]
        )
      )
    );
  }

  Widget _itemUserData(IconData icon, String title, String valueData) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: th.secondaryColor,
            size: 35.0,
          ),
          const SizedBox(width: 15.0),
          CustomText(
            fTxt: '$title: $valueData',
            fSize: 18.0,
            fColor: th.subTitleColor
          ),
        ],
      ),
    );
  }

  Widget _btnDone(void Function() backToHomePage) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: utils.porcientoW(Get.context, 50.0),
        child: CustomButton(
          bgColor: th.primaryColor,
          childWidget: const CustomText(
            fTxt: 'Aceptar',
            fSize: 17.0,
            fColor: Colors.white,
          ),
          btnFunction: backToHomePage
        )
      ),
    );
  }

}