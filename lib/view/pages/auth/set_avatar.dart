import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyapp/view/style/style.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../home/home_page.dart';

class SetAvatar extends StatefulWidget {
  const SetAvatar({Key? key}) : super(key: key);

  @override
  State<SetAvatar> createState() => _SetAvatarState();
}

class _SetAvatarState extends State<SetAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Text("Upload your photo",style: Style.textStyleAuth(),),
            30.verticalSpace,
            Text("This data will be displayed in your account profile for security",style: Style.textStyleNorm(size: 14),),
            context.watch<AuthController>().imagePath.isEmpty
                ? Column(
                    children: [
                      InkWell(
                          onTap: () {
                            context.read<AuthController>().getImageCamera();
                          },
                          child: Container(
                            width: 380.w,
                            height: 160.h,
                            decoration: BoxDecoration(
                                color: Style.whiteColor,
                              border: Border.all(color: Style.greyColor)
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  30.verticalSpace,
                                  Container(
                                   width: 80.w,
                                   height: 80.h,
                                   decoration: BoxDecoration(
                                     color: Style.primaryDisabledColor,
                                     shape: BoxShape.circle
                                   ),
                                   child: Icon(Icons.photo_camera,color: Style.primaryColor,),
                                  ),
                                  Text("Take photo",style: Style.textStyleRegular2(),)
                                ],
                              ),
                            ),
                          )),
                          30.verticalSpace,

                      InkWell(
                          onTap: () {
                            context.read<AuthController>().getImageGallery();
                          },
                          child: Container(
                            width: 380.w,
                            height: 160.h,
                            decoration: BoxDecoration(
                              color: Style.whiteColor,
                                border: Border.all(color: Style.greyColor)
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  30.verticalSpace,
                                  Container(
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                        color: Style.primaryDisabledColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Icon(Icons.folder,color: Style.primaryColor,),
                                  ),
                                  Text("From gallery",style: Style.textStyleRegular2(),)
                                ],
                              ),
                            ),
                          ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),

            context.watch<AuthController>().imagePath.isEmpty
                ? const SizedBox.shrink()
                : Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(
                                File(context.watch<AuthController>().imagePath),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       showDialog(
                      //           context: context,
                      //           builder: (context) {
                      //             return AlertDialog(
                      //               title: Text("Tanlang"),
                      //               actions: [
                      //                 ElevatedButton(
                      //                     onPressed: () async {
                      //                       _image
                      //                           .pickImage(
                      //                               source: ImageSource.camera)
                      //                           .then((value) async {
                      //                         if (value != null) {
                      //                           CroppedFile? _cropperImage =
                      //                               await ImageCropper()
                      //                                   .cropImage(
                      //                                       sourcePath:
                      //                                           value.path);
                      //                           if (_cropperImage != null) {
                      //                             imagePath =
                      //                                 _cropperImage.path;
                      //                             setState(() {});
                      //                             Navigator.pop(context);
                      //                           }
                      //                         }
                      //                       });
                      //                     },
                      //                     child: Text("Take phote")),
                      //                 ElevatedButton(
                      //                     onPressed: () async {
                      //                       _image
                      //                           .pickImage(
                      //                               source: ImageSource.gallery)
                      //                           .then((value) async {
                      //                         if (value != null) {
                      //                           CroppedFile? _cropperImage =
                      //                               await ImageCropper()
                      //                                   .cropImage(
                      //                                       sourcePath:
                      //                                           value.path);
                      //                           if (_cropperImage != null) {
                      //                             imagePath =
                      //                                 _cropperImage.path;
                      //                             setState(() {});
                      //                             Navigator.pop(context);
                      //                           }
                      //                         }
                      //                       });
                      //                     },
                      //                     child: Text("Take file")),
                      //                 ElevatedButton(
                      //                     onPressed: () async {
                      //                       imagePath = "";
                      //                       Navigator.pop(context);
                      //                       setState(() {});
                      //                     },
                      //                     child: Text("Delete")),
                      //                 ElevatedButton(
                      //                     onPressed: () async {
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: Text("Cancel")),
                      //               ],
                      //             );
                      //           });
                      //     },
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         color: Colors.pink,
                      //         shape: BoxShape.circle,
                      //       ),
                      //       padding: EdgeInsets.all(8.r),
                      //       child: Icon(
                      //         Icons.edit,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
            // 24.verticalSpace,
            // ElevatedButton(
            //     onPressed: () async {
            //       final CroppedFile? _croppedFile = await ImageCropper().cropImage(
            //           sourcePath: imagePath,
            //         uiSettings: [
            //           AndroidUiSettings(
            //             toolbarTitle: 'Image Cropper',
            //             toolbarColor: Colors.white,
            //             toolbarWidgetColor: Colors.black,
            //             initAspectRatio: CropAspectRatioPreset.original,
            //           ),
            //           IOSUiSettings(title: 'Image Cropper', minimumAspectRatio: 1),
            //         ]
            //       );
            //       imagePath = _croppedFile?.path ?? "";
            //       setState(() {});
            //     },
            //     child: Text("Take Cropper image")),
            const Spacer(),
            InkWell(
              onTap: () async {
                context.read<AuthController>().createUser(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                      (route) => false);
                });
              },
              child: Container(
                width:380,
                height: 55,
                decoration: BoxDecoration(
                  color: Style.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Center(
                  child: Text("Next",style: Style.textStyleRegular(textColor: Style.whiteColor),),
                ),
              ),
            ),
            30.verticalSpace
          ],
        ),
      ),
    ));
  }
}
