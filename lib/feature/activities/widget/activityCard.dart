import 'package:flutter/material.dart';
import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';
import '../model/activity_model.dart';

class activityCard extends StatelessWidget {
  final ActivityModel activity;

  const activityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    // map icons and colors by activity type
    Color iconBackground;
    IconData iconData;
    switch (activity.type) {
      case ActivityType.spent:
        iconData = Icons.arrow_upward_rounded;
        iconBackground = appColors.error.withOpacity(0.12);
        break;
      case ActivityType.received:
        iconData = Icons.arrow_downward_rounded;
        iconBackground = appColors.success.withOpacity(0.12);
        break;
      case ActivityType.transfer:
        iconData = Icons.send_rounded;
        iconBackground = appColors.info.withOpacity(0.12);
        break;
      case ActivityType.linkBank:
        iconData = Icons.account_balance_rounded;
        iconBackground = appColors.primary.withOpacity(0.12);
        break;
      case ActivityType.login:
        iconData = Icons.login_rounded;
        iconBackground = appColors.primary.withOpacity(0.12);
        break;
      case ActivityType.signUp:
      default:
        iconData = Icons.person_add_alt_1_rounded;
        iconBackground = appColors.bgCard;
        break;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(appSizes.padding),
      decoration: BoxDecoration(
        color: appColors.bgWhite,
        borderRadius: BorderRadius.circular(appSizes.borderRadius),
        boxShadow: [
          BoxShadow(
            color: appColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(iconData, color: appColors.secondary, size: 26),
          ),
          SizedBox(width: appSizes.padding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appColors.secondary,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  activity.subtitle,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: appColors.textHint,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      activity.formattedTime,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: appColors.textHint,
                          ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: appColors.bgCard,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        activity.status,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: appColors.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
