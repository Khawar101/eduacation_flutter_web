import 'package:education_flutter_web/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Enrolment extends StatefulWidget {
  const Enrolment({super.key});

  @override
  State<Enrolment> createState() => _EnrolmentState();
}

class _EnrolmentState extends State<Enrolment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Course members",
              style: GoogleFonts.ibmPlexSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          "Manage, total course members and their progress.",
          style: GoogleFonts.ibmPlexSans(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToggleSwitch(
              borderWidth: 0.5,
              dividerMargin: 0,
              borderColor: const [Colors.black26],
              dividerColor: Colors.black26,
              minWidth: MediaQuery.of(context).size.width * 0.06,
              minHeight: 40.0,
              fontSize: 12.0,
              initialLabelIndex: 1,
              activeBgColor: const [Colors.black],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.grey[900],
              totalSwitches: 4,
              labels: const [
                'View all',
                'Enrolled',
                'Active now',
                'Unenrolled'
              ],
              onToggle: (index) {
                //print('switched to: $index');
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: CustomTextField(
                hintText: 'Search',
                prefix: Icon(
                  Icons.search,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
