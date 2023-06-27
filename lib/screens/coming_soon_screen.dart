import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/background_widget.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const CustomBackground(
              assetImage: 'assets/backgrounds/coming_soon.jpg',
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(60.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Coming Soon',
                          style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          'This page is under construction.',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TimerCountdown(
                          format: CountDownTimerFormat.daysHoursMinutesSeconds,
                          endTime: DateTime(2023, 7, 25),
                          colonsTextStyle: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          timeTextStyle: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          descriptionTextStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.linkedinIn,
                            color: Colors.white),
                        onPressed: () {
                          const url =
                              'https://www.linkedin.com/in/mehmet-can-kaya-b34419240/'; // LinkedIn URL
                          _launchURL(url);
                        },
                      ),
                      const SizedBox(width: 20.0),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.github,
                            color: Colors.white),
                        onPressed: () {
                          const url =
                              'https://github.com/MehmetJank'; // GitHub URL
                          _launchURL(url);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri urlLocal = Uri.parse(url);
    if (!await launchUrl(urlLocal)) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
