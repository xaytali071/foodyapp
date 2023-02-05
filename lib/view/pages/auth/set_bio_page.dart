import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyapp/view/component/costom-button.dart';
import 'package:foodyapp/view/component/coustom_drop_down.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/user_controller.dart';
import '../../component/custom_text_from.dart';
import '../../style/style.dart';
import 'set_avatar.dart';

class SetBioPage extends StatefulWidget {
  const SetBioPage({Key? key}) : super(key: key);

  @override
  State<SetBioPage> createState() => _SetBioPageState();
}

class _SetBioPageState extends State<SetBioPage> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController genderController;
  late TextEditingController birthController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    genderController = TextEditingController();
    birthController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Fill in your bio",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
                20.verticalSpace,
                Text("This data will be displayed in your account profile for security",style: Style.textStyleNorm(size: 14),),
                40.verticalSpace,
                CustomTextFrom(controller: nameController, label: "Name"),
                20.verticalSpace,
                CustomTextFrom(controller: usernameController, label: "Username"),
                20.verticalSpace,
                CustomTextFrom(controller: emailController, label: "email"),
                20.verticalSpace,
                CoustomDropDown(),
                20.verticalSpace,
                CustomTextFrom(controller: birthController, label: "Date of Birth",keyboardType: TextInputType.datetime,),
                20.verticalSpace,
                CustomTextFrom(controller: passwordController, label: "Phone",keyboardType: TextInputType.phone,),
                30.verticalSpace,
                InkWell(
                    onTap: () {
                      context.read<AuthController>().setStateUser(
                          name: nameController.text,
                          username: usernameController.text,
                          password: passwordController.text,
                          email: emailController.text,
                          gender: genderController.text,
                          birth: birthController.text,
                          onSuccess: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => SetAvatar()),
                                (route) => false);
                          });
                    },
                    child: Container(
                      width:380,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: Style.linearGradient,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                            child: Text("Next",style: TextStyle(color: Style.whiteColor),),
                      ),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
