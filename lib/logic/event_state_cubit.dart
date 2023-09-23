import '../data/model/event_model.dart';

abstract class EventState {}

class EventLodingState extends EventState {}

class EventLodedState extends EventState {
  final List<EventModel> events;
  EventLodedState(this.events);
}

class EventErrorState extends EventState {
  final String error;
  EventErrorState(this.error);
}
