import 'package:flutter/material.dart';
import '../model/activity_model.dart';

enum ActivityFilter { all, spent, received, signIn, signUp, sent, linked }

class activityViewModel extends ChangeNotifier {
  final List<ActivityModel> _activities = [];
  ActivityFilter _selectedFilter = ActivityFilter.all;

  ActivityFilter get selectedFilter => _selectedFilter;
  List<ActivityModel> get activities => List.unmodifiable(_activities);

  List<ActivityModel> get filteredActivities {
    if (_selectedFilter == ActivityFilter.all) return activities;
    return _activities.where((activity) {
      if (_selectedFilter == ActivityFilter.spent) {
        return activity.type == ActivityType.spent;
      }
      if (_selectedFilter == ActivityFilter.received) {
        return activity.type == ActivityType.received;
      }
      if (_selectedFilter == ActivityFilter.signIn) {
        return activity.type == ActivityType.login;
      }
      if (_selectedFilter == ActivityFilter.signUp) {
        return activity.type == ActivityType.signUp;
      }
      if (_selectedFilter == ActivityFilter.sent) {
        return activity.type == ActivityType.transfer;
      }
      if (_selectedFilter == ActivityFilter.linked) {
        return activity.type == ActivityType.linkBank;
      }
      return true;
    }).toList();
  }

  void setFilter(ActivityFilter filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void addActivity({
    required String title,
    required String subtitle,
    required ActivityType type,
  }) {
    _activities.insert(
      0,
      ActivityModel(
        title: title,
        subtitle: subtitle,
        timestamp: DateTime.now(),
        type: type,
      ),
    );
    notifyListeners();
  }

  void recordLogin() {
    addActivity(
      title: 'Signed in',
      subtitle: 'Login successful',
      type: ActivityType.login,
    );
  }

  void recordSignUp() {
    addActivity(
      title: 'Account created',
      subtitle: 'New user signed up',
      type: ActivityType.signUp,
    );
  }

  void recordSpent({
    String title = 'Spent',
    String subtitle = 'Payment completed',
  }) {
    addActivity(title: title, subtitle: subtitle, type: ActivityType.spent);
  }

  void recordReceived({
    String title = 'Received',
    String subtitle = 'Payment received',
  }) {
    addActivity(title: title, subtitle: subtitle, type: ActivityType.received);
  }

  void recordSendMoney({required double amount, required String to}) {
    addActivity(
      title: 'Sent \$${amount.toStringAsFixed(2)}',
      subtitle: 'Sent to $to',
      type: ActivityType.transfer,
    );
  }

  void recordLinkBank({required String bankName}) {
    addActivity(
      title: 'Linked Bank',
      subtitle: 'Linked account: $bankName',
      type: ActivityType.linkBank,
    );
  }
}
