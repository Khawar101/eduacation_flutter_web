import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersHead extends StatefulWidget {
  const UsersHead({super.key});

  @override
  State<UsersHead> createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersHead> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                fillColor: const MaterialStatePropertyAll(Colors.black26),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: false,
                onChanged: null),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Row(
                children: [
                  Text(
                    "Customers",
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_downward,
                    color: Colors.black,
                    weight: 1,
                    size: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              child: Text(
                "Status",
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                "Course",
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                "Enrolled",
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                "Progress",
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                "Rating",
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 15,
          thickness: 0.5,
          color: Colors.black38,
        )
      ],
    );
  }
}
