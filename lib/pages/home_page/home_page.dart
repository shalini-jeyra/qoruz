import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:quruz/models/models.dart';


import 'home_page_components/home_page_components.dart';



class HomePage extends StatelessWidget {
  final List<DateTime> days =
      generateDaysForRange(DateTime(2023, 8, 17), DateTime(2023, 9, 21));
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List<TaskModel> yourDataList = [
  TaskModel(
    title: 'Coffee with Julia at Coffee Adda',
    duration: '30 Minutes',
    status: TaskStatus.done,
    time: '09:00 - 09:30',
    cardColor: Color.fromARGB(255, 221,221,255),
    statusColor: Color.fromARGB(255, 122,99,255)
  ),
  TaskModel(
    title: 'E-commerce app project meeting',
    duration: '1.5 hours',
    status: TaskStatus.inProgress,
    time: '10:00 - 11:30',
    cardColor: Color.fromARGB(255, 204,236,255),
    statusColor: Color.fromARGB(255, 81,190,255)
  ),
  TaskModel(
    title: 'Meeting with John Doe',
    duration: '1.5 hours',
    status: TaskStatus.upcoming,
    time: '12:00 - 12:30',
    cardColor: Color.fromARGB(255,202,246,243),
    statusColor: Color.fromARGB(255, 81,203,195)
  ),
 TaskModel(
    title: 'Lunch with Julia',
    duration: '1 Hour',
    status: TaskStatus.upcoming,
    time: '14:00 - 15:00',
    cardColor: Color.fromARGB(255, 254,225,221),
    statusColor: Color.fromARGB(255, 255,167,155)
  ),
];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 68, 201),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 64, 68, 201),
        leading: const CustomMenuIcon(),
        actions: [
          Container(
            width: 35,
            height: 40,
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              getFormattedDate(today),
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Container(
            height: 100,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index) {
                final day = days[index];
                final dayOfWeek = DateFormat('EEE').format(day);
                final isToday = day.year == today.year &&
                    day.month == today.month &&
                    day.day == today.day;
                return Container(
                  width: 75,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isToday
                        ? Colors.white
                        : const Color.fromARGB(255, 88, 93, 255),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayOfWeek.toUpperCase(),
                        style: GoogleFonts.lato(
                            color: isToday
                                ? const Color.fromARGB(255, 88, 93, 255)
                                : Colors.white),
                      ),
                      Text(
                        day.day.toString(),
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isToday
                                ? const Color.fromARGB(255, 88, 93, 255)
                                : Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30,),
          Expanded(
            child: Container(
              
                    decoration: const BoxDecoration(
                    color:  Colors.white,
                       
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                  ),
              padding: const EdgeInsets.all(16.0),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text('Today\'s Tasks',style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.w500,
                           color: Colors.black)),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 15,),
                    itemCount: yourDataList.length,
                    itemBuilder: (context, index) {
                      final data = yourDataList[index];
                  
                      return CardWidget(
                        title: data.title,
                        duration: data.duration,
                        status: data.status,
                        time: data.time,
                        cardColor: data.cardColor,
                        statusColor: data.statusColor,
                      );
                    },
                  ),
                  ),
                ],
              )
          
            ),
          ),
        ],
      ),
    );
  }
}

String getFormattedDate(DateTime date) {
  return DateFormat('MMMM, yyyy').format(date);
}

List<DateTime> generateDaysForRange(DateTime startDate, DateTime endDate) {
  final List<DateTime> days = [];

  for (var day = startDate;
      day.isBefore(endDate.add(const Duration(days: 1)));
      day = day.add(const Duration(days: 1))) {
    days.add(day);
  }

  return days;
}
