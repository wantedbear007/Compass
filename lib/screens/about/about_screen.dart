import 'package:compass/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About $appName"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Compass Supervision is an innovative mobile and web application designed to streamline medical inventory management. It automates the tracking of medication expiry dates, provides real-time notifications, and verifies product authenticity through barcode scanning, ensuring efficient and safe medication handling in healthcare settings.",
                  textAlign: TextAlign.justify,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Application Development",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    _launchURL(Uri.parse(github));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.people),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "prataptechnologies & team",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Open Source Licences",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: libraries.length,
                itemBuilder: (context, index) {
                  final library = libraries[index];
                  return ListTile(
                    leading: const Icon(Icons.code),
                    title: Text(
                      '${library.name} (${library.version}) ',
                      style: const TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      "License: ${library.license}",
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                    onTap: () {
                      _launchURL(Uri.parse(library.link));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
