import 'package:flutter/material.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({
    super.key,
    required this.imgUrl,
    required this.schedule,
    required this.username,
  });

  final String imgUrl;
  final String username;
  final String schedule;

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 164, 162, 162),
      width: double.infinity,
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (widget.imgUrl != "")
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.imgUrl),
            ),
          if (widget.imgUrl == "")
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/p1.png"),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(
                    color: Color.fromARGB(255, 51, 49, 49),
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                widget.username,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
              Row(
                children: [
                  Text(
                    "Your current plan :",
                    style: TextStyle(
                        color: Color.fromARGB(255, 51, 49, 49),
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.schedule.length > 12
                        ? widget.schedule.substring(0, 12) + '...'
                        : widget.schedule,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 204, 74, 74),
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.notifications_active_outlined,
            color: Colors.black,
            size: 32,
          ),
        ],
      ),
    );
  }
}
