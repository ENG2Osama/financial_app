import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:flutter/material.dart';

class Choicepersonview extends StatelessWidget {
  const Choicepersonview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Textthemelight
      backgroundColor:appcolors.background,
appBar: AppBar(
  leading: Icon(Icons.arrow_back_rounded,),
  title: Text("Send Money",
  style: Textthemelight.textTheme.bodyMedium,
  // style: TextStyle(color: appcolors.primary),
  ) ,
  centerTitle: true,
  backgroundColor: appcolors.background,),
  body: Column(
    
    children: [
      Container(

        padding: EdgeInsets.all(Appsizes.padding ),
        margin: EdgeInsets.only(top: 30),
        child: TextField(
        
          decoration: InputDecoration(
            hint: Text("Name, Account Number, @cashtag"),
          
            hintStyle: TextStyle(color: Colors.grey),
            // filled: false,
            border: OutlineInputBorder(
              
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide()
            ),
            prefixIcon: Icon(Icons.search_rounded, size: 30,color: appcolors.border,),
            prefixIconColor: appcolors.border,
            // fillColor: Color.fromARGB(0, 66, 66, 143)
          ),
        ),
      ),
      // ListView(
      //   children: [
          
      //   ],
      // ),
    ],
  ),

    );
  }
}
