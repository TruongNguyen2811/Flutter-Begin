import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isday;

  WorldTime({ required this.location,  required this.flag,  required this.url});

  Future <void> getData() async {
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data= jsonDecode(response.body);
      print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));
      isday = now.hour>5&&now.hour<18 ? true:false; 
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      // time='Could not get the data';
    }
  }
}
