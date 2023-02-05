import 'package:flutter/material.dart';
import 'package:foodyapp/controller/user_controller.dart';
import 'package:provider/provider.dart';

import '../style/style.dart';
class CoustomDropDown extends StatefulWidget {

  const CoustomDropDown({Key? key,}) : super(key: key);

  @override
  State<CoustomDropDown> createState() => _CoustomDropDownState();
}

class _CoustomDropDownState extends State<CoustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: context
          .watch<UserController>()
          .gender
          .first,
      items: context
          .watch<UserController>()
          .gender
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (s) {
        context.read<UserController>().setGender(s.toString());
      },
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.greyColor)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.greyColor)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.greyColor)),
      ),
    );
  }
}