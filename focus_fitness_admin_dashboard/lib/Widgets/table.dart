import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescue_med_admin/Widgets/table_data_card.dart';

class Table1 extends StatefulWidget {
  const Table1({
    super.key,
    required this.topic,
    required this.mainid,
    required this.mainname,
    required this.maincnum,
    required this.maintype,
    required this.mainlocation,
    required this.cards,
  });
  final String topic;
  final String mainid;
  final String mainname;
  final String maincnum;
  final String maintype;
  final String mainlocation;
  final List<TableDataCard> cards;

  @override
  State<Table1> createState() => _Table1State();
}

class _Table1State extends State<Table1> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: 360,
      width: screenSize.width * 0.34,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 87, 87, 87),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 52, 52, 52).withOpacity(0.4),
            offset: const Offset(0, 5),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.topic,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Container(
              width: screenSize.width * 0.32,
              height: 1,
              color: Colors.white,
            ),
            Container(
              height: 45,
              width: screenSize.width * 0.34,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 94, 94),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 52, 52, 52).withOpacity(0.4),
                    offset: const Offset(0, 5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: 75,
                        child: Column(
                          children: [
                            Text(
                              widget.mainid,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: 70,
                        child: Column(
                          children: [
                            Text(
                              widget.mainname,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      widget.maincnum,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.maintype,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        width: 75,
                        child: Text(
                          widget.mainlocation,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenSize.height * 0.002),
            ...widget.cards,
            // const TableDataCard(
            //     id: "H-256348",
            //     name: "Lanka Hospital",
            //     cnum: "045-5555666",
            //     type: "Private Hospital",
            //     location: "Colombo"),
            // const TableDataCard(
            //     id: "H-256348",
            //     name: "Lanka Hospital",
            //     cnum: "045-5555666",
            //     type: "Private Hospital",
            //     location: "Colombo"),
            // const TableDataCard(
            //     id: "H-256348",
            //     name: "Lanka Hospital",
            //     cnum: "045-5555666",
            //     type: "Private Hospital",
            //     location: "Colombo"),
            // const TableDataCard(
            //     id: "H-256348",
            //     name: "Lanka Hospital",
            //     cnum: "045-5555666",
            //     type: "Private Hospital",
            //     location: "Colombo"),
          ],
        ),
      ),
    );
  }
}
