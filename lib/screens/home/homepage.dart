import "package:flutter/material.dart";
import 'package:flutter_assignment/data/model/event_model.dart';
import 'package:flutter_assignment/screens/search/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../logic/event_cubit.dart';
import '../../logic/event_state_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_assignment/screens/home/eventcontainer.dart';
import 'package:flutter_assignment/screens/eventdetail/detail_screen.dart';
import '../../values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: detailsAppBar(context),
      body: SafeArea(child: BlocBuilder<EventCubit, EventState>(
        builder: (conext, state) {
          if (state is EventLodingState) {
            return Center(
              child: Lottie.asset('assets/animations/lodingAnimation.json',
                  height: 200, width: 200),
            );
          }
          if (state is EventLodedState) {
            return buildEventListView(state.events);
          }
          return Center(
            child: Lottie.asset('assets/animations/error.jason',
                height: 200, width: 200),
          );
        },
      )),
    );
  }

  Widget buildEventListView(List<EventModel> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        EventModel event = events[index];
        return EventContainer(
          voidCallback: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          desc: event.description.toString(),
                          organiser_name: event.organiserName.toString(),
                          banner: event.bannerImage.toString(),
                          iconLink: event.organiserIcon.toString(),
                          date: event.dateTime.toString(),
                          city: event.venueCity.toString(),
                          venue: event.venueName.toString(),
                          country: event.venueCountry.toString(),
                          eventTitle: event.title.toString(),
                        )));
          },
          date: event.dateTime.toString(),
          city: event.venueCity.toString(),
          venue: event.venueName.toString(),
          country: event.venueCountry.toString(),
          eventTitle: event.title.toString(),
          iconLink: event.bannerImage.toString(),
        );
      },
    );
  }

  AppBar detailsAppBar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
        child: Text(
          'Events',
          style: TextStyle(
            color: primarycolor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ));
          },
          child: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              "assets/icons/more-vertical.svg",
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }
}
