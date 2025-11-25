import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global/widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 70,
        horizontal: width < 500 ? 16 : width < 900 ? 30 : 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          _buildHeader(width),
          const SizedBox(height: 50),
          _buildProjectLayout(width),
        ],
      ),
    );
  }

  // ------------------------------
  // HEADER
  // ------------------------------
  Widget _buildHeader(double width) {
    return Column(
      children: [
        CustomButton(text: 'Projects', onPressed: () {}),
        const SizedBox(height: 18),
        Text(
          "My Projects",
          style: GoogleFonts.poppins(
            fontSize: width < 500 ? 28 : width < 900 ? 38 : 48,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Check out some of my professional and personal projects.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: width < 500 ? 14 : width < 900 ? 16 : 18,
          ),
        ),
      ],
    );
  }

  // ------------------------------
  // RESPONSIVE LAYOUT ENGINE
  // ------------------------------
  Widget _buildProjectLayout(double width) {
    // Mobile (≤700px)
    if (width < 700) {
      return Column(
        children: List.generate(
          projects.length,
              (index) => Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: ProjectCard(project: projects[index], width: width),
          ),
        ),
      );
    }

    // Tablet (700–1024)
    if (width < 1100) {
      return _buildGrid(2, width);
    }

    // Small laptop (1100–1500)
    if (width < 1500) {
      return _buildGrid(3, width);
    }

    // Large desktop (1500+)
    return _buildGrid(4, width);
  }

  Widget _buildGrid(int columns, double width) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        childAspectRatio: width < 900 ? 0.75 : 0.90,
      ),
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index], width: width);
      },
    );
  }

  // SAMPLE DATA
  static final projects = [
    Project(
      title: "PayRun HRM",
      description:
      "Complete HR & payroll management app with employee tracking, payroll automation and admin interface.",
      imageUrl: "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x",
      tags: ["Flutter", "GetX", "Firebase", "Hive"],
    ),
    Project(
      title: "EasyDesk AI",
      description:
      "AI-powered helpdesk with live chat, smart ticketing and automated workflows.",
      imageUrl: "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x",
      tags: ["Flutter", "Firebase", "REST API"],
    ),
    Project(
      title: "LMS Mobile",
      description:
      "Full-featured LMS for students with offline access, quizzes & video learning.",
      imageUrl: "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=752x",
      tags: ["Flutter", "Provider", "SQLite", "API"],
    ),
  ];
}

// ===============================================
// MODEL
// ===============================================
class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> tags;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
  });
}

// ===============================================
// PROJECT CARD (FULLY RESPONSIVE)
// ===============================================
class ProjectCard extends StatelessWidget {
  final Project project;
  final double width;

  const ProjectCard({super.key, required this.project, required this.width});

  @override
  Widget build(BuildContext context) {
    // dynamic card sizing
    final isSmall = width < 450;
    final isMobile = width < 700;

    final cardPadding = isSmall ? 10 : isMobile ? 14 : 18;
    final titleSize = isSmall ? 14 : isMobile ? 16 : 18;
    final descSize = isSmall ? 11 : isMobile ? 12 : 14;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(6)),
            child: Image.network(
              project.imageUrl,
              height: isSmall ? 100 : isMobile ? 140 : 190,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // CONTENT
          Padding(
            padding: EdgeInsets.all(cardPadding.toDouble()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: titleSize.toDouble(),
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // DESCRIPTION (AUTO TRIMS)
                Text(
                  project.description,
                  maxLines: isSmall ? 3 : 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: descSize.toDouble(),
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 12),

                // TAGS
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: project.tags
                      .map((tag) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF334155),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.poppins(
                        fontSize: isSmall ? 9 : 11,
                        color: Colors.white,
                      ),
                    ),
                  ))
                      .toList(),
                ),

                SizedBox(height: 20,),

                OutlinedButton.icon(
                  onPressed: () {},

                  style: OutlinedButton.styleFrom(
                    side:  BorderSide(color: Colors.blueAccent,width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding:
                    EdgeInsets.symmetric(vertical: isSmall ? 4 : 8,horizontal: 20),
                  ),
                  
                  
                  label: Wrap(
                    children: [
                      Text(
                        "Details",
                        style: GoogleFonts.poppins(
                          fontSize: isSmall ? 10 : 12,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(width: 8,),
                      Icon(Icons.arrow_forward_outlined,color: Colors.blueAccent,)
                      
                      
                    ],
                  ),
                ),

                // BUTTONS
                const SizedBox(height: 50)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
