import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

late Map<DateTime, List<Event>> selectedEvents;
CalendarFormat format = CalendarFormat.month;
DateTime selectedDay = DateTime.now();
DateTime focusedDay = DateTime.now();

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}

final TextEditingController _eventController = TextEditingController();
var dateData1 = TextEditingController();
final dateData2 = TextEditingController();

// FUTURE
Future<void> getData() async {
  selectedEvents = {};
  final response =
      await http.get(Uri.parse("https://api-harilibur.vercel.app/api"));
  List<dynamic> json = jsonDecode(response.body);
  for (var i = 0; i < json.length; i++) {
    if (json[i]["is_national_holiday"] == true) {
      if (json[i]["holiday_date"].length == 9) {
        var time = json[i]["holiday_date"].substring(0, 8) +
            '0' +
            json[i]["holiday_date"].substring(8, 9);
        selectedDay = DateTime.parse(time + " 07:00:00.000").toUtc();
      } else {
        selectedDay =
            DateTime.parse(json[i]["holiday_date"] + " 07:00:00.000").toUtc();
      }
      _eventController.text = json[i]["holiday_name"];
      Event event = Event(title: _eventController.text);
      selectedEvents[selectedDay] = [event];
      selectedDay = DateTime.now();
    }
  }
}

class CalenderMenu extends StatefulWidget {
  const CalenderMenu({super.key});

  @override
  State<CalenderMenu> createState() => _CalenderMenuState();
}

class _CalenderMenuState extends State<CalenderMenu> {
  @override
  void initState() {
    getData();
    setState(() {});
    super.initState();
    // _eventController = TextEditingController();
  }

// LIST EVENT
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black45, Colors.blueGrey],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[500],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height / 1.6,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TableCalendar(
                      headerVisible: true,
                      calendarStyle: CalendarStyle(
                        defaultTextStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        isTodayHighlighted: true,
                        selectedDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(5.0),
                        ),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                          // color: Colors.purpleAccent,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        defaultDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        weekendDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        weekendTextStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 212, 17, 17),
                          height: 1.3333333333333333,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        headerMargin:
                            const EdgeInsets.only(bottom: 17, top: 10),
                        formatButtonVisible: false,
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        leftChevronIcon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        rightChevronIcon: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        titleTextStyle:
                            TextStyle(color: Colors.black, fontSize: 25),
                      ),

                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      daysOfWeekVisible: true,

                      //Day Changed
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          dateData1.text =
                              selectDay.toString().substring(0, 10);
                          print(selectedDay);
                          focusedDay = focusDay;
                        });
                      },

                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },

                      eventLoader: _getEventsfromDay,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 450,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Row(
                        children: const [
                          Text(
                            "Event",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    ..._getEventsfromDay(selectedDay).map(
                      (Event event) => ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            event.title,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
