import 'package:coffee_shop_updated/constants/numbers.dart';
import 'package:coffee_shop_updated/constants/strings.dart';
import 'package:coffee_shop_updated/constants/style.dart';
import 'package:coffee_shop_updated/models/coffee.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;

const _duration = Duration(milliseconds: 300);

class DetailsScreen extends StatefulWidget {
  final Coffee coffee;
  const DetailsScreen({super.key, required this.coffee});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int imageSizePosition = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFab(),
      body: Stack(children: [buildBackground(), buildBody()]),
    );
  }

  SingleChildScrollView buildBody() {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: darkColor);
    final bodyText2 = textTheme.bodyText2?.copyWith(color: darkColor);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(bodyText1),
          buildImage(),
          buildCoffeeTitle(bodyText1, bodyText2),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultMargin, right: kDefaultMargin),
            child: Text(
              'Description',
              style: bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultMargin, right: kDefaultMargin),
            child: Text(
              widget.coffee.about,
              style: bodyText2,
            ),
          ),
          const SizedBox(
            height: kDefaultMargin,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultMargin, right: kDefaultMargin),
            child: Text(
              'Nutritional Information',
              style: bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultMargin, right: kDefaultMargin),
            child: Text(
              widget.coffee.nutritionInfo,
              style: bodyText2,
            ),
          ),
          const SizedBox(
            height: kDefaultMargin,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultMargin, right: kDefaultMargin),
            child: Text(
              'Ingredients',
              style: bodyText1,
            ),
          ),
          ...widget.coffee.ingredients
              .map(
                (ingredient) => Container(
                  padding: const EdgeInsets.only(
                    left: kDefaultMargin,
                    right: kDefaultMargin,
                    bottom: kDefaultMargin / 2,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        ingredient.iconData,
                        color: darkColor,
                        size: 18,
                      ),
                      Text(
                        ingredient.title,
                        style: bodyText2,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          const SizedBox(
            height: kDefaultMargin * 3,
          ),
        ],
      ),
    );
  }

  Container buildCoffeeTitle(TextStyle? bodyText1, TextStyle? bodyText2) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      margin: const EdgeInsets.all(kDefaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.coffee.name,
                  style: bodyText1?.copyWith(color: lightColor),
                ),
              ),
              Text(
                '\$${widget.coffee.price}',
                style: bodyText2?.copyWith(
                  color: coffeeColor,
                ),
              ),
            ],
          ),
          Text(
            loremIspidiumTitle,
            style: bodyText2?.copyWith(color: lightColor.withOpacity(.5)),
          ),
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: coffeeColor,
              ),
              Text(
                '4.5',
                style: bodyText2?.copyWith(color: lightColor),
              ),
              Text(
                '(6,537)',
                style: bodyText2?.copyWith(color: lightColor.withOpacity(.5)),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(kDefaultPadding / 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: coffeeColor,
                ),
                child: Text(
                  'Add to cart',
                  style: bodyText2?.copyWith(
                    color: darkColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildImage() {
    return Container(
      height: 400,
      width: 400,
      alignment: Alignment.center,
      child: RadialAnimation(
        selectedPosition: imageSizePosition,
        center: AnimatedContainer(
          duration: _duration,
          width: imageSizePosition == 0
              ? 150
              : imageSizePosition == 1
                  ? 200
                  : 250,
          height: imageSizePosition == 0
              ? 150
              : imageSizePosition == 1
                  ? 200
                  : 250,
          child: Hero(
            tag: widget.coffee.image,
            child: Image.asset(
              widget.coffee.image,
              width: 250,
              height: 250,
            ),
          ),
        ),
        onPressed: (position) {
          setState(() {
            imageSizePosition = position;
          });
        },
      ),
    );
  }

  FloatingActionButton buildFab() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.shopping_cart_rounded,
        color: coffeeColor,
      ),
    );
  }

  AppBar buildAppBar(TextStyle? bodyText1) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: darkColor,
          )),
      centerTitle: true,
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Coffee',
          style: bodyText1?.copyWith(fontSize: 22),
        ),
        Text(
          'House',
          style: bodyText1?.copyWith(color: coffeeColor, fontSize: 22),
        ),
      ]),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_bag_rounded,
            color: darkColor,
          ),
        )
      ],
    );
  }

  Positioned buildBackground() {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 0,
      right: 0,
      child: Image.asset(
        bg3,
        width: width * 2,
        color: darkColor.withOpacity(.2),
      ),
    );
  }
}

class RadialAnimation extends StatelessWidget {
  final Widget center;
  final Function(int) onPressed;
  final int selectedPosition;
  const RadialAnimation({
    Key? key,
    required this.center,
    required this.onPressed,
    required this.selectedPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText2 = textTheme.bodyText2?.copyWith(color: darkColor);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              border: Border.all(
                color: darkColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(300)),
        ),
        _buildButton(
          135,
          'S',
          bodyText2,
          selectedPosition == 0,
          () => onPressed(0),
        ),
        _buildButton(
          90,
          'M',
          bodyText2,
          selectedPosition == 1,
          () => onPressed(1),
        ),
        _buildButton(
          45,
          'L',
          bodyText2,
          selectedPosition == 2,
          () => onPressed(2),
        ),
        center,
      ],
    );
  }

  _buildButton(
    double angle,
    String text,
    TextStyle? bodyText2,
    bool isSelected,
    VoidCallback onPressed,
  ) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate((150) * cos(rad), (150) * sin(rad)),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: AnimatedContainer(
          duration: _duration,
          decoration: BoxDecoration(
            border: Border.all(color: darkColor, width: 1),
            borderRadius: BorderRadius.circular(100),
            color: isSelected ? darkColor : lightColor,
          ),
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: Text(
            text,
            style:
                bodyText2?.copyWith(color: isSelected ? lightColor : darkColor),
          ),
        ),
      ),
    );
  }
}
