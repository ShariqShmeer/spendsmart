import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'images.dart';

class AppIcons {
  static const String incomeIcon = 'assets/icons/income_icon.png';
  static const String expenseIcon = 'assets/icons/expense_icon.png';
  static const String travelIcon = 'assets/icons/svg/travelling.svg';
  static const String carIcon = 'assets/icons/svg/car.svg';
  static const String carOldIcon = 'assets/icons/svg/car-old.svg';
  static const String carFront2Icon = 'assets/icons/svg/car-front2.svg';
  static const String carFrontIcon = 'assets/icons/svg/car-front.svg';
  static const String carWashingIcon = 'assets/icons/svg/car-washing.svg';
  static const String house1Icon = 'assets/icons/svg/house-1.svg';
  static const String house2Icon = 'assets/icons/svg/house-2.svg';
  static const String house3Icon = 'assets/icons/svg/house-3.svg';
  static const String pillsIcon = 'assets/icons/svg/pills.svg';

  static CustomIcons getIconById({required String iconId}) {
    return _icons.firstWhereOrNull((icon) => iconId == icon.id) ??
        DefaultIcons(
          id: Icons.broken_image.codePoint.toString(),
          type: CustomIconsType.iconData,
          iconData: Icons.broken_image,
        );
  }

  static final List<CustomIcons> _icons = [
    DefaultIcons(
      id: Icons.savings_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.savings_outlined,
    ),
    DefaultIcons(
      id: Icons.fastfood_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.fastfood_outlined,
    ),
    DefaultIcons(
      id: Icons.directions_bus_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.directions_bus_outlined,
    ),
    DefaultIcons(
      id: Icons.local_hospital_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.local_hospital_outlined,
    ),
    DefaultIcons(
      id: Icons.shopping_cart_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.shopping_cart_outlined,
    ),
    DefaultIcons(
      id: Icons.home_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.home_outlined,
    ),
    DefaultIcons(
      id: Icons.card_giftcard_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.card_giftcard_outlined,
    ),
    DefaultIcons(
      id: Icons.movie_outlined.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.movie_outlined,
    ),
    DefaultIcons(
      id: Icons.add.codePoint.toString(),
      type: CustomIconsType.iconData,
      iconData: Icons.add,
    ),
    ImageIcons(
      id: incomeIcon,
      type: CustomIconsType.image,
      imagePath: incomeIcon,
    ),
    ImageIcons(
      id: Images.onboarding1,
      type: CustomIconsType.image,
      imagePath: Images.onboarding1,
    ),
    ImageIcons(
      id: travelIcon,
      type: CustomIconsType.svgImage,
      imagePath: travelIcon,
    ),
    ImageIcons(
      id: carIcon,
      type: CustomIconsType.svgImage,
      imagePath: carIcon,
    ),
    ImageIcons(
      id: carFrontIcon,
      type: CustomIconsType.svgImage,
      imagePath: carFrontIcon,
    ),
    ImageIcons(
      id: carWashingIcon,
      type: CustomIconsType.svgImage,
      imagePath: carWashingIcon,
    ),
    ImageIcons(
      id: house1Icon,
      type: CustomIconsType.svgImage,
      imagePath: house1Icon,
    ),
    ImageIcons(
      id: house2Icon,
      type: CustomIconsType.svgImage,
      imagePath: house2Icon,
    ),
    ImageIcons(
      id: house3Icon,
      type: CustomIconsType.svgImage,
      imagePath: house3Icon,
    ),
    ImageIcons(
      id: pillsIcon,
      type: CustomIconsType.svgImage,
      imagePath: pillsIcon,
    ),
    ImageIcons(
      id: carOldIcon,
      type: CustomIconsType.svgImage,
      imagePath: carOldIcon,
    ),
    ImageIcons(
      id: Images.appLogo,
      type: CustomIconsType.image,
      imagePath: Images.appLogo,
    ),
  ];

  static List<CustomIcons> get getIcons => _icons;
  static int get getNumberOfIcons => _icons.length;
}

enum CustomIconsType {
  image,
  svgImage,
  iconData,
}

abstract class CustomIcons {
  final String id;
  final CustomIconsType type;

  CustomIcons({required this.id, required this.type});
}

class DefaultIcons extends CustomIcons {
  final IconData iconData;

  DefaultIcons({
    required super.id,
    required super.type,
    required this.iconData,
  });
}

class ImageIcons extends CustomIcons {
  final String imagePath;

  ImageIcons({
    required super.id,
    required super.type,
    required this.imagePath,
  });
}
