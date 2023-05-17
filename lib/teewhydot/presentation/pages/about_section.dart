import 'package:flutter/material.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';


class AboutSection extends StatelessWidget {
  final String name;
  final String photoUrl;
  final List<String> techStack;

  const AboutSection({
    Key? key,
    required this.name,
    required this.photoUrl,
    required this.techStack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 32, right: 32, top: 32, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          const CircleAvatar(
            radius: 55,
          ),
          addVerticalSpacing(15),
          Text(
            name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: ColorConstant.whiteA700,
            ),
          ),
          addVerticalSpacing(8),
          Wrap(
            spacing: 8,
            children: techStack
                .map(
                  (tech) => Chip(
                    label: Text(tech),
                    backgroundColor: ColorConstant.whiteA700,
                  ),
                )
                .toList(),
          ),
          addVerticalSpacing(20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis quis enim sit amet magna dignissim auctor. Integer maximus ultrices arcu, in mollis neque varius at. Aliquam sed fringilla velit. Duis ut mauris et risus fermentum finibus. Nunc id blandit nisi. Nullam eu ipsum vitae arcu volutpat euismod.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.whiteA700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
