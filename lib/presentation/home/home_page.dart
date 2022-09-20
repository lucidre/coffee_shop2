import 'package:auto_route/auto_route.dart';
import 'package:coffee_shop_updated/constants/numbers.dart';
import 'package:coffee_shop_updated/constants/strings.dart';
import 'package:coffee_shop_updated/constants/style.dart';
import 'package:coffee_shop_updated/models/coffee.dart';
import 'package:coffee_shop_updated/routing/app_router.gr.dart';
import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 300);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int chipPosition = 0;
  int bottomBarPosition = 0;

  updateBottomBarPosition(int position) {
    setState(() {
      bottomBarPosition = position;
    });
  }

  updateChipPosition(int position) {
    setState(() {
      chipPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: darkColor);
    final bodyText2 = textTheme.bodyText2?.copyWith(color: darkColor);
    return Scaffold(
      bottomNavigationBar: buildBottomBar(bodyText2),
      body: Stack(children: [
        buildBackground(),
        buildBody(bodyText1, bodyText2),
      ]),
    );
  }

  Container buildBottomBar(TextStyle? bodyText2) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: darkColor.withOpacity(.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          bottomBarItem(
            Icons.home_rounded,
            'Home',
            bodyText2,
            bottomBarPosition == 0,
            () => updateBottomBarPosition(0),
          ),
          bottomBarItem(
            Icons.favorite_rounded,
            'Favourite',
            bodyText2,
            bottomBarPosition == 1,
            () => updateBottomBarPosition(1),
          ),
          bottomBarItem(
            Icons.space_dashboard_rounded,
            'Store',
            bodyText2,
            bottomBarPosition == 2,
            () => updateBottomBarPosition(2),
          ),
          bottomBarItem(
            Icons.person_rounded,
            'Profile',
            bodyText2,
            bottomBarPosition == 3,
            () => updateBottomBarPosition(3),
          ),
        ],
      ),
    );
  }

  Widget bottomBarItem(IconData iconData, String text, TextStyle? bodyText2,
          bool isSelected, VoidCallback onPressed) =>
      Expanded(
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: onPressed,
          child: Align(
            child: AnimatedContainer(
              duration: _duration,
              padding: const EdgeInsets.only(
                top: kDefaultPadding / 4,
                bottom: kDefaultPadding / 4,
                right: kDefaultPadding / 2,
                left: kDefaultPadding / 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected ? darkColor : Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    color: isSelected ? coffeeColor : darkColor.withOpacity(.5),
                  ),
                  if (isSelected)
                    Text(
                      text,
                      style: bodyText2?.copyWith(
                        color: lightColor,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );

  Positioned buildBackground() {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Image.asset(
        bg2,
        width: width * 2,
        color: darkColor.withOpacity(.3),
      ),
    );
  }

  SingleChildScrollView buildBody(TextStyle? bodyText1, TextStyle? bodyText2) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(bodyText1),
          const SizedBox(
            height: kDefaultMargin,
          ),
          buildSearchBar(bodyText2),
          const SizedBox(
            height: kDefaultMargin,
          ),
          buildCoffeeTypes(bodyText2),
          const SizedBox(
            height: kDefaultMargin,
          ),
          buildListView1(),
          const SizedBox(
            height: kDefaultMargin,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: kDefaultMargin, right: kDefaultMargin),
            child: Text(
              'Special For You',
              style: bodyText1,
            ),
          ),
          const SizedBox(
            height: kDefaultMargin,
          ),
          buildListView2(),
        ],
      ),
    );
  }

  ListView buildListView2() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        final coffee = coffees[index];
        return InkWell(
          onTap: () {
            context.router.push(DetailsScreen(coffee: coffee));
          },
          child: _HomeItem2(coffee: coffee),
        );
      },
    );
  }

  Container buildListView1() {
    return Container(
      padding:
          const EdgeInsets.only(left: kDefaultMargin, right: kDefaultMargin),
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: coffees.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          final coffee = coffees[index];
          return _HomeItem1(coffee: coffee);
        },
      ),
    );
  }

  Widget buildCoffeeTypes(TextStyle? bodyText2) {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultMargin, right: kDefaultMargin),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          buildChip(
            'All',
            chipPosition == 0,
            bodyText2,
            () => updateChipPosition(0),
          ),
          buildChip(
            'Cappuccino',
            chipPosition == 1,
            bodyText2,
            () => updateChipPosition(1),
          ),
          buildChip(
            'Café au Lait',
            chipPosition == 2,
            bodyText2,
            () => updateChipPosition(2),
          ),
          buildChip(
            'Espresso',
            chipPosition == 3,
            bodyText2,
            () => updateChipPosition(3),
          ),
          buildChip(
            'Latte',
            chipPosition == 4,
            bodyText2,
            () => updateChipPosition(4),
          ),
          buildChip(
            'Robusta',
            chipPosition == 5,
            bodyText2,
            () => updateChipPosition(5),
          ),
          buildChip(
            'Decaf',
            chipPosition == 6,
            bodyText2,
            () => updateChipPosition(6),
          ),
        ]),
      ),
    );
  }

  Widget buildChip(
    String text,
    bool isSelected,
    TextStyle? bodyText2,
    VoidCallback onPressed,
  ) =>
      InkWell(
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: AnimatedContainer(
          duration: _duration,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
              top: kDefaultPadding / 4,
              bottom: kDefaultPadding / 4,
              right: kDefaultPadding / 2,
              left: kDefaultPadding / 2),
          margin: const EdgeInsets.only(right: kDefaultMargin / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? coffeeColor : darkColor.withOpacity(.2),
          ),
          child: Text(
            text,
            style:
                bodyText2?.copyWith(color: isSelected ? lightColor : darkColor),
          ),
        ),
      );

  Container buildSearchBar(TextStyle? bodyText2) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      margin:
          const EdgeInsets.only(left: kDefaultMargin, right: kDefaultMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkColor.withOpacity(.2),
      ),
      child: Row(children: [
        const Icon(
          Icons.search_rounded,
          color: darkColor,
        ),
        Text(
          'Search',
          style: bodyText2?.copyWith(
            color: darkColor.withOpacity(.5),
          ),
        ),
        const Spacer(),
      ]),
    );
  }

  AppBar buildAppBar(TextStyle? bodyText1) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sort_rounded,
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
}

class _HomeItem1 extends StatelessWidget {
  const _HomeItem1({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: darkColor);
    final bodyText2 = textTheme.bodyText2?.copyWith(color: darkColor);
    return InkWell(
      onTap: () {
        context.router.push(DetailsScreen(coffee: coffee));
      },
      child: Container(
        padding: const EdgeInsets.all(kDefaultMargin / 4),
        width: 150,
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(right: kDefaultMargin / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: coffee.image,
                child: Image.asset(
                  coffee.image,
                ),
              ),
            ),
            Text(
              coffee.name,
              style: bodyText1?.copyWith(color: lightColor),
            ),
            Text(
              loremIspidiumTitle,
              style: bodyText2?.copyWith(color: lightColor.withOpacity(.5)),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${coffee.price}',
                    style: bodyText2?.copyWith(
                      color: coffeeColor,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: coffeeColor,
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: darkColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _HomeItem2 extends StatelessWidget {
  const _HomeItem2({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyText1 = textTheme.bodyText1?.copyWith(color: darkColor);
    final bodyText2 = textTheme.bodyText2?.copyWith(color: darkColor);
    return Container(
      padding: const EdgeInsets.all(kDefaultMargin / 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
          left: kDefaultMargin,
          right: kDefaultMargin,
          bottom: kDefaultMargin / 4),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: bodyText1?.copyWith(color: lightColor),
                    ),
                    Text(
                      loremIspidiumTitle,
                      style: bodyText2?.copyWith(
                          color: lightColor.withOpacity(.5)),
                    ),
                    Text(
                      '\$${coffee.price}',
                      style: bodyText2?.copyWith(
                        color: coffeeColor,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                coffee.image,
                width: 100,
                height: 100,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: coffeeColor,
              ),
              child: const Icon(
                Icons.add_rounded,
                color: darkColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
