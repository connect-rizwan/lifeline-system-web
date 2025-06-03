import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';

class TrustPartnersSection extends StatefulWidget {
  const TrustPartnersSection({super.key});

  @override
  State<TrustPartnersSection> createState() => _TrustPartnersSectionState();
}

class _TrustPartnersSectionState extends State<TrustPartnersSection> {
  final ScrollController _scrollController = ScrollController();
  late Timer _autoScrollTimer;

  final List<String> partnerNames = [
    'Mayo Clinic',
    'Johns Hopkins',
    'Cleveland Clinic',
    'Kaiser Permanente',
    'Mount Sinai',
    'UCLA Health',
    'Mass General',
    'Cedars-Sinai',
    'Stanford Health',
    'NYU Langone',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;
        final isMobile = ResponsiveHandler.isMobile(context);
        double scrollAmount = isMobile ? 150 : 200;
        double nextScroll = currentScroll + scrollAmount;

        if (nextScroll >= maxScroll) {
          nextScroll = 0;
        }

        _scrollController.animateTo(
          nextScroll,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildTrustLogo(String name) {
    final isMobile = ResponsiveHandler.isMobile(context);
    final isTablet = ResponsiveHandler.isTablet(context);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 6
            : isTablet
                ? 8
                : 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 12
            : isTablet
                ? 16
                : 20,
        vertical: isMobile
            ? 10
            : isTablet
                ? 12
                : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isMobile ? 8 : 12),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1A000000),
            blurRadius: isMobile ? 4 : 6,
            offset: Offset(0, isMobile ? 1 : 2),
          ),
        ],
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Text(
        name,
        style: GoogleFonts.inter(
          fontSize: isMobile
              ? 12
              : isTablet
                  ? 14
                  : 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF334155),
        ),
      ),
    );
  }

  Widget _buildMobileGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: partnerNames.length,
      itemBuilder: (context, index) {
        return _buildTrustLogo(partnerNames[index]);
      },
    );
  }

  Widget _buildScrollingRow() {
    final isMobile = ResponsiveHandler.isMobile(context);

    return SizedBox(
      height: isMobile ? 50 : 70,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...partnerNames.map(_buildTrustLogo).toList(),
            ...partnerNames.map(_buildTrustLogo).toList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHandler.isMobile(context);
    final isTablet = ResponsiveHandler.isTablet(context);
    final containerWidth = ResponsiveHandler.getWidth(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFFAFAFA),
      child: Center(
        child: Container(
          width: containerWidth,
          padding: EdgeInsets.symmetric(
            vertical: isMobile
                ? 40
                : isTablet
                    ? 60
                    : 80,
            horizontal: isMobile ? 16 : 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Trusted by Leading Healthcare Organizations',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile
                      ? 14
                      : isTablet
                          ? 16
                          : 18,
                  color: const Color(0xFF475569),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                  height: isMobile
                      ? 24
                      : isTablet
                          ? 32
                          : 40),
              if (ResponsiveHandler.isMobile(context) &&
                  MediaQuery.of(context).size.width < 600)
                _buildMobileGrid()
              else
                _buildScrollingRow(),
              if (ResponsiveHandler.isMobile(context) &&
                  MediaQuery.of(context).size.width >= 600) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF94A3B8),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFFCBD5E1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFFCBD5E1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
