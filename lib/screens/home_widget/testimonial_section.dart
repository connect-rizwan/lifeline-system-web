import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';
import 'package:lifeline_system_website/screens/home_widget/section_header.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({super.key});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  Widget _buildProfessionalTestimonialCard({
    required String name,
    required String role,
    required String company,
    required String testimonial,
    required int rating,
    required String initials,
    required Color avatarColor,
    required BuildContext context,
  }) {
    final bool isMobile = ResponsiveHandler.isMobile(context);
    final bool isTablet = ResponsiveHandler.isTablet(context);

    return Container(
      width: isMobile ? double.infinity : (isTablet ? 340 : 380),
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      margin: isMobile ? const EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade100,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                rating,
                (index) => const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFF59E0B),
                  size: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 20),
          Container(
            padding: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: avatarColor,
                  width: 3,
                ),
              ),
            ),
            child: Text(
              testimonial,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF374151),
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: avatarColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      role,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF6B7280),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      company,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: const Color(0xFF9CA3AF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile) // Hide verified badge on mobile to save space
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.verified_rounded,
                        size: 14,
                        color: Color(0xFF10B981),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Verified',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrustIndicator(
      String number, String label, BuildContext context) {
    final bool isMobile = ResponsiveHandler.isMobile(context);

    return Column(
      children: [
        Text(
          number,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: isMobile ? 12 : 14,
            color: const Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveHandler.isMobile(context);
    final bool isTablet = ResponsiveHandler.isTablet(context);

    final List<Widget> testimonialCards = [
      _buildProfessionalTestimonialCard(
        name: 'Dr. Sarah Chen',
        role: 'Emergency Medicine Director',
        company: 'Metropolitan Medical Center',
        testimonial:
            'LifeLine has revolutionized our emergency response protocol. The precision and speed of their system has directly contributed to saving lives in our community.',
        rating: 5,
        initials: 'SC',
        avatarColor: const Color(0xFF2563EB),
        context: context,
      ),
      SizedBox(width: isMobile ? 0 : 24),
      _buildProfessionalTestimonialCard(
        name: 'Robert Martinez',
        role: 'Family Caregiver',
        company: 'LifeLine User Since 2022',
        testimonial:
            'When my father had his cardiac episode, LifeLine\'s instant detection and emergency response gave us the critical minutes that made all the difference. Truly life-saving.',
        rating: 5,
        initials: 'RM',
        avatarColor: const Color(0xFF059669),
        context: context,
      ),
      SizedBox(width: isMobile ? 0 : 24),
      if (!isMobile) // Only show 2 cards on mobile
        _buildProfessionalTestimonialCard(
          name: 'Dr. James Thompson',
          role: 'Geriatric Specialist',
          company: 'Senior Health Associates',
          testimonial:
              'I recommend LifeLine to every patient. The comprehensive health monitoring and family integration features provide unparalleled peace of mind for seniors living independently.',
          rating: 5,
          initials: 'JT',
          avatarColor: const Color(0xFF7C3AED),
          context: context,
        ),
      if (!isTablet && !isMobile) // Only show on desktop
        const SizedBox(width: 24),
      if (!isTablet && !isMobile)
        _buildProfessionalTestimonialCard(
          name: 'Linda Williams',
          role: 'Registered Nurse',
          company: 'Community Care Services',
          testimonial:
              'The integration with our patient care systems is seamless. LifeLine provides the real-time health data we need to deliver proactive, personalized care to our clients.',
          rating: 5,
          initials: 'LW',
          avatarColor: const Color(0xFFDC2626),
          context: context,
        ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFBFC),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 24),
            child: const SectionHeader(
              title: 'Trusted by Healthcare Professionals',
              subtitle:
                  'Join thousands of families and medical professionals who rely on our life-saving technology.',
            ),
          ),
          SizedBox(height: isMobile ? 30 : 50),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 40,
              vertical: isMobile ? 16 : 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: isMobile
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildTrustIndicator('50K+', 'Active Users', context),
                          _buildTrustIndicator(
                              '99.8%', 'Success Rate', context),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildTrustIndicator(
                              '24/7', 'Support Available', context),
                          _buildTrustIndicator(
                              '<2min', 'Avg Response Time', context),
                        ],
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTrustIndicator('50K+', 'Active Users', context),
                      Container(
                          width: 1, height: 40, color: Colors.grey.shade300),
                      _buildTrustIndicator('99.8%', 'Success Rate', context),
                      Container(
                          width: 1, height: 40, color: Colors.grey.shade300),
                      _buildTrustIndicator(
                          '24/7', 'Support Available', context),
                      Container(
                          width: 1, height: 40, color: Colors.grey.shade300),
                      _buildTrustIndicator(
                          '<2min', 'Avg Response Time', context),
                    ],
                  ),
          ),
          SizedBox(height: isMobile ? 40 : 70),
          isMobile
              ? Column(children: testimonialCards.whereType<Widget>().toList())
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 40),
                  child: Row(children: testimonialCards),
                ),
          SizedBox(height: isMobile ? 40 : 50),
          Container(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF3B82F6).withValues(alpha: 0.05),
                  const Color(0xFF8B5CF6).withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.security_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: isMobile ? 12 : 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HIPAA Compliant & FDA Approved',
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Our medical alert systems meet the highest standards for healthcare technology and patient data protection.',
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 13 : 14,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
