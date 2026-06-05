import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/theme/light/colorSchemelight.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:financial_app/core/widgets/ButtomPrimary.dart';
import 'package:financial_app/feature/Send_mony/viewModel/sendMoneyProvider.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

class Sendingcomplateview extends StatelessWidget {
  const Sendingcomplateview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.background,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
             Center(
               child: Container(
                  height: 110,
                  width: 110,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color:Color.fromARGB(255, 226, 238, 178) ,spreadRadius: 6,blurRadius: 5)],
                    borderRadius: BorderRadius.circular(60),
                    color: Color.fromARGB(255, 242, 255, 191),
                  ),
                  child:  Icon(Icons.check_circle , size: 50,color: const Color.fromARGB(255, 55, 99, 19))
                ),
             ),
             Text("Money Sent", style: Textthemelight.textTheme.bodyLarge,),
             SizedBox(height: 10,),
             Text("Your transfer has been successfully", style: Textthemelight.textTheme.bodySmall,),
             Text("processed.", style: Textthemelight.textTheme.bodySmall,),
             SizedBox(height: 30,),
               Container(
              height: 250,
              width: 300,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                 boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 189, 189, 189),
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Text("Sending Amount", style: Textthemelight.textTheme.bodySmall),
                 Text("\$${Sendmoneyprovider.sendModel.sendingAmount}", style: Textthemelight.textTheme.bodyLarge),
                  Divider(color: appcolors.inactiveIcon),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("To", style: Textthemelight.textTheme.bodySmall),
                      Text(
                       Sendmoneyprovider.sendModel.reciverName,
                        style: TextStyle(
                          fontSize:
                              Textthemelight.textTheme.bodySmall?.fontSize,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date", style: Textthemelight.textTheme.bodySmall),
                      Text(
                        Sendmoneyprovider.sendModel.sendDate,
                        style: TextStyle(
                          fontSize:
                              Textthemelight.textTheme.bodySmall?.fontSize,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reference", style: Textthemelight.textTheme.bodySmall),
                      Text(
                        "#TX-992B1A",
                        style: TextStyle(
                          fontSize:
                              Textthemelight.textTheme.bodySmall?.fontSize,
                        ),
                      ),
                    ],
                  ),
                  ] ,
               )

          ) ,
          Container(
            margin: EdgeInsets.only(top: 90),
            child: buttomprimary(txt: "OK",fun: (){
              Navigator.pushNamed(context, Namepages.sendMoney);
            },)),
           ],
        ),
      ),
    );
  }
}
