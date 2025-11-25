import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/widgets.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  final experiences = const [
    {
      "title": "Apps Developer - Futter",
      "company": "Gain Solutions Ltd - Mirpur 12, Dhaka, Bangladesh (Onsite)",
      "duration": "Jan 2023 - Present",
      "description":"Built and maintained Flutter applications for Android & iOS platforms. Developed HRM solutions and support software using Flutter framework. Implemented GetX for state management and Hive for local storage."
    },
    {
      "title": "Apps Developer - Futter",
      "company":
      "Data App LLC - USA (Remote)",
      "duration": "Oct 2022 - Dec 2023",
      "description":"Developed cross-platform mobile applications using Flutter framework. Built LMS, HRM, and E-commerce applications with responsive UI designs"
    },
    {
      "title": "Apps Developer - Futter",
      "company":
      "GigaSoft LTD.- Mirpur 2, Dhaka, Bangladesh (Onsite)",
      "duration": "Jun 2022 - OCT 2022",
      "description":"Started professional Flutter development career. Worked on various mobile projects learning best practices and architecture patterns."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        bool isMobile = width < 700;
        bool isTablet = width >= 700 && width < 1100;
        bool isDesktop = width >= 1100;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: isMobile ? 16 : isTablet ? 30 : 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CustomButton(
                text: 'Work Experience',
                onPressed: () {},
              ),
              const SizedBox(height: 40),

              Column(
                children: experiences.map((exp) {
                  return _experienceCard(exp, isMobile, isTablet, isDesktop);
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  /// RESPONSIVE EXPERIENCE CARD
  ///
  Widget _experienceCard(Map exp, bool isMobile, bool isTablet, bool isDesktop) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TIMELINE — hide on mobile
          if (!isMobile)
            Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 2,
                  height: isTablet ? 140 : 145,
                  color: Colors.grey.shade700,
                ),
              ],
            ),

          if (!isMobile) const SizedBox(width: 20),

          /// CARD
          Expanded(
            child: Container(
              padding: EdgeInsets.all(isMobile ? 18 : 24),
              decoration: BoxDecoration(
                color: const Color(0xff0e1628),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  /// TITLE + DURATION (Responsive Row)
                  ///
                  isMobile
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exp["title"],
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _durationTag(exp["duration"]),
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          exp["title"],
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20 : 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      _durationTag(exp["duration"]),
                    ],
                  ),

                  const SizedBox(height: 12),

                  ///
                  /// COMPANY
                  ///
                  Text(
                    exp["company"],
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 14,
                      color: Colors.white60,
                    ),
                  ),

                  const SizedBox(height: 16),

                  ///
                  /// DESCRIPTION
                  ///
                  Text(
                    exp["description"],
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 14,
                      height: 1.5,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///
  /// TAG WIDGET
  ///
  Widget _durationTag(String duration) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        duration,
        style: GoogleFonts.poppins(
          fontSize: 13,
          color: const Color(0xff0e1628),
        ),
      ),
    );
  }
}
