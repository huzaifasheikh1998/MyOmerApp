import 'package:flutter/material.dart';
import 'package:mvvm/model/reminder_model/reminder_model.dart';
import 'package:mvvm/res/color.dart';
import 'package:table_calendar/table_calendar.dart';

class test1 extends StatefulWidget {
  @override
  _test1State createState() => _test1State();
}

class _test1State extends State<test1> with TickerProviderStateMixin {
  late Map<DateTime, List<Reminder>> _events;
  // late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;

  DateTime selectDay = DateTime.now();
  DateTime focusDay = DateTime.now();
//  late CalenderCon _calendarController;

  @override
  void initState() {
    super.initState();
    _eventController = TextEditingController();
    // _calendarController = CalendarBuilders();
    _events = {};
    // _selectedEvents = [];
  }

  List<Reminder> getEventsfromDate(DateTime date) {
    return _events[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    // _calendarController.dispose();
    super.dispose();
  }

  // void _onDaySelected(DateTime day, List<dynamic> events) {
  //   setState(() {
  //     // _selectedEvents = events;
  //   });
  // }

  // void _onEventAdded(DateTime day) {
  //   setState(() {
  //     _events.update(
  //       day,
  //       (value) => [...value, _eventController.text],
  //       ifAbsent: () => [_eventController.text],
  //     );
  //     _eventController.clear();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Table Calendar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2022, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: focusDay,
              onDaySelected: (selectedDay, focusedDay) {
                print("selected date $selectedDay");
                print("focusday $focusedDay");
                setState(() {
                  selectDay = selectedDay;
                  focusDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) {
                // setState(() {

                // });
                print(day);
                print("selected Predicate${isSameDay(selectDay, day)}");
                return isSameDay(selectDay, day);
                // return false;
              },
              eventLoader: getEventsfromDate,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                    color: AppColors.secondaryColor, shape: BoxShape.circle),
                todayDecoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
              ),
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),

              // calendarBuilders: _calendarController,

              // eventLoader: _events,
              // onDaySelected: _onDaySelected,
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                if (_eventController.text.isEmpty) {
                } else {
                  if (_events[selectDay] != null) {
                    _events[selectDay]!
                        .add(Reminder(title: _eventController.text));
                  } else {
                    _events[selectDay] = [
                      Reminder(title: _eventController.text.toString())
                    ];
                  }
                  // Navigator.pop(context);
                  _eventController.clear();
                  return;
                }
              },
              child: Text(
                'Selected events:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8.0),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _selectedEvents.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         title: Text(_selectedEvents[index]),
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 8.0),
            Text(
              'Add Event:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _eventController,
              decoration: InputDecoration(
                hintText: 'Add Event',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8.0),
            // ElevatedButton(
            //   onPressed: () => _onEventAdded(_calendarController.selectedDay),
            //   child: Text('Add'),
            // ),
          ],
        ),
      ),
    );
  }
}
