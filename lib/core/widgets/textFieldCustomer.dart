import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:financial_app/feature/Send_mony/viewModel/sendMoneyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Textfieldcustomer extends StatelessWidget {
  final String? text;
  final bool isNumberKeyboard;
  final bool isSearch;
  final TextEditingController controller;
  Textfieldcustomer({
    super.key,
    required this.text,
    required this.isNumberKeyboard,
    required this.isSearch,
    required this.controller,
  });


  String? get controllerText => controller.text;
  @override
  Widget build(BuildContext context) {
    String coo = controller.text;
    return Container(
      // color: Colors.amber,
      height: 90,
      padding: EdgeInsets.all(Appsizes.padding),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child:  TextField(
             
            controller: controller,
            keyboardType: isNumberKeyboard
                ? TextInputType.number
                : TextInputType.name,
            cursorColor: appcolors.border,
            cursorHeight: 30,

            decoration: InputDecoration(
              hint: Text("$text", style: Textthemelight.textTheme.bodySmall),
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
                  isSearch
                      ? Icons.search_rounded
                      : Icons.monetization_on_outlined,
                  size: 30,
                  color: appcolors.border,
                ),
              ),
              prefixIconColor: appcolors.border,
            ),
          )
        
      
    );
  }
}

// class controllerValue  {
  
// }