import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants.dart';
import 'boarding_model.dart';

class BoardingItem extends StatelessWidget {
  final BoardingModel model;

  const BoardingItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(model.image,
            height: MediaQuery.of(context).size.height / 2.5),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: black40bold,
          ),
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: black20light,
        )
      ],
    );
  }
}
