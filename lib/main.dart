import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/model/event_model.dart';
import 'package:flutter_assignment/data/repo/events_repo.dart';
import 'package:flutter_assignment/logic/event_cubit.dart';
import 'package:flutter_assignment/screens/home/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  EventRepo eventRepo = EventRepo();
  List<EventModel> eventModels = await eventRepo.fetchEvents();
  log(eventModels.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EventCubit(),
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
  }
}
