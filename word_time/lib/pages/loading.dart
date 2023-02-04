import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import 'dart:convert';
import 'package:word_time/service/world_time.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void SetupWorldTime() async{
    WorldTime instance = WorldTime(location: 'VietNam',flag: 'VNA.png', url:'Asia/Ho_Chi_Minh');
    await instance.getData();    
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isday':instance.isday,
    });
  }

  @override
  void initState() {
    super.initState();
    SetupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white,
        size: 50,
      ),
    ),
    );
  }
}