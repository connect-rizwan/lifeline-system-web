import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            _buildHeroSection(),
            _buildFeaturesSection(),
            _buildAppPreview(),
            _buildTestimonialsSection(),
            _buildDownloadSection(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFFF9FAFB),
      child: Column(
        children: [
          Text(
            'Our Mobile App',
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Stay connected and in control with our powerful mobile application',
            style: GoogleFonts.inter(
              fontSize: 20,
              color: const Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'App Features',
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureCard(
                icon: Icons.notifications_active,
                title: 'Real-time Alerts',
                description:
                    'Receive instant notifications about your medical alert device status and emergency situations.',
              ),
              _buildFeatureCard(
                icon: Icons.location_on,
                title: 'Location Tracking',
                description:
                    'Track the location of your loved ones in real-time and set up safe zones.',
              ),
              _buildFeatureCard(
                icon: Icons.medical_services,
                title: 'Health Monitoring',
                description:
                    'Monitor vital signs and health metrics through connected medical devices.',
              ),
            ],
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureCard(
                icon: Icons.people,
                title: 'Caregiver Access',
                description:
                    'Share access with family members and caregivers to stay informed.',
              ),
              _buildFeatureCard(
                icon: Icons.history,
                title: 'Activity History',
                description:
                    'View detailed history of alerts, responses, and device activity.',
              ),
              _buildFeatureCard(
                icon: Icons.settings,
                title: 'Easy Setup',
                description:
                    'Simple device pairing and configuration through the app.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: const Color(0xFF2563EB),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF4B5563),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAppPreview() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFFF9FAFB),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experience the App',
                  style: GoogleFonts.inter(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Our mobile app provides a seamless experience for managing your medical alert system. Stay connected with your loved ones and emergency services at all times.',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: const Color(0xFF4B5563),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    _buildAppStoreButton(
                      image: 'assets/images/app/app-store.png',
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _buildAppStoreButton(
                      image: 'assets/images/app/google-play.png',
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 64),
          Expanded(
            child: Image.asset(
              'assets/images/app/app-preview.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppStoreButton({
    required String image,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(
        image,
        height: 48,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 48,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.error),
          );
        },
      ),
    );
  }

  Widget _buildTestimonialsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'What Our Users Say',
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTestimonialCard(
                name: 'John Smith',
                role: 'Senior User',
                testimonial:
                    'The app makes it so easy to manage my medical alert system. I feel safer knowing help is just a tap away.',
              ),
              _buildTestimonialCard(
                name: 'Mary Johnson',
                role: 'Family Caregiver',
                testimonial:
                    'Being able to monitor my mother\'s location and receive alerts gives me peace of mind.',
              ),
              _buildTestimonialCard(
                name: 'David Wilson',
                role: 'Healthcare Provider',
                testimonial:
                    'The app\'s interface is intuitive and the features are exactly what we need for our patients.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard({
    required String name,
    required String role,
    required String testimonial,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.format_quote,
            size: 48,
            color: Color(0xFF2563EB),
          ),
          const SizedBox(height: 24),
          Text(
            testimonial,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF4B5563),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          Text(
            role,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2563EB),
            Color(0xFF1D4ED8),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Download Our App Today',
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join thousands of users who trust Lifeline Tags for their safety',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.white.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAppStoreButton(
                image: 'assets/images/app/app-store.png',
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              _buildAppStoreButton(
                image: 'assets/images/app/google-play.png',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
