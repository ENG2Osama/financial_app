import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/widgets/ButtomPrimary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/errorViewModel.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ErrorViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 26),
          onPressed: () {
            viewModel.goBack(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(appSizes.padding),
        child: Center(
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.all(appSizes.padding),
            decoration: BoxDecoration(
              color: appColors.surface,
              borderRadius: BorderRadius.circular(appSizes.borderRadius),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Icon(
                  Icons.error_outline_rounded,
                  size: 100,
                  color: appColors.error,
                ),
                SizedBox(height: appSizes.spaceLarge.toDouble()),
                Text(
                  viewModel.errorData.title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: appColors.error),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: appSizes.spaceMedium.toDouble()),
                Text(
                  viewModel.errorData.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                buttomprimary(
                  txt: "Try Again",
                  fun: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please try again later",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: appColors.onSecondary),
                        ),
                      ),
                    );
                    debugPrint("Retrying connection...");
                  },
                ),
                SizedBox(height: appSizes.spaceMedium.toDouble()),
                OutlinedButton(
                  onPressed: () {
                    viewModel.goBack(context);
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(300, 56),
                    side: BorderSide(color: appColors.textPrimary, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        appSizes.borderRadius,
                      ),
                    ),
                  ),
                  child: Text(
                    "Back Home",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: appColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(height: appSizes.spaceSmall.toDouble()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
