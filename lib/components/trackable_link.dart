import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackableLink extends StatelessWidget {
  final String url;
  final String text;
  final String? trackingName;
  final Map<String, dynamic>? trackingData;
  final TextStyle? style;

  const TrackableLink({
    Key? key,
    required this.url,
    required this.text,
    this.trackingName,
    this.trackingData,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
      child: Text(
        text,
        style: style ??
            const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
