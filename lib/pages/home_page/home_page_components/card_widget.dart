import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/models.dart';
import 'home_page_components.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String time;
  final TaskStatus status;
  final String duration;
  final Color cardColor;
  final Color statusColor;
  const CardWidget({
    required this.title,
    required this.time,
    required this.status,
    required this.duration,
    required this.cardColor,
    required this.statusColor,
  });
  String statusmethod() {
    switch (status) {
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.upcoming:
        return 'Upcoming';
      default:
        return 'No Status';
    }
  }

  Widget getCircleWidget() {
    switch (status) {
      case TaskStatus.done:
        return Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 88, 93, 255),
          ),
          child: const Icon(
            Icons.done,
            color: Colors.white,
          ),
        );
      case TaskStatus.inProgress:
        return Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 81, 190, 255),
            ),
            child: Center(
              child: Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ));
      case TaskStatus.upcoming:
        return Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        );
      default:
        return Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getCircleWidget(),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 2,
                  height: 90,
                  child: CustomPaint(
                    painter: DottedLinePainter(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Card(
              color: cardColor,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        style: GoogleFonts.lato(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 104, 104, 107),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        title,
                        style:  GoogleFonts.lato(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            duration,
                            style: GoogleFonts.lato(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 104, 104, 107),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 16),
                              child: Text(
                                statusmethod(),
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
