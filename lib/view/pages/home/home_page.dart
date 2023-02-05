import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodyapp/view/component/custom_text_from.dart';
import 'package:foodyapp/view/pages/product/product_page.dart';
import 'package:foodyapp/view/style/style.dart';

import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..getBanners()
        ..getProduct()
        ..getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Home page"),
        // backgroundColor: Style.primaryColor,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: context.watch<HomeController>().isTotalLoading
                ? Center(child: const CircularProgressIndicator(color: Style.primaryColor,))
                : Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text("Hello, Daniel !",style: Style.textStyleAuth(size: 24),),
                          Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_rounded,color: Style.primaryColor,size: 30,)),
                          10.horizontalSpace,
                        ],
                      ),
                      Row(
                        children: [
                          15.horizontalSpace,
                        Container(
                          width: 280.w,
                          height: 40.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.darkGreyColor)),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.darkGreyColor)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100),),borderSide: BorderSide(color: Style.darkGreyColor)),
                              suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.search,color: Style.darkGreyColor,),),
                              hintText: "Search",
                              hintStyle: Style.textStyleNorm(textColor: Style.darkGreyColor)
                          ),
                          ),
                        ),
                          10.horizontalSpace,
                          Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Style.primaryDisabledColor,
                                borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.filter_list,color: Style.primaryColor,size: 30,)))
                        ],
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .watch<HomeController>()
                                .listOfBanners
                                .length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width - 35,
                                height: 180.h,
                                decoration: BoxDecoration(
                                    gradient: Style.linearGradient,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Row(
                                  children: [
                                    context
                                                .watch<HomeController>()
                                                .listOfBanners[index]
                                                .product
                                                .image !=
                                            null
                                        ? Container(
                                      width: 150,
                                      height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(24)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${context
                                                    .watch<HomeController>()
                                                    .listOfBanners[index]
                                                    .product
                                                    .image ??
                                                    ""}"
                                              )
                                            )
                                          ),

                                        )
                                        : const SizedBox.shrink(),
                                    Column(
                                      children: [
                                        Text(context
                                            .watch<HomeController>()
                                            .listOfBanners[index]
                                            .title,style: Style.textStyleAuth(textColor: Style.whiteColor),),
                                        Text(context
                                                .watch<HomeController>()
                                                .listOfBanners[index]
                                                .product
                                                .name ??
                                            "",style: Style.textStyleRegular(textColor: Colors.orangeAccent,size: 24),),
                                            Spacer(),
                                            InkWell(
                                              onTap: (){},
                                              child: Container(
                                                width: 100.w,
                                                height: 35.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                                  color: Colors.orangeAccent
                                                ),
                                                child: Center(
                                                  child: Text("Buy Now",style:Style.textStyleRegular2(textColor: Style.whiteColor),),
                                                ),
                                              ),
                                            ),
                                        10.verticalSpace,
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Popular Restaurant",style: Style.textStyleRegular2(size: 20),),
                            Text("See all",style: Style.textStyleNorm(textColor: Style.primaryColor,size: 14),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: SizedBox(
                          height: 180,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: context
                                  .watch<HomeController>()
                                  .listOfCategory
                                  .length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(16),
                                  width:
                                      (MediaQuery.of(context).size.width - 48) / 3,
                                  decoration: BoxDecoration(
                                      color: Style.whiteColor,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Column(
                                    children: [
                                      10.verticalSpace,
                                      context
                                                  .watch<HomeController>()
                                                  .listOfCategory[index]
                                                  .image !=
                                              null
                                          ? Container(
                                        height: 64.h,
                                            width: 64.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  "${context
                                                      .watch<HomeController>()
                                                      .listOfCategory[index]
                                                      .image ??
                                                      ""}"
                                                )
                                              )
                                            ),
                                          )
                                          : const SizedBox.shrink(),
                                      Column(
                                        children: [
                                          Text(context
                                                  .watch<HomeController>()
                                                  .listOfCategory[index]
                                                  .name ?? "",style: Style.textStyleRegular(),),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Popular Menu",style: Style.textStyleRegular2(size: 20),),
                            Text("See all",style: Style.textStyleNorm(textColor: Style.primaryColor,size: 14),)
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemCount:
                              context.watch<HomeController>().listOfProduct.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>Product_Page(product:context.watch<HomeController>().listOfProduct[index] )));
                              },
                              child: Container(
                                margin: EdgeInsets.all(16),
                                width: 380.w,
                                height: 90.h,
                                decoration: BoxDecoration(
                                color: Style.whiteColor,
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                                ),
                                child: Row(
                                  children: [
                                    context
                                                .watch<HomeController>()
                                                .listOfProduct[index]
                                                .image ==
                                            null
                                        ? const SizedBox.shrink()
                                        : Container(
                                      width: 64.w,
                                          height: 64.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(16)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                "${context
                                                    .watch<HomeController>()
                                                    .listOfProduct[index]
                                                    .image ??
                                                    ""}"
                                              )
                                            )
                                          ),
                                        ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        10.verticalSpace,
                                        Text(context
                                                .watch<HomeController>()
                                                .listOfProduct[index]
                                                .name ??
                                            "",style: Style.textStyleRegular2(),),
                                        Spacer(),
                                        SizedBox(
                                          width: 240,
                                          child: Text(context
                                                  .watch<HomeController>()
                                                  .listOfProduct[index]
                                                  .desc ??
                                              "",maxLines: 3,overflow: TextOverflow.ellipsis,style: Style.textStyleNorm(textColor: Style.darkGreyColor,size: 12),),
                                        ),
                                        10.verticalSpace
                                      ],
                                    ),
                                    Spacer(),
                                    Text(context
                                        .watch<HomeController>()
                                        .listOfProduct[index]
                                        .price
                                        .toString(),style: Style.textStyleRegular2(textColor: Style.primaryColor,size: 16),)
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
          ),
        ));
  }
}
