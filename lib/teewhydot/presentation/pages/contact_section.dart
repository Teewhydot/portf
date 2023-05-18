import 'package:flutter/material.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/contact_form.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/social_media_container.dart';


class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

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
          Text(
            "Contact me".toUpperCase(),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style:
                AppStyle.txtH5.copyWith(letterSpacing: getHorizontalSize(3.0)),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 0,
                  backgroundColor: ColorConstant.deepOrange400,
                  child: Icon(
                    Icons.email,
                    color: ColorConstant.whiteA700,
                  ),
                ),
                title: Text(
                  'tchipsical@gmail.com'.toUpperCase(),
                  style: AppStyle.txtH4WhiteA700.copyWith(fontSize: 15),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: CircleAvatar(
                  radius: 0,
                  backgroundColor: ColorConstant.deepOrange400,
                  child: Icon(
                    Icons.phone,
                    color: ColorConstant.whiteA700,
                  ),
                ),
                title: Text(
                  '+234 806 878 7087'.toUpperCase(),
                  style: AppStyle.txtH4WhiteA700.copyWith(fontSize: 15),
                ),
              ),
              const SizedBox(height: 150),
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
              const SocialMediaContainer(),

              const SizedBox(height: 250),
            ],
          )
        ],
      ),
    );
  }
}
