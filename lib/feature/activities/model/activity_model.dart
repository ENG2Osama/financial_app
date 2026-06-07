enum ActivityType { login, signUp, spent, received, transfer, linkBank }

class ActivityModel {
  final String title;
  final String subtitle;
  final DateTime timestamp;
  final ActivityType type;
  final String status;

  ActivityModel({
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.type,
    this.status = 'Cleared',
  });

  String get formattedTime {
    final int hour = timestamp.hour % 12 == 0 ? 12 : timestamp.hour % 12;
    final String minute = timestamp.minute.toString().padLeft(2, '0');
    final String period = timestamp.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}
