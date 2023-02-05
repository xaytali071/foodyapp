import 'package:flutter/material.dart';
import 'package:foodyapp/view/style/style.dart';
class CostomButton extends StatelessWidget {
 final String txt;
  final double width;
 final double hight;
 final dynamic press;
 final Color txtColor;
 final Color buttonColor;
 final double imghig;
 final double imgwid;
 final String img;
  const CostomButton({Key? key, required this.txt, this.width=100,this.hight=50,required this.press,this.txtColor=Style.whiteColor,this.buttonColor=Style.primaryColor,this.imghig=50, this.imgwid=50,this.img=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        press;
      },
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
          child: Row(
            children: [
              Container(
                width: imgwid,
                height: imghig,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img)
                  )
                ),
              ),
              Center(
                child: Text("$txt",style: TextStyle(color: txtColor),),
              ),
            ],
          ),
      ),
    );
  }
}

class CostomEleveyt extends StatefulWidget {

  final double width;
  final double hight;
  final dynamic press;
  final Color txtColor;
  final Color buttonColor;
  final dynamic child;
  const CostomEleveyt({Key? key,this.width=100, this.hight=50,required this.press,this.txtColor=Style.whiteColor,this.buttonColor=Style.primaryColor,required this.child}) : super(key: key);

  @override
  State<CostomEleveyt> createState() => _CostomEleveytState();
}

class _CostomEleveytState extends State<CostomEleveyt> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          widget.press;
        }, child: Container(
      width: widget.width,
      height: widget.hight,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: widget.child
    )
    );
  }
}

