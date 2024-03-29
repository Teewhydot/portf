// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portf/teewhydot/domain/utils/social_media_util.dart';

class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final SocialMediaUtil socialMediaUtil = SocialMediaUtil();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SmItem(
          FontAwesomeIcons.facebook,
          () {
            socialMediaUtil.launchURL(
                'https://web.facebook.com/heesah?sk=wall&notif_id=1664494916583737&notif_t=wall&ref=notif',
                context);
          },
        ),
        SmItem(FontAwesomeIcons.twitter, () {
          socialMediaUtil.launchURL('https://twitter.com/tee_of_gui', context);
        }),
        SmItem(
          FontAwesomeIcons.linkedin,
          () {
            socialMediaUtil.launchURL(
                'https://www.linkedin.com/in/issa-abubakar-a0a200189/',
                context);
          },
        ),
        SmItem(
          FontAwesomeIcons.github,
          () {
            socialMediaUtil.launchURL('https://github.com/Teewhydot', context);
          },
        ),
      ],
    );
  }
}

class SmItem extends StatelessWidget {
  final icon;
  final onTap;

  const SmItem(this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
