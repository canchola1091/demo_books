
import 'package:flutter/material.dart';
import 'package:demo_books/src/theme/theme.dart' as th;
import 'package:demo_books/src/utils/utils.dart' as utils;

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.value,
    required this.lblText,
    required this.hintText,
    this.isListStrings = true,
    this.listItems,
    this.listMapItems,
    this.radius = 5.0,
    required this.isEnable,
    this.fnChanged,
    this.validation
  }) : super(key: key);

  final String? value;
  final String lblText;
  final String? hintText;
  final bool isListStrings;
  final List<String>? listItems;
  final List<Map<String, dynamic>>? listMapItems;
  final double radius;
  final bool isEnable;
  final Function(dynamic)? fnChanged;
  final String? Function(dynamic)? validation;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabled: isEnable,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: utils.hexToColor('#b00020'), width: 2.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: lblText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: th.subTitleColor, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: th.subTitleColor.withOpacity(0.25), width: 2.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: th.secondaryColor, width: 2.0),
        ),
      ),
      items: (isListStrings) ?
      listItems!.map((_label) => DropdownMenuItem(
        child: Text(
          _label.toString(),
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            color: th.subTitleColor
          )
        ),
        value: _label,
      )).toList()
      : listMapItems!.map((_map) => DropdownMenuItem(
        child: Text(
          _map['value']!,
          style: TextStyle(
            fontFamily: 'Roboto-Regular',
            color: th.subTitleColor
          )
        ),
        value: _map['key']!,
      )).toList(),
      hint: Text(
        hintText ?? '',
        style: TextStyle(
          fontFamily: 'Roboto-Regular',
          color: th.subTitleColor
        )
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        color: (isEnable)
        ? th.primaryColor
        : Colors.transparent
      ),
      dropdownColor: Colors.white,
      style: const TextStyle(
        fontFamily: 'Roboto-Regular',
        color: Colors.black
      ),
      value: value,
      onChanged: fnChanged,
      validator: validation
    );
  }
}