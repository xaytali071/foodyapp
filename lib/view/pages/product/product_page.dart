import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyapp/model/product_model.dart';
import 'package:foodyapp/view/component/costom-button.dart';
import 'package:foodyapp/view/style/style.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
class Product_Page extends StatefulWidget {
 final ProductModel product;
  const Product_Page({Key? key, required this.product}) : super(key: key);

  @override
  State<Product_Page> createState() => _Product_PageState();
}

class _Product_PageState extends State<Product_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                    Padding(
                      padding: const EdgeInsets.only(right: 300),
                      child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.primaryDisabledColor
                          ),
                          child:
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back,color: Style.blackColor,))),
                    ),
                    widget.product
                        .image !=
                        null
                        ? Center(
                          child: Image.network(
                      widget.product.image ??
                            "",
                      height: 300.h,
                      width: 450.w,
                            fit: BoxFit.cover,
                    ),
                        )
                        : const SizedBox.shrink(),
30.verticalSpace,
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.product.name}",style: Style.textStyleRegular2(size: 20),),
          Text("${widget.product.category}",style: Style.textStyleNorm(textColor: Style.darkGreyColor),)
        ],
    ) ,

    Text("${widget.product.price}",style: Style.textStyleRegular2(size: 24),)

  ],

),
    Padding(
      padding: const EdgeInsets.only(right: 260,top: 30),
      child: Text("Description",style: Style.textStyleRegular2(size: 20),),
    ),
              Text("${widget.product.desc}",style: Style.textStyleNorm(textColor: Style.darkGreyColor),),
          Spacer(),
          Center(child: CostomButton(txt: "Add to card", press: (){},width: 300,)),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
