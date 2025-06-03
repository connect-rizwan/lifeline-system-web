import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            _buildHeroSection(),
            _buildProductsGrid(),
            _buildFeaturesSection(),
            _buildFAQSection(),
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
            'Our Products',
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Choose the perfect medical alert system for your needs',
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

  Widget _buildProductsGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProductCard(
                image: 'assets/images/products/dark-elegant.jpg',
                title: 'Dark Elegant',
                description: 'Sleek and sophisticated medical alert bracelet',
                price: '\$199.99',
                features: [
                  '24/7 Emergency Response',
                  'GPS Location Tracking',
                  'Water Resistant',
                  'Long Battery Life',
                  'Fall Detection',
                ],
              ),
              _buildProductCard(
                image: 'assets/images/products/playful-red.jpg',
                title: 'Playful Red',
                description: 'Vibrant and stylish medical alert bracelet',
                price: '\$179.99',
                features: [
                  '24/7 Emergency Response',
                  'GPS Location Tracking',
                  'Water Resistant',
                  'Long Battery Life',
                  'Fall Detection',
                ],
              ),
              _buildProductCard(
                image: 'assets/images/products/sticky-tag.jpg',
                title: 'Sticky Tag',
                description: 'Discreet and versatile medical alert tag',
                price: '\$149.99',
                features: [
                  '24/7 Emergency Response',
                  'GPS Location Tracking',
                  'Water Resistant',
                  'Long Battery Life',
                  'Fall Detection',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String title,
    required String description,
    required String price,
    required List<String> features,
  }) {
    return Container(
      width: 350,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  price,
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2563EB),
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),
                ...features.map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFF2563EB),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            feature,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF4B5563),
                            ),
                          ),
                        ],
                      ),
                    )),
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
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      color: const Color(0xFFF9FAFB),
      child: Column(
        children: [
          Text(
            'Why Choose Our Products?',
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
                icon: Icons.security,
                title: 'Reliable Safety',
                description:
                    'Our medical alert systems are designed with your safety in mind, providing reliable protection 24/7.',
              ),
              _buildFeatureCard(
                icon: Icons.phone_android,
                title: 'Easy to Use',
                description:
                    'Simple and intuitive design makes our products accessible to users of all ages.',
              ),
              _buildFeatureCard(
                icon: Icons.support_agent,
                title: '24/7 Support',
                description:
                    'Our dedicated support team is always ready to assist you with any questions or concerns.',
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

  Widget _buildFAQSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'Frequently Asked Questions',
            style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 64),
          Column(
            children: [
              _buildFAQItem(
                question: 'How does the medical alert system work?',
                answer:
                    'Our medical alert systems connect you to our 24/7 monitoring center with the press of a button. When activated, our trained professionals will assess your situation and dispatch appropriate help.',
              ),
              _buildFAQItem(
                question: 'What is the battery life of the devices?',
                answer:
                    'Our devices typically last 5-7 days on a single charge, depending on usage. The system will notify you when the battery is low.',
              ),
              _buildFAQItem(
                question: 'Is the system waterproof?',
                answer:
                    'Yes, all our devices are water-resistant and can be worn while showering or swimming.',
              ),
              _buildFAQItem(
                question: 'How do I set up my medical alert system?',
                answer:
                    'Setting up is simple! Just charge your device, download our app, and follow the step-by-step instructions. Our support team is available to help if needed.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem({
    required String question,
    required String answer,
  }) {
    return Container(
      width: 800,
      margin: const EdgeInsets.only(bottom: 24),
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
      child: ExpansionTile(
        title: Text(
          question,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Text(
              answer,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF4B5563),
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
