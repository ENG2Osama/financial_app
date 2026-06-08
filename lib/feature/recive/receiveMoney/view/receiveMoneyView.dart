import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/receiveMoneyViewModel.dart';

class ReceiveMoneyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myViewModel = Provider.of<ReceiveMoneyViewModel>(context);

    return Scaffold(
      backgroundColor: appColors.bgWhite,
      appBar: AppBar(
        title: Text(
          'Receive Money',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 26),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(appSizes.padding),
        child: Column(
          children: [
            SizedBox(height: appSizes.spaceLarge.toDouble()),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(appSizes.padding),
                decoration: BoxDecoration(
                  color: appColors.surface,
                  borderRadius: BorderRadius.circular(appSizes.borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: appColors.shadow,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scan QR Code to Receive',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: appSizes.spaceLarge.toDouble()),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 300,
                          maxHeight: 300,
                        ),
                        decoration: BoxDecoration(
                          color: appColors.background,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: appColors.border),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.qr_code_2,
                            size: 220,
                            color: appColors.secondary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: appSizes.spaceLarge.toDouble()),
                  ],
                ),
              ),
            ),
            SizedBox(height: appSizes.spaceLarge.toDouble()),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(namePages.ErrorView);
                      print("تم حفظ الباركود");
                    },
                    icon: Icon(Icons.download_rounded, size: 26),
                    label: Text(
                      "Save Image",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.primary,
                      foregroundColor: appColors.secondary,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          appSizes.borderRadius,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: appSizes.spaceMedium.toDouble()),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(namePages.ErrorView);

                      myViewModel.shareLink();
                    },
                    icon: Icon(Icons.share_rounded, size: 26),
                    label: Text(
                      "Share",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.bgCard,
                      foregroundColor: appColors.textPrimary,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      minimumSize: Size(double.infinity, 56),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          appSizes.borderRadius,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: appSizes.spaceSmall.toDouble()),
          ],
        ),
      ),
    );
  }
}
