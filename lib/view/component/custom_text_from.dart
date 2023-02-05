import 'package:flutter/material.dart';
import 'package:foodyapp/view/style/style.dart';
import 'package:provider/provider.dart';

import '../../controller/app_cotroller.dart';

class CustomTextFrom extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool isObscure;
  final ValueChanged<String>? onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? node;

  const CustomTextFrom({
    Key? key,
    required this.controller,
    this.label="",
    this.hint="",
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.onChange, this.suffixIcon, this.prefixIcon, this.node,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType:keyboardType,
      focusNode: node,
      obscureText:
          isObscure ? (context.watch<AppController>().isVisibility) : false,
      onChanged: onChange,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.greyColor)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.greyColor)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.greyColor)),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ??
              (isObscure
                  ? IconButton(
                onPressed: () {
                  context.read<AppController>().onChange();
                },
                icon: context.watch<AppController>().isVisibility
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
                  : const SizedBox.shrink())),
    );
  }
}
