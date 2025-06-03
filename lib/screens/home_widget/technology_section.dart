import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/Colors/app_colors.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';

class TechnologySection extends StatefulWidget {
  const TechnologySection({super.key});

  @override
  State<TechnologySection> createState() => _TechnologySectionState();
}

class _TechnologySectionState extends State<TechnologySection> {
  Widget _buildTechFeature(
      String label, String description, IconData icon, BuildContext context) {
    // Responsive sizing
    double iconSize = ResponsiveHandler.isMobile(context) ? 16 : 20;
    double iconContainerSize = ResponsiveHandler.isMobile(context) ? 32 : 40;
    double titleFontSize = ResponsiveHandler.isMobile(context) ? 14 : 16;
    double descriptionFontSize = ResponsiveHandler.isMobile(context) ? 12 : 13;
    double padding = ResponsiveHandler.isMobile(context) ? 16 : 20;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: iconContainerSize,
            height: iconContainerSize,
            decoration: BoxDecoration(
              color: AppColors.callToActionColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppColors.whiteColor,
              size: iconSize,
            ),
          ),
          SizedBox(height: ResponsiveHandler.isMobile(context) ? 8 : 12),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: titleFontSize,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: descriptionFontSize,
              color: AppColors.callToActionColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(String number, String label, BuildContext context) {
    // Responsive sizing
    double numberFontSize = ResponsiveHandler.isMobile(context) ? 24 : 32;
    double labelFontSize = ResponsiveHandler.isMobile(context) ? 12 : 14;
    double padding = ResponsiveHandler.isMobile(context) ? 16 : 24;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: GoogleFonts.inter(
              fontSize: numberFontSize,
              fontWeight: FontWeight.w800,
              color: AppColors.callToActionColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: labelFontSize,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceVisualization(BuildContext context) {
    // Responsive sizing for the device visualization
    double containerHeight = ResponsiveHandler.isMobile(context) ? 200 : 280;
    double centralIconSize = ResponsiveHandler.isMobile(context) ? 35 : 50;
    double centralContainerSize =
        ResponsiveHandler.isMobile(context) ? 70 : 100;

    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.callToActionColor.withValues(alpha: 0.1),
            AppColors.mainColor.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Stack(
        children: [
          if (!ResponsiveHandler.isMobile(context)) ...[
            // Show all positioned elements on larger screens
            Positioned(
              top: 40,
              left: 40,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.smartphone_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              top: 60,
              right: 60,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.watch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 80,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF06B6D4), Color(0xFF0891B2)],
                  ),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(
                  Icons.cloud_sync_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ] else ...[
            // Simplified layout for mobile - show fewer elements
            Positioned(
              top: 30,
              left: 30,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.smartphone_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED)],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.watch_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
          Center(
            child: Container(
              width: centralContainerSize,
              height: centralContainerSize,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF10B981), Color(0xFF059669)],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF10B981).withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.favorite_rounded,
                color: Colors.white,
                size: centralIconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Responsive padding and spacing
    double horizontalPadding = ResponsiveHandler.isMobile(context) ? 16 : 24;
    double verticalPadding = ResponsiveHandler.isMobile(context) ? 60 : 100;
    double titleFontSize = ResponsiveHandler.isMobile(context) ? 28 : 42;
    double descriptionFontSize = ResponsiveHandler.isMobile(context) ? 14 : 16;
    double badgeFontSize = ResponsiveHandler.isMobile(context) ? 10 : 11;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.backgroundColor,
            AppColors.whiteColor,
          ],
        ),
      ),
      child: SizedBox(
        width: ResponsiveHandler.getWidth(context),
        child: Column(
          children: [
            // Main content section - responsive layout
            if (ResponsiveHandler.isDesktop(context))
              // Desktop: Side by side layout
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: _buildLeftContent(context, titleFontSize,
                        descriptionFontSize, badgeFontSize),
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                    flex: 4,
                    child: _buildRightContent(context),
                  ),
                ],
              )
            else
              // Mobile/Tablet: Stacked layout
              Column(
                children: [
                  _buildLeftContent(context, titleFontSize, descriptionFontSize,
                      badgeFontSize),
                  SizedBox(
                      height: ResponsiveHandler.isMobile(context) ? 40 : 60),
                  _buildRightContent(context),
                ],
              ),

            SizedBox(height: ResponsiveHandler.isMobile(context) ? 40 : 60),

            // Bottom features section - responsive grid
            _buildBottomFeatures(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftContent(BuildContext context, double titleFontSize,
      double descriptionFontSize, double badgeFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF3B82F6).withValues(alpha: 0.2),
                const Color(0xFF1D4ED8).withValues(alpha: 0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            'ADVANCED TECHNOLOGY',
            style: GoogleFonts.inter(
              fontSize: badgeFontSize,
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(height: ResponsiveHandler.isMobile(context) ? 20 : 28),
        Text(
          ResponsiveHandler.isMobile(context)
              ? 'Intelligent Health Monitoring System'
              : 'Intelligent Health\nMonitoring System',
          style: GoogleFonts.inter(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w800,
            color: AppColors.blackColor,
            height: 1.1,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: ResponsiveHandler.isMobile(context) ? 16 : 20),
        Text(
          'Our cutting-edge LifeLine System combines AI-powered monitoring, real-time health analytics, and seamless connectivity to deliver comprehensive protection for you and your loved ones.',
          style: GoogleFonts.inter(
            fontSize: descriptionFontSize,
            color: AppColors.blackColor,
            height: 1.6,
          ),
        ),
        SizedBox(height: ResponsiveHandler.isMobile(context) ? 30 : 40),

        // Stats cards - responsive layout
        if (ResponsiveHandler.isMobile(context))
          // Mobile: Stacked stats
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: _buildStatsCard(
                          '99.9%', 'Uptime\nReliability', context)),
                  const SizedBox(width: 12),
                  Expanded(
                      child: _buildStatsCard(
                          '<30s', 'Emergency\nResponse', context)),
                ],
              ),
              const SizedBox(height: 12),
              _buildStatsCard('24/7', 'Monitoring Center', context),
            ],
          )
        else
          // Desktop/Tablet: Row layout
          Row(
            children: [
              Expanded(
                  child:
                      _buildStatsCard('99.9%', 'Uptime\nReliability', context)),
              const SizedBox(width: 16),
              Expanded(
                  child:
                      _buildStatsCard('<30s', 'Emergency\nResponse', context)),
              const SizedBox(width: 16),
              Expanded(
                  child:
                      _buildStatsCard('24/7', 'Monitoring\nCenter', context)),
            ],
          ),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context) {
    return Column(
      children: [
        _buildDeviceVisualization(context),
        SizedBox(height: ResponsiveHandler.isMobile(context) ? 16 : 24),
        Row(
          children: [
            Expanded(
              child: _buildTechFeature(
                'Cross-Platform',
                'iOS & Android compatible',
                Icons.devices_rounded,
                context,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildTechFeature(
                'AI Analytics',
                'Predictive health insights',
                Icons.psychology_rounded,
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomFeatures(BuildContext context) {
    List<Map<String, dynamic>> features = [
      {
        'title': 'Real-Time Monitoring',
        'description': 'Continuous health data tracking with instant alerts',
        'icon': Icons.monitor_heart_rounded,
      },
      {
        'title': 'Secure Cloud Storage',
        'description': 'HIPAA-compliant data protection and backup',
        'icon': Icons.security_rounded,
      },
      {
        'title': 'Family Integration',
        'description': 'Connect with loved ones and caregivers',
        'icon': Icons.family_restroom_rounded,
      },
      {
        'title': 'Emergency Response',
        'description': 'Instant connection to medical professionals',
        'icon': Icons.emergency_rounded,
      },
    ];

    if (ResponsiveHandler.isMobile(context)) {
      // Mobile: 2x2 grid
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTechFeature(
                  features[0]['title'],
                  features[0]['description'],
                  features[0]['icon'],
                  context,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTechFeature(
                  features[1]['title'],
                  features[1]['description'],
                  features[1]['icon'],
                  context,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildTechFeature(
                  features[2]['title'],
                  features[2]['description'],
                  features[2]['icon'],
                  context,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTechFeature(
                  features[3]['title'],
                  features[3]['description'],
                  features[3]['icon'],
                  context,
                ),
              ),
            ],
          ),
        ],
      );
    } else if (ResponsiveHandler.isTablet(context)) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTechFeature(
                  features[0]['title'],
                  features[0]['description'],
                  features[0]['icon'],
                  context,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTechFeature(
                  features[1]['title'],
                  features[1]['description'],
                  features[1]['icon'],
                  context,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTechFeature(
                  features[2]['title'],
                  features[2]['description'],
                  features[2]['icon'],
                  context,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTechFeature(
                  features[3]['title'],
                  features[3]['description'],
                  features[3]['icon'],
                  context,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      // Desktop: Single row
      return Row(
        children: features.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> feature = entry.value;
          return Expanded(
            child: Row(
              children: [
                if (index > 0) const SizedBox(width: 20),
                Expanded(
                  child: _buildTechFeature(
                    feature['title'],
                    feature['description'],
                    feature['icon'],
                    context,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    }
  }
}
