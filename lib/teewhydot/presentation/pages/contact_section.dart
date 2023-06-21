import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/contact_form.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/social_media_container.dart';


class ContactSection extends StatefulWidget {
final Effect effect;
const ContactSection({super.key,  required this.effect});
  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 32, right: 32),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: AnimateList(
              autoPlay: true,
              interval: const Duration(milliseconds: 199),
              effects: [
                const FadeEffect(
                  duration: Duration(milliseconds: 199),
                  curve: Curves.easeIn,
                ),
                widget.effect,
              ],
              children: [
                Column(
                  children: [
                    Text(
                      "send me an email".toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                      AppStyle.txtH5.copyWith(letterSpacing: getHorizontalSize(3.0)),
                    ),
                    const ContactFormWidget(),
                    const SizedBox(height: 90),
                    Text(
                      "follow me".toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                      AppStyle.txtH5.copyWith(letterSpacing: getHorizontalSize(3.0)),
                    ),
                    const SizedBox(height: 50),
                    const SocialMediaContainer(),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
