import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/feature/Setting/widget/customerBottomSheetHelp.dart';
import 'package:financial_app/feature/Setting/widget/customerBottomSheetLang.dart';
import 'package:financial_app/feature/Setting/widget/customerViewSetting.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class settingView extends StatelessWidget {
  settingView({super.key});
  String Lang = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.bgLight,
      appBar: AppBar(
        backgroundColor: appColors.bgLight,
        title: Text('Settings', style: Theme.of(context).textTheme.bodyMedium),
        leading: Card(
          margin: EdgeInsets.only(left: 7, top: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(shape: BoxShape.circle),

            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
              icon: Icon(Icons.arrow_back_sharp),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 7),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  customerBottomSheetHelp _customerBottomSheetHelp =
                      customerBottomSheetHelp();
                  _customerBottomSheetHelp.showBottomSheetHepl(context);
                },
                iconSize: 30,
                icon: Icon(Icons.help),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(appSizes.padding),
        child: Column(
          children: [
            SizedBox(height: 10),
            customerViewSettings(
              actionDo: () {
                Navigator.of(context).pushNamed(namePages.profileView);
              },
              title: "Profile",
              iconItemSetting: Icon(
                Icons.person,
                color: appColors.secondary,
                size: 26,
              ),
            ),
            SizedBox(height: 15),
            customerViewSettings(
              actionDo: () {
                customerBottomSheetLang _customerBottomSheet =
                    customerBottomSheetLang();
                _customerBottomSheet.showBottomSheetLang(context);
              },
              title: "Language",
              iconItemSetting: Icon(
                Icons.language,
                color: appColors.secondary,
                size: 26,
              ),
            ),
            SizedBox(height: 15),
            customerViewSettings(
              actionDo: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Under denelopment",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: appColors.onSecondary,
                      ),
                    ),
                  ),
                );
              },
              title: "Securety",
              iconItemSetting: Icon(
                Icons.lock,
                color: appColors.secondary,
                size: 26,
              ),
            ),
            SizedBox(height: 15),
            customerViewSettings(
              actionDo: () {
                Navigator.of(context).pushNamed(namePages.notificationPage);
              },
              title: "Notifications",
              iconItemSetting: Icon(
                Icons.notifications,
                color: appColors.secondary,
                size: 26,
              ),
            ),
            SizedBox(height: 10),
            Divider(color: appColors.textHint),
            SizedBox(height: 30),
            Container(
              alignment: Alignment(0, 0),
              height: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 7,
                    spreadRadius: 0,
                  ),
                ],

                color: Color(0xfffde6e3),
                borderRadius: BorderRadius.circular(appSizes.borderRadius),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).popAndPushNamed(namePages.login);
                },
                title: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: appColors.error,
                    fontSize: 18,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: appColors.bgIconError,
                  child: Icon(
                    Icons.logout_outlined,
                    size: 26,
                    color: appColors.error,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
