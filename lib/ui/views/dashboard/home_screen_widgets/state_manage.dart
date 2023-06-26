import 'package:education_flutter_web/ui/views/dashboard/home_screen_widgets/stats.dart';
import 'package:flutter/material.dart';

Widget stateManage(context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return screenWidth > 1200
      ? const Row(
          children: [
            Stats(
              headingText: 'Total Member',
              containerText: '20',
              number: '1,620',
            ),
            Stats(
              headingText: 'Enrolled Member',
              containerText: '15',
              number: '1,220',
            ),
            Stats(
              headingText: 'Active Now ',
              containerText: '12',
              number: '208',
            ),
          ],
        )
      : screenWidth > 800
          ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stats(
                      headingText: 'Total Member',
                      containerText: '20',
                      number: '1,620',
                    ),
                    Stats(
                      headingText: 'Enrolled Member',
                      containerText: '15',
                      number: '1,220',
                    ),
                  ],
                ),
                Stats(
                  headingText: 'Active Now ',
                  containerText: '12',
                  number: '208',
                ),
              ],
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Stats(
                    headingText: 'Total Member',
                    containerText: '20',
                    number: '1,620',
                  ),
                  Stats(
                    headingText: 'Enrolled Member',
                    containerText: '15',
                    number: '1,220',
                  ),
                  Stats(
                    headingText: 'Active Now ',
                    containerText: '12',
                    number: '208',
                  ),
                ]),
              ],
            );
}
