import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: AnimationLimiter( // Required for staggered animations
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 800),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              // About Me Button
              AnimationConfiguration.synchronized(
                duration: const Duration(milliseconds: 600),
                child: SlideAnimation(
                  horizontalOffset: -100,
                  child: FadeInAnimation(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6),
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF3B82F6).withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Text(
                        'About Me',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                'Who I Am',
                style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold, height: 1.2),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "I'm a passionate Full-Stack Developer with expertise in building modern web applications. "
                      "With a strong foundation in both frontend and backend technologies, I create seamless digital "
                      "experiences that solve real-world problems.",
                  style: TextStyle(color: Colors.white70, fontSize: 18, height: 1.6),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 80),

              // Responsive Layout with animations
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isMobile = constraints.maxWidth < 900;

                  return isMobile
                      ? Column(
                    children: [
                      _buildAnimatedLeftColumn(),
                      const SizedBox(height: 60),
                      _buildAnimatedRightColumn(),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildAnimatedLeftColumn()),
                      const SizedBox(width: 80),
                      Expanded(child: _buildAnimatedRightColumn()),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Animated Left Column (Feature Items)
  Widget _buildAnimatedLeftColumn() {
    return AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 200),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 60,
            child: FadeInAnimation(
              delay: const Duration(milliseconds: 100),
              child: widget,
            ),
          ),
          children: [
            _buildFeatureItem(
              icon: Icons.verified_user_outlined,
              title: 'Reliable & Secure',
              description: 'I build applications with security and reliability at their core, ensuring your data is protected.',
            ),
            const SizedBox(height: 40),
            _buildFeatureItem(
              icon: Icons.auto_awesome,
              title: 'Innovative Solutions',
              description: 'I leverage cutting-edge technologies to create innovative solutions for complex problems.',
            ),
            const SizedBox(height: 40),
            _buildFeatureItem(
              icon: Icons.thumb_up_outlined,
              title: 'User-Focused Design',
              description: 'I prioritize user experience, creating intuitive interfaces that delight users.',
            ),
          ],
        ),
      ),
    );
  }

  // Animated Right Column (My Journey)
  Widget _buildAnimatedRightColumn() {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 900),
      child: SlideAnimation(
        horizontalOffset: 100,
        child: FadeInAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'My Journey',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Text(
                "With over 4 years of experience in web development, I've worked on projects ranging from small business websites to "
                    "large-scale enterprise applications. This journey has strengthened my expertise in building modern, scalable, and "
                    "user-focused solutions.\n\n"
                    "I'm passionate about continuous learning and always adapting to new technologies, ensuring I deliver innovative applications "
                    "that exceed client expectations in both performance and design.",
                style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.7),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return SlideAnimation(
      verticalOffset: 50,
      child: FadeInAnimation(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF3B82F6).withOpacity(0.3), blurRadius: 15),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(description, style: const TextStyle(color: Colors.white70, fontSize: 15, height: 1.6)),
                ],
              ),
            ),
                     ],
        ),
      ),
    );
  }
}