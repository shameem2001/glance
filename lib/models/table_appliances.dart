import 'package:flutter/cupertino.dart';

class Appliances {
  final String appliance;
  final String power;
  final String count;
  final String time;

  const Appliances({
    @required this.appliance,
    @required this.power,
    @required this.count,
    @required this.time,
  });

  Appliances copy({
    String appliance,
    String power,
    String count,
    String time,
  }) =>
      Appliances(
        appliance: appliance ?? this.appliance,
        power: power ?? this.power,
        count: count ?? this.count,
        time: time?? this.time,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Appliances &&
              runtimeType == other.runtimeType &&
              appliance == other.appliance &&
              power == other.power &&
              count == other.count &&
              time == other.time;

  @override
  int get hashCode => appliance.hashCode ^ power.hashCode ^ count.hashCode ^ time.hashCode;
}