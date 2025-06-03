import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            _buildHeroSection(),
            _buildContactSection(),
            _buildMapSection(),
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
            'Contact Us',
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Get in touch with our team for any questions or support',
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

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contact Form
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send us a Message',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 32),
                _buildContactForm(),
              ],
            ),
          ),
          const SizedBox(width: 64),
          // Contact Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Information',
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 32),
                _buildContactInfoCard(
                  icon: Icons.location_on,
                  title: 'Address',
                  content: '123 Safety Street\nMedical District, MD 12345',
                ),
                const SizedBox(height: 24),
                _buildContactInfoCard(
                  icon: Icons.phone,
                  title: 'Phone',
                  content: '+1 (555) 123-4567',
                ),
                const SizedBox(height: 24),
                _buildContactInfoCard(
                  icon: Icons.email,
                  title: 'Email',
                  content: 'support@lifelinetags.se',
                ),
                const SizedBox(height: 32),
                Text(
                  'Business Hours',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Monday - Friday: 9:00 AM - 6:00 PM\nSaturday: 10:00 AM - 4:00 PM\nSunday: Closed',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFF4B5563),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Column(
      children: [
        _buildFormField(
          label: 'Name',
          hint: 'Enter your name',
          icon: Icons.person,
        ),
        const SizedBox(height: 24),
        _buildFormField(
          label: 'Email',
          hint: 'Enter your email',
          icon: Icons.email,
        ),
        const SizedBox(height: 24),
        _buildFormField(
          label: 'Phone',
          hint: 'Enter your phone number',
          icon: Icons.phone,
        ),
        const SizedBox(height: 24),
        _buildFormField(
          label: 'Message',
          hint: 'Enter your message',
          icon: Icons.message,
          maxLines: 5,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Send Message',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF6B7280),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE5E7EB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF2563EB),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
            color: const Color(0xFF2563EB),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF4B5563),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 400,
      color: const Color(0xFFF9FAFB),
      child: const Center(
        child: Icon(
          Icons.map,
          size: 64,
          color: Color(0xFF2563EB),
        ),
      ),
    );
  }
}
