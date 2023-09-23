import 'package:flutter_assignment/logic/event_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/event_model.dart';
import '../data/repo/events_repo.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventLodingState()) {
    fetchEvents();
  }

  EventRepo eventRepo = EventRepo();

  void fetchEvents() async {
    try {
      List<EventModel> events = await eventRepo.fetchEvents();
      emit(EventLodedState(events));
    } catch (ex) {
      emit(EventErrorState(ex.toString()));
    }
  }
}
