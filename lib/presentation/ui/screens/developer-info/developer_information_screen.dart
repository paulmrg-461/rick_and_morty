import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rick_and_morty/presentation/ui/screens/developer-info/widgets/social_buttons.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperInformationScreen extends StatelessWidget {
  const DeveloperInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAssetImage(
                  path: 'assets/icons/rick-and-morty.png', height: 125),
              _titleText('Rick & Morty App'),
              FutureBuilder(
                  future: getAppVersion(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Version: ${snapshot.data}');
                    }

                    return const CircularProgressIndicator.adaptive();
                  }),
              const SizedBox(
                height: 26,
              ),
              _titleText('Rick & Morty API'),
              const LinkText(url: 'https://rickandmortyapi.com'),
              const SizedBox(
                height: 26,
              ),
              _titleText('Github repository'),
              const LinkText(
                  url: 'https://github.com/paulmrg-461/rick_and_morty'),
              const SizedBox(
                height: 26,
              ),
              _titleText('Developer information'),
              const Text('Paul Realpe'),
              const LinkText(url: 'https://devpaul.co'),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 116,
                child:
                    const Image(image: AssetImage('assets/images/DevPaul.png')),
              ),
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Text _titleText(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    );
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}

class LinkText extends StatelessWidget {
  final String url;
  const LinkText({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
          throw "Could not launch $url";
        },
        child: Text(
          url,
          style: TextStyle(
              color: colors.primary, decoration: TextDecoration.underline),
        ));
  }
}
