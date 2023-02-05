import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyapp/view/component/costom-button.dart';
import 'package:foodyapp/view/style/style.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../../component/custom_text_from.dart';
import '../home/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  bool empty=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Style.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sign in to your account",style: Style.textStyleAuth(size: 24),),
Container(
  width: 300,
  height: 300,
  decoration: BoxDecoration(
    image: DecorationImage(
          image: AssetImage("assets/foodylogo.jpg")
    )
  ),
),
                
                CustomTextFrom(controller: phoneController, hint: "Phone",onChange: (s){
                  setState(() {});
                },),
                40.verticalSpace,
                CustomTextFrom(controller: passwordController, hint: "Password",isObscure: true,),
                context.watch<AuthController>().errorText != null
                    ? Text(context.watch<AuthController>().errorText ?? "")
                    : const SizedBox.shrink(),
                50.verticalSpace,
                InkWell(
                    onTap: () {
                      context
                          .read<AuthController>()
                          .login(phoneController.text, passwordController.text, () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                            (route) => false);
                      });
                    },
                    child: Container(
                      width:380,
                      height: 55,
                      decoration: BoxDecoration(
                        color: phoneController.text.isEmpty && phoneController.text.isEmpty ? Style.primaryDisabledColor : Style.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                        child:
    context.watch<AuthController>().isLoading ? const Padding(
    padding: EdgeInsets.all(2.0),
    child: CircularProgressIndicator(
    color: Colors.white,)) : Text("Signin",style: TextStyle(color: Style.whiteColor),),
                      ),
                    ),),

            10.verticalSpace,
              Text("or continue with",style: Style.textStyleAuth(),),
                10.verticalSpace,
                Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          context.read<AuthController>().loginGoogle(() {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => const HomePage()),
                                    (route) => false);
                          });
                        },
                        child: Container(
                          width:155.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Style.greyColor),
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Center(
                            child:
                            context.watch<AuthController>().isLoading ? const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,)) :
                            Row(
                              children: [
                                25.horizontalSpace,
                                Container(
                                  width: 30.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/googlelogo.png")
                                      )
                                  ),
                                ),
                                Text("Google",style: TextStyle(color: Style.blackColor,fontSize: 20),),
                              ],
                            ),
                          ),
                        )),

                        20.horizontalSpace,
                InkWell(
                    onTap: () {
                      context.read<AuthController>().loginFacebook(() {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                                (route) => false);
                      });
                    },
                    child: Container(
                      width:155.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Style.greyColor),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                        child:
                        context.watch<AuthController>().isLoading ? const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,)) :
                        Row(
                                children: [
                                  25.horizontalSpace,
                                  Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/FacebookLogo.png")
                                      )
                                    ),
                                  ),
                                  Text("Facebook",style: TextStyle(color: Style.blackColor,fontSize: 20),),
                                ],
                              ),
                      ),
                    )),
                  ],
                ),
                   20.verticalSpace,

                   Padding(
                     padding: const EdgeInsets.only(left: 75),
                     child: Row(
                      children: [
                        Text("Don’t have an account?",style: Style.textStyleNorm(textColor: Style.darkGreyColor),),
                        Text("Sign up",style: Style.textStyleAuth(textColor: Style.primaryColor),)
                      ],
                  ),
                   ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
