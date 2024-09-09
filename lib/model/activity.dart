class Activity {
  final String activity;
  final String type;
  final double price;
  final int participants;

  const Activity(this.activity, this.type, this.price, this.participants);

  factory Activity.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'activity': String activity,
        'type': String type,
        'participants': int participants,
        'price': double price
      } =>
        Activity(activity, type, price, participants),
      _ => throw const FormatException("Failed to load Activity")
    };
  }
}
