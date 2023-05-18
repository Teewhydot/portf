import 'package:flutter/material.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';

import '../widgets/reused_widgets/portfolio_slider.dart';


class PortfolioSection extends StatelessWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.maxFinite,
            child: Container(
                width: double.maxFinite,
                margin: getMargin(top: 34),
                padding: getPadding(left: 22, top: 60, right: 21, bottom: 60),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Portfolio".toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtH5
                              .copyWith(letterSpacing: getHorizontalSize(3.0))),
                      CustomButton(
                          height: getVerticalSize(48),
                          width: getHorizontalSize(270),
                          text: "Click on any card to view the project"
                              .toUpperCase(),
                          margin: getMargin(top: 42, bottom: 42),
                          variant: ButtonVariant.OutlineWhiteA7004b),
                      addVerticalSpacing(20),
                      const PortfolioSlider(),
                    ]))),
      ],
    );
  }
}
