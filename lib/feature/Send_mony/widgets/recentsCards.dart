import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:flutter/material.dart';

class Recentscards extends StatelessWidget {
  final String? title;
  final String? suptitle;
  const Recentscards({super.key, this.title, this.suptitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: appcolors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.person_2_rounded),
        ),
        title: Text("$title", style: Textthemelight.textTheme.bodyMedium),
        subtitle: Text("$suptitle", style: Textthemelight.textTheme.bodySmall),
      ),
    );
  }
}
