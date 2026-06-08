import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:financial_app/core/widgets/ButtomPrimary.dart';
import 'package:financial_app/feature/Send_mony/viewModel/sendMoneyProvider.dart';
import 'package:financial_app/feature/activities/viewmodel/activityViewModel.dart';
import 'package:financial_app/feature/Setting/viewModel/notificationViewModel.dart';
import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sendingagreeview extends StatelessWidget {
  const Sendingagreeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(backgroundColor: appColors.background),
      body: Center(
        child: Container(
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 189, 189, 189),
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
            // color: Color(33)
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: appColors.textFild,
                  ),
                  child: Icon(Icons.person_2_rounded, size: 50),
                ),
                Text(
                  Sendmoneyprovider.sendModel.reciverName,
                  style: Textthemelight.textTheme.bodyMedium,
                ),
                SizedBox(height: 30),
                Text(
                  "Sending Amount",
                  style: Textthemelight.textTheme.bodySmall,
                ),
                Text(
                  "\$${Sendmoneyprovider.sendModel.sendingAmount}",
                  style: Textthemelight.textTheme.bodyLarge,
                ),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appColors.card,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                            style: Textthemelight.textTheme.bodySmall,
                          ),
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
                          Text(
                            "Time",
                            style: Textthemelight.textTheme.bodySmall,
                          ),
                          Text(
                            "${Sendmoneyprovider.sendModel.sendTime} EST",
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
                          Text(
                            "Fee",
                            style: Textthemelight.textTheme.bodySmall,
                          ),
                          Text(
                            "\$0.00",
                            style: TextStyle(
                              fontSize:
                                  Textthemelight.textTheme.bodySmall?.fontSize,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: appColors.border),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Textthemelight.textTheme.bodySmall,
                          ),
                          Text(
                            "\$${Sendmoneyprovider.sendModel.sendingAmount}",
                            style: TextStyle(
                              fontSize:
                                  Textthemelight.textTheme.bodySmall?.fontSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: 20,),
                Container(
                  height: 70,
                  width: 300,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: appColors.textFild,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.lock, color: appColors.border),
                      SizedBox(
                        width: 220,
                        child: Text(
                          "Money will only be sent after confirmation",
                          style: TextStyle(
                            fontSize: 12,
                            color: appColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Consumer<Sendmoneyprovider>(
                  builder: (context, provider, child) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: buttomprimary(
                        txt: "Confirm",
                        fun: () {
                          context.read<userViewModel>().BakanceSet =
                              (context.read<userViewModel>().BalanceGet) -
                              (Sendmoneyprovider.sendModel.sendingAmount);
                          context.read<notificationViewModel>().addNotification(
                            title: "Payment received",
                            subtitle:
                                "\$${Sendmoneyprovider.sendModel.sendingAmount} from ${Sendmoneyprovider.sendModel.reciverName}",
                            timeProsses: DateTime.now(),
                          );
                          provider.addSendingOperation(
                            Sendmoneyprovider.sendModel,
                          );

                          // record activity
                          try {
                            context.read<activityViewModel>().recordSendMoney(
                                  amount: Sendmoneyprovider.sendModel.sendingAmount,
                                  to: Sendmoneyprovider.sendModel.reciverName,
                                );
                          } catch (_) {}

                          Navigator.pushNamed(
                            context,
                            namePages.sendingcomplateview,
                          );
                        },
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, namePages.homePage);
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: appColors.border,
                    ),
                    margin: EdgeInsets.only(top: 10),
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: Textthemelight.textTheme.bodyMedium!.fontSize,
                        color: appColors.textLight,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
