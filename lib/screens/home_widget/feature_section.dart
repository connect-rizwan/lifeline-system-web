import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';
import 'package:lifeline_system_website/screens/home_widget/section_header.dart';

class FeatureSection extends StatefulWidget {
  const FeatureSection({super.key});

  @override
  State<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  Widget _buildProfessionalFeatureCard({
    required Color primaryColor,
    required Color secondaryColor,
    required IconData icon,
    required String title,
    required String description,
    required int delay,
  }) {
    final isMobile = ResponsiveHandler.isMobile(context);
    final isTablet = ResponsiveHandler.isTablet(context);

    return Container(
      padding: EdgeInsets.all(isMobile
          ? 16
          : isTablet
              ? 20
              : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isMobile ? 0.06 : 0.08),
            blurRadius: isMobile ? 12 : 20,
            offset: Offset(0, isMobile ? 4 : 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: isMobile
                ? 44
                : isTablet
                    ? 50
                    : 56,
            height: isMobile
                ? 44
                : isTablet
                    ? 50
                    : 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
            ),
            child: Icon(
              icon,
              size: isMobile
                  ? 22
                  : isTablet
                      ? 25
                      : 28,
              color: Colors.white,
            ),
          ),
          SizedBox(
              height: isMobile
                  ? 12
                  : isTablet
                      ? 16
                      : 20),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: isMobile
                  ? 14
                  : isTablet
                      ? 16
                      : 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isMobile ? 4 : 8),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: isMobile
                  ? 11
                  : isTablet
                      ? 12
                      : 14,
              color: const Color(0xFF6B7280),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
            maxLines: isMobile ? 3 : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount() {
    if (ResponsiveHandler.isMobile(context)) {
      // Very small mobile screens
      if (MediaQuery.of(context).size.width < 400) {
        return 1;
      }
      // Regular mobile screens
      return 2;
    } else if (ResponsiveHandler.isTablet(context)) {
      return 3;
    } else {
      // Desktop
      return 4;
    }
  }

  double _getChildAspectRatio() {
    if (ResponsiveHandler.isMobile(context)) {
      if (MediaQuery.of(context).size.width < 400) {
        return 2;
      }
      return 1.1;
    } else if (ResponsiveHandler.isTablet(context)) {
      return 1.0;
    } else {
      return 0.9;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHandler.isMobile(context);
    final isTablet = ResponsiveHandler.isTablet(context);
    final containerWidth = ResponsiveHandler.getWidth(context);

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Container(
          width: containerWidth,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: isMobile
                ? 40
                : isTablet
                    ? 60
                    : 80,
          ),
          child: Column(
            children: [
              const SectionHeader(
                title: 'Advanced Protection Technology',
                subtitle:
                    'Experience comprehensive safety solutions with our professional-grade features.',
              ),
              SizedBox(
                  height: isMobile
                      ? 32
                      : isTablet
                          ? 48
                          : 60),

              // Responsive grid layout
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: _getCrossAxisCount(),
                    mainAxisSpacing: isMobile
                        ? 16
                        : isTablet
                            ? 20
                            : 24,
                    crossAxisSpacing: isMobile
                        ? 16
                        : isTablet
                            ? 20
                            : 24,
                    childAspectRatio: _getChildAspectRatio(),
                    children: [
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFF2563EB),
                        secondaryColor: const Color(0xFF1D4ED8),
                        icon: Icons.shield_rounded,
                        title: 'AI Monitoring',
                        description:
                            'Intelligent threat detection and analysis',
                        delay: 0,
                      ),
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFF059669),
                        secondaryColor: const Color(0xFF047857),
                        icon: Icons.my_location_rounded,
                        title: 'Precision GPS',
                        description: 'Real-time location with meter accuracy',
                        delay: 100,
                      ),
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFF7C3AED),
                        secondaryColor: const Color(0xFF6D28D9),
                        icon: Icons.health_and_safety_rounded,
                        title: 'Health Integration',
                        description: 'Seamless device synchronization',
                        delay: 200,
                      ),
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFFDC2626),
                        secondaryColor: const Color(0xFFB91C1C),
                        icon: Icons.emergency_rounded,
                        title: 'Emergency Alert',
                        description: 'Instant response coordination',
                        delay: 300,
                      ),
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFF9333EA),
                        secondaryColor: const Color(0xFF7C3AED),
                        icon: Icons.cloud_sync_rounded,
                        title: 'Cloud Backup',
                        description: 'Secure data synchronization',
                        delay: 400,
                      ),
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFF0891B2),
                        secondaryColor: const Color(0xFF0E7490),
                        icon: Icons.analytics_rounded,
                        title: 'Smart Analytics',
                        description: 'Detailed insights and reporting',
                        delay: 500,
                      ),
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFFEA580C),
                        secondaryColor: const Color(0xFFDC2626),
                        icon: Icons.family_restroom_rounded,
                        title: 'Family Network',
                        description: 'Connected family safety hub',
                        delay: 600,
                      ),
                      _buildProfessionalFeatureCard(
                        primaryColor: const Color(0xFF0F766E),
                        secondaryColor: const Color(0xFF115E59),
                        icon: Icons.security_rounded,
                        title: '24/7 Monitoring',
                        description: 'Round-the-clock protection',
                        delay: 700,
                      ),
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
}
