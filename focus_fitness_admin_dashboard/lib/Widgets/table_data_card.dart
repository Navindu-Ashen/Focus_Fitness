import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableDataCard extends StatefulWidget {
  const TableDataCard({
    super.key,
    required this.id,
    required this.name,
    required this.cnum,
    required this.type,
    required this.location,
  });

  final String id;
  final String name;
  final String cnum;
  final String type;
  final String location;

  @override
  State<TableDataCard> createState() => _TableDataCardState();
}

class _TableDataCardState extends State<TableDataCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 45,
      width: screenSize.width * 0.34,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 108, 108, 108),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.id,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 75,
              child: Text(
                widget.name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              widget.cnum,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.type,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              widget.location,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
