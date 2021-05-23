import 'package:glance/models/table_appliances.dart';
import 'package:shared_preferences/shared_preferences.dart';

String power1 = '50';
String power2 = '20';
String power3 = '80';

String count1 = '2';
String count2 = '8';
String count3 = '1';

String time1 = '8';
String time2 = '6';
String time3 = '4';

final allUsers = <Appliances>[
  Appliances(appliance: 'Fan', power: power1, count: count1, time: time1),
  Appliances(appliance: 'Light', power: power2, count: count2, time: time2),
  Appliances(appliance: 'TV', power: power3, count: count3, time: time3),
];

Future setDatas() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('power1', power1);
  sharedPreferences.setString('power2', power2);
  sharedPreferences.setString('power3', power3);
  sharedPreferences.setString('count1', count1);
  sharedPreferences.setString('count2', count2);
  sharedPreferences.setString('count3', count3);
  sharedPreferences.setString('time1', time1);
  sharedPreferences.setString('time2', time2);
  sharedPreferences.setString('time3', time3);
}