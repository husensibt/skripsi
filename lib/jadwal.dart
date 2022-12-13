import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skripsi/home_page.dart';
import 'package:skripsi/main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class calendar extends StatefulWidget {
  @override
  _calendar createState() => _calendar();
}

class _calendar extends State<calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  Map<String, List> mySelectedEvent = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvent[DateFormat('dd-MM-yyyy').format(dateTime)] != null) {
      return mySelectedEvent[DateFormat('dd-MM-yyyy').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEvent() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Color(0xff92C9A1),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Masukkan title dan description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              } else {
                print(titleController.text);
                print(descpController.text);

                if (mySelectedEvent[
                        DateFormat('dd-MM-yyyy').format(selectedDay)] !=
                    null) {
                  mySelectedEvent[DateFormat('dd-MM-yyyy').format(selectedDay)]
                      ?.add(
                    {
                      'eventTitle': titleController.text,
                      'eventDescp': descpController.text,
                    },
                  );
                } else {
                  mySelectedEvent[
                      DateFormat('dd-MM-yyyy').format(selectedDay)] = [
                    {
                      'eventTitle': titleController.text,
                      'eventDescp': descpController.text,
                    }
                  ];
                }
                print('New Event ${json.encode(mySelectedEvent)}');
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: Color(0xff92C9A1),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                homepage(username: username)));
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime.utc(1999),
            lastDay: DateTime.utc(2030),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              if (!isSameDay(selectDay, selectedDay)) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              }
              print(focusedDay);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Color(0xff4C9E63),
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Color(0xff4C9E63),
                shape: BoxShape.circle,
              ),
            ),
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _listOfDayEvents,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: Color(0xff67BD7F),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'Upcomming Event',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => _showAddEvent(),
        child: Icon(
          Icons.plus_one_rounded,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff92C9A1),
      ),
    );
  }
}
//Widget calendarControl() {
  //return Container(
    //margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
   // decoration: BoxDecoration(
     // color: Colors.white,
   // ),
    //child: TableCalendar(
      //focusedDay: DateTime.now(),
     // firstDay: DateTime.utc(1999),
     // lastDay: DateTime.utc(2030),
     // calendarFormat: format,
     // onFormatChanged: (CalendarFormat _format){
       // setState((){
         // format  = _format
       // });
     // },
     // calendarStyle: CalendarStyle(
       // canMarkersOverflow: true,
     // ),
   // ),
  //);
//}
