// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';

import '../widgets/reused_widgets/portfolio_slider.dart';


class PortfolioSection extends StatelessWidget {
 Effect effect;
PortfolioSection({super.key, required this.effect});
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: AnimateList(
                    autoPlay: true,
                    interval:
                    const Duration(milliseconds: 199),
                    effects: [
                      const FadeEffect(
                        duration: Duration(milliseconds: 199),
                        curve: Curves.easeIn,
                      ),
                      effect,
                    ],
                    children: [
                      Text("Portfolio".toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtH5
                              .copyWith(letterSpacing: getHorizontalSize(3.0))),
                      CustomButton(
                          height: getVerticalSize(38),
                          width: getHorizontalSize(170),
                          text: ""
                              .toUpperCase(),
                          margin: getMargin(top: 42, bottom: 42),
                          variant: ButtonVariant.OutlineWhiteA7004b),
                      addVerticalSpacing(20),
                      const PortfolioSlider(),
                    ],
                  ),
                ))),
      ],
    );
  }
}
