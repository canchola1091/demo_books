
import 'package:animate_do/animate_do.dart';
import 'package:demo_books/src/controllers/home_controller.dart';
import 'package:demo_books/src/widgets/buttons/custom_button.dart';
import 'package:demo_books/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:demo_books/src/utils/utils.dart' as utils;
import 'package:demo_books/src/theme/theme.dart' as th;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: _body(_.gxGlobalPresf.hasDataUser, _.goToSearchBooksPage, _.goToviewDataUser),
        floatingActionButton: _fab(_.goToFormDataUser)
      )
    );
  }

  Widget _body(bool _hasDatauser, void Function() _goToSearchBooks, void Function() _goToViewDataUser) {
    return FadeInDown(
      delay: const Duration(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: utils.porcientoW(Get.context, 33.0),
            ),
            const SizedBox(height: 50.0),
            _cButon('Buscar libros', _goToSearchBooks),
            const SizedBox(height: 20.0),
            if(_hasDatauser) _cButon('Ver datos de usuario', _goToViewDataUser),
          ]
        )
      )
    );
  }

  Widget _cButon(String title, void Function() _onClick) {
    return SizedBox(
      width: utils.porcientoW(Get.context, 55.0),
      child: CustomButton(
        bgColor: th.primaryColor,
        borderRadius: 15.0,
        childWidget: CustomText(
          fTxt: title,
          fSize: 18.0,
          fColor: Colors.white,
        ),
        btnFunction: _onClick
      )
    );
  }

  Widget _fab(void Function() goToFormDataUser) {
    return FloatingActionButton(
      backgroundColor: th.primaryColor,
      splashColor: th.secondaryColor,
      child: const Icon(Icons.person_add_alt, color: Colors.white),
      tooltip: 'Formulario',
      onPressed: goToFormDataUser
    );
  }

}