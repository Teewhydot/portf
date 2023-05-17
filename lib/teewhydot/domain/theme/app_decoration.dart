import 'package:flutter/material.dart';
import 'package:portf/teewhydot/domain/theme/color_constant.dart';
import 'package:portf/teewhydot/domain/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get outlineDeepOrange => BoxDecoration(
        color: ColorConstant.red50,
        borderRadius: BorderRadiusStyle.circleBorder40,
        border: Border.all(
          color: ColorConstant.deepOrange100,
          width: getHorizontalSize(
            5,
          ),
        ),
      );
  static BoxDecoration get outlineBluegray80001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blueGray80001,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillDeeporange50 => BoxDecoration(
        color: ColorConstant.deepOrange50,
      );
  static BoxDecoration get fillBluegray100 => BoxDecoration(
        color: ColorConstant.blueGray100,
      );
  static BoxDecoration get outlineBluegray800 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blueGray800,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillGray90077 => BoxDecoration(
        color: ColorConstant.gray90077,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillBluegray900 => BoxDecoration(
        color: ColorConstant.scaffoldColorOne,
      );
  static BoxDecoration get outlineDeeporange1003 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.deepOrange100,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineDeeporange1002 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.deepOrange100,
          width: getHorizontalSize(
            1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray9000a,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: const Offset(
              0,
              32,
            ),
          ),
        ],
      );
  static BoxDecoration get fillDeeporange40001 => BoxDecoration(
        color: ColorConstant.deepOrange40001,
      );
  static BoxDecoration get fillRed50 => BoxDecoration(
        color: ColorConstant.red50,
      );
  static BoxDecoration get outlineDeeporange100 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.deepOrange100,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineGray9000a => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray9000a,
            spreadRadius: getHorizontalSize(
              2,
            ),
            blurRadius: getHorizontalSize(
              2,
            ),
            offset: const Offset(
              0,
              32,
            ),
          ),
        ],
      );
  static BoxDecoration get fillGray400 => BoxDecoration(
        color: ColorConstant.gray400,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder56 = BorderRadius.circular(
    getHorizontalSize(
      56,
    ),
  );

  static BorderRadius roundedBorder6 = BorderRadius.circular(
    getHorizontalSize(
      6,
    ),
  );

  static BorderRadius circleBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40,
    ),
  );

  static BorderRadius customBorderBL6 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
  );

  static BorderRadius customBorderTL6 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
  );

  static BorderRadius customBorderTR6 = BorderRadius.only(
    topRight: Radius.circular(
      getHorizontalSize(
        6,
      ),
    ),
  );
}
