import 'package:flutter/material.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';


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
          Align(
              alignment: Alignment.center,
              child: Text(
                  "about myself".toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtH5.copyWith(
                      letterSpacing:
                      getHorizontalSize(3.0)))),
          const SizedBox(height: 32),
         Container(
           height: 200,
           width: 170,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage(photoUrl),
               fit: BoxFit.cover,
             ),
             borderRadius: BorderRadius.circular(10),
           ),
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
          addVerticalSpacing(38),
          CustomButton(
            width: getHorizontalSize(209),
            height: getSize(55),
            text: 'Download CV',
            prefixWidget:  Icon(Icons.download,
            color: ColorConstant.whiteA700,
            ),
            onTap: () {},
          ),
          addVerticalSpacing(98),
          EducationalHistoryWidget( whatHistory: 'Educational History', educationList: educationList),
          addVerticalSpacing(50),
          EducationalHistoryWidget( whatHistory: 'Coding History', educationList: codingHistoryList),

        ],
      ),
    );
  }
}


class EducationalHistoryWidget extends StatelessWidget {
  final List<Education> educationList;
  final String whatHistory;

  const EducationalHistoryWidget({super.key, required this.educationList,required this.whatHistory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          whatHistory.toUpperCase(),
        style: AppStyle.txtH5
            .copyWith(letterSpacing: getHorizontalSize(3.0),fontSize: 18,fontWeight: FontWeight.normal)
        ),
        const SizedBox(height: 10),
        ListView.builder(
physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: educationList.length,
          itemBuilder: (context, index) {
            Education education = educationList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(
                  education.institution.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorConstant.whiteA700,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education.degree,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: ColorConstant.whiteA700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      education.duration,
                        style: AppStyle.txtH5
                            .copyWith(letterSpacing: getHorizontalSize(3.0),fontSize: 14,fontWeight: FontWeight.normal)
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class Education {
  final String institution;
  final String degree;
  final String duration;

  const Education({
    required this.institution,
    required this.degree,
    required this.duration,
  });
}

List<Education> educationList = [
  const Education(
    institution: 'Federal University of Technology, Minna',
    degree: 'Bachelor of Science in Civil Engineering',
    duration: '2016 - 2023',
  ),
  const Education(
    institution: 'Dalex Royal College, Ilorin',
    degree: 'Senior Secondary School Certificate',
    duration: '2016 - 2018',
  ),
];


List<Education> codingHistoryList = [
  const Education(
    institution: 'Federal University of Technology, Minna',
    degree: 'C and C++',
    duration: '2016 - 2023',
  ),
  const Education(
    institution: 'Udemy',
    degree: 'Flutter Development',
    duration: '2016 - 2018',
  ),
  const Education(
    institution: 'Udemy',
    degree: 'Blockchain Development',
    duration: '2016 - 2018',
  ),
];
