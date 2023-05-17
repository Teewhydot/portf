import 'package:flutter/material.dart';
import 'package:portf/teewhydot/domain/theme/app_decoration.dart';
import 'package:portf/teewhydot/domain/theme/app_style.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';
import 'package:portf/teewhydot/domain/utils/space_utils.dart';


class ServicesWidget extends StatelessWidget {
  const ServicesWidget(
      {super.key, required this.serviceName, required this.serviceImage});
  final String serviceName;
  final String serviceImage;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: getHorizontalSize(309),
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
                                padding: getPadding(top: 1, right: 5),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: const EdgeInsets.all(0),
                                          color: ColorConstant.deepOrange40001,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(40))),
                                          child: Container(
                                              height: getSize(80),
                                              width: getSize(80),
                                              padding: getPadding(
                                                  left: 24,
                                                  top: 26,
                                                  right: 24,
                                                  bottom: 26),
                                              decoration: AppDecoration
                                                  .fillDeeporange40001
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .circleBorder40),
                                              child: Stack(children: [
                                                Image.asset(serviceImage,
                                                    height: getSize(28),
                                                    width: getSize(28),
                                                    fit: BoxFit.cover),
                                              ]))),
                                      addHorizontalSpacing(10),
                                      Padding(
                                          padding:
                                              getPadding(top: 28, bottom: 26),
                                          child: Text(serviceName,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtH4Gray900))
                                    ])),
                          ]))),
            ])));
  }
}
