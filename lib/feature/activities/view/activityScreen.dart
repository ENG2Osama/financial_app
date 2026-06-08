import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';
import '../viewmodel/activityViewModel.dart';
import '../widget/activityCard.dart';

class activityScreen extends StatelessWidget {
  const activityScreen({super.key});

  bool _isSameDay(DateTime date, DateTime compare) {
    return date.year == compare.year &&
        date.month == compare.month &&
        date.day == compare.day;
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<activityViewModel>();
    final activities = vm.filteredActivities;
    final now = DateTime.now();
    final todayActivities = activities
        .where((activity) => _isSameDay(activity.timestamp, now))
        .toList();
    final yesterday = now.subtract(const Duration(days: 1));
    final yesterdayActivities = activities
        .where((activity) => _isSameDay(activity.timestamp, yesterday))
        .toList();
    final olderActivities = activities.where((activity) {
      return !todayActivities.contains(activity) &&
          !yesterdayActivities.contains(activity);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.bgWhite,
        title: Text('Activity', style: Theme.of(context).textTheme.bodyLarge),
      ),
      backgroundColor: appColors.bgLight,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: appSizes.padding),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip(context, vm, 'All', ActivityFilter.all),
                    const SizedBox(width: 10),
                    _buildFilterChip(
                      context,
                      vm,
                      'Spent',
                      ActivityFilter.spent,
                    ),
                    const SizedBox(width: 10),
                    _buildFilterChip(
                      context,
                      vm,
                      'Received',
                      ActivityFilter.received,
                    ),
                    const SizedBox(width: 10),
                    _buildFilterChip(context, vm, 'Sent', ActivityFilter.sent),
                    const SizedBox(width: 10),
                    _buildFilterChip(
                      context,
                      vm,
                      'Linked',
                      ActivityFilter.linked,
                    ),
                    const SizedBox(width: 10),
                    _buildFilterChip(
                      context,
                      vm,
                      'Sign in',
                      ActivityFilter.signIn,
                    ),
                    const SizedBox(width: 10),
                    _buildFilterChip(
                      context,
                      vm,
                      'Sign up',
                      ActivityFilter.signUp,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: appSizes.padding),
                child: activities.isEmpty
                    ? Center(
                        child: Text(
                          'No activity yet. Your login, sign up, spent and received actions will appear here.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: appColors.textHint),
                        ),
                      )
                    : ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          if (todayActivities.isNotEmpty) ...[
                            Text(
                              'TODAY',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: appColors.textHint,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            ...todayActivities.map(
                              (activity) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: activityCard(activity: activity),
                              ),
                            ),
                          ],
                          if (yesterdayActivities.isNotEmpty) ...[
                            Text(
                              'YESTERDAY',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: appColors.textHint,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            ...yesterdayActivities.map(
                              (activity) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: activityCard(activity: activity),
                              ),
                            ),
                          ],
                          if (olderActivities.isNotEmpty) ...[
                            Text(
                              'Earlier',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: appColors.textHint,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            ...olderActivities.map(
                              (activity) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: activityCard(activity: activity),
                              ),
                            ),
                          ],
                          const SizedBox(height: 24),
                          Center(
                            child: Text(
                              'Viewing last 30 days',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: appColors.textHint),
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    activityViewModel vm,
    String label,
    ActivityFilter filter,
  ) {
    final bool isSelected = vm.selectedFilter == filter;
    return GestureDetector(
      onTap: () => vm.setFilter(filter),
      child: Container(
        alignment: Alignment(0, 0),
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: BoxDecoration(
          color: isSelected ? appColors.primary : appColors.bgWhite,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? appColors.primary : appColors.divider,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: isSelected ? appColors.secondary : appColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
