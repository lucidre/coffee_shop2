import 'package:auto_route/auto_route.dart';
import 'package:coffee_shop_updated/constants/numbers.dart';
import 'package:coffee_shop_updated/constants/strings.dart';
import 'package:coffee_shop_updated/constants/style.dart';
import 'package:coffee_shop_updated/routing/app_router.gr.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController(viewportFraction: 1);
  double currentPage = 0;
  int totalSize = 3;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _pageController.addListener(listener);
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(listener);
    _pageController.dispose();
    super.dispose();
  }

  void listener() {
    setState(() {
      currentPage = _pageController.page ?? 0.0;
    });
  }

  Widget buildIndicators() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 35,
      child: SizedBox(
        height: 6,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 5),
              height: 8,
              width: (currentPage.round() == index) ? 50 : 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (currentPage.round() == index)
                    ? coffeeColor
                    : lightColor.withOpacity(.6),
              ),
            );
          },
          itemCount: totalSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Stack(children: [
        buildBackgroud(),
        buildBody(),
      ]),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: _pageController,
              itemCount: totalSize,
              itemBuilder: (context, index) {
                return _OnboardingItem(index: index, currentPage: currentPage);
              }),
        ),
        const SizedBox(
          height: kDefaultMargin,
        ),
        buildIndicators(),
        const SizedBox(
          height: kDefaultMargin,
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            context.router.push(const HomeRoute());
          },
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding / 1.5),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.navigate_next_rounded,
              color: darkColor,
            ),
          ),
        ),
        const SizedBox(
          height: kDefaultMargin * 2,
        ),
      ],
    );
  }

  Positioned buildBackgroud() {
    final width = MediaQuery.of(context).size.width;
    final xOffset = width * (currentPage / totalSize);
    return Positioned(
      bottom: 0,
      left: 0,
      child: Transform.translate(
        offset: Offset(-xOffset, 0),
        child: Image.asset(
          bg1,
          width: width * 3,
          color: lightColor.withOpacity(.5),
        ),
      ),
    );
  }
}

class _OnboardingItem extends StatelessWidget {
  const _OnboardingItem({
    Key? key,
    required this.index,
    required this.currentPage,
  }) : super(key: key);

  final double currentPage;
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(fontSize: 24);
    final bodyText2 = textTheme.bodyText2?.copyWith(fontSize: 14);
    final size = MediaQuery.of(context).size;
    final result = currentPage - index;

    final scaleY = -.4 * result + 1;
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            alignment: Alignment.bottomCenter,
            transform: Matrix4.identity()
              ..translate(0.0, (size.height / 2) * (1 - scaleY).abs()),
            child: Opacity(
              opacity: 1 - (result.abs()).clamp(0, 1),
              child: Image.asset(
                index == 0
                    ? coffee1
                    : index == 1
                        ? coffee2
                        : coffee3,
                width: 300,
                height: 300,
              ),
            ),
          ),
          const SizedBox(
            height: kDefaultMargin,
          ),
          Opacity(
            opacity: (currentPage - index).abs() < .08 ? 1 : 0,
            child: Text(
              loremIspidiumTitle,
              style: bodyText1,
            ),
          ),
          const SizedBox(
            height: kDefaultMargin / 2,
          ),
          Opacity(
            opacity: (currentPage - index).abs() < .08 ? 1 : 0,
            child: SizedBox(
              width: 300,
              child: Text(
                loremIspidiumLong,
                textAlign: TextAlign.center,
                style: bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
