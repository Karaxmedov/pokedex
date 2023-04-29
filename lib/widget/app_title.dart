import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/uii_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Uihelper.getAppTitleHeight(),
      child: Stack(
        children: [
          Padding(
            padding: Uihelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.getTitleStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image(
                image: const AssetImage(Constants.imagePath),
                width: Uihelper.getAppTitleimageWidth(),
                fit: BoxFit.fitWidth),
          ),
        ],
      ),
    );
  }
}
