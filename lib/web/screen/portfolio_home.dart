
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/about_screen.dart';
import '../widgets/contact_sections.dart';
import '../widgets/heder_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/project_serction.dart';
import '../widgets/skils_section.dart';
import '../widgets/work_exprence.dart';

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020817),
      /// MOBILE DRAWER
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF020817),

        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            drawerMenuItem("Home"),
            drawerMenuItem("About"),
            drawerMenuItem("Projects"),
            drawerMenuItem("Contact"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              HeaderSection(),
              HeroSection(),
              AboutMeSection(),
              SkillsSection(),
              WorkExperienceSection(),
             ProjectsSection(),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
  }
}



