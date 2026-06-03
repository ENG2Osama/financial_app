import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:flutter/material.dart';

class Textfieldcustomer extends StatelessWidget {
  final String? text;
  final bool numberKeyboardType ;
  const Textfieldcustomer({super.key,required this.text, required this.numberKeyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 90,
      padding: EdgeInsets.all(Appsizes.padding),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        // if(numberKeyboardType){},
        keyboardType: TextInputType.number ,
        cursorColor: appcolors.border,
        cursorHeight: 30,

        decoration: InputDecoration(
          hint: Text(
           "$text",
            style: Textthemelight.textTheme.bodySmall,
          ),
          filled: true,
          fillColor: appcolors.textFild,

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsetsGeometry.symmetric(vertical: 4),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: SizedBox(
            width: 011,
            child: Icon(
              Icons.search_rounded,
              size: 30,
              color: appcolors.border,
            ),
          ),
          prefixIconColor: appcolors.border,
        ),
      ),
    );
  }
}
