import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portf/teewhydot/domain/theme/app_decoration.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';


class ServicesWidget extends StatelessWidget {
  const ServicesWidget(
      {super.key, required this.serviceName, required this.serviceIcon});
  final String serviceName;
  final FaIcon serviceIcon;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: getHorizontalSize(250),
            margin: getMargin(top: 39),
            child: Column(children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration: AppDecoration.outlineDeepOrange,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: getPadding(top: 1, right: 5,left: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    Icon(serviceIcon.icon,
                                            color: ColorConstant
                                                .deepOrange400 ,
                                            size: getSize(25)),
                                      addHorizontalSpacing(10),
                                      Padding(
                                          padding:
                                              getPadding(top: 28, bottom: 26),
                                          child: Text(serviceName,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: AppStyle.txtH4Gray900))
                                    ])),
                          ]))),
            ])));
  }
}
