import 'package:dio/dio.dart';
import 'package:flutter_assignment/data/model/event_model.dart';
import 'package:flutter_assignment/data/repo/api/api.dart';

class EventRepo {
  API api = API();

  Future<List<EventModel>> fetchEvents() async {
    try {
      Response response = await api.sendRequest.get("");

      Map<String, dynamic> jsonString = response.data;

      List<dynamic> eventMaps = jsonString['content']['data'];
      return eventMaps
          .map((eventMap) => EventModel.fromJson(eventMap))
          .toList();
    } catch (e) {
      throw (e);
    }
  }
}
