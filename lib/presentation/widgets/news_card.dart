import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;
  final String url;
  final String source;

  const NewsCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.url,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Get.theme.useMaterial3 ? 10 : 4)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: true,
                ),
                const SizedBox(height: 8),
                Text(
                  'Published by $source on ${Jiffy.parse(publishedAt).yMMMEd}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () async {
                    final Uri articleLink = Uri.parse(url);
                    log("$articleLink");
                    if (!await launchUrl(articleLink)) {
                      throw Exception('Could not launch $articleLink');
                    }
                  },
                  child: const Text('Read More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
