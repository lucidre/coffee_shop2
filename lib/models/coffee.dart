import 'dart:math';

import 'package:coffee_shop_updated/constants/strings.dart';
import 'package:flutter/material.dart';

double _doubleInRange() =>
    double.tryParse(
        (random.nextDouble() * (60 - 20) + 20).toStringAsFixed(3)) ??
    0;

final random = Random();

final ingredients = [
  Ingredients(
    title: 'Light Muscovado Sugar',
    iconData: Icons.timelapse,
  ),
  Ingredients(
    title: 'Self-raising Flour',
    iconData: Icons.image,
  ),
  Ingredients(
    title: '2 Large Eggs',
    iconData: Icons.wrong_location_sharp,
  ),
  Ingredients(
    title: '2 tsp Instant Coffee',
    iconData: Icons.timelapse,
  ),
  Ingredients(
    title: 'Light Muscovado Sugar',
    iconData: Icons.image,
  ),
  Ingredients(
    title: 'Mascarpone',
    iconData: Icons.wrong_location_sharp,
  ),
  Ingredients(
    title: 'Soft Cheese',
    iconData: Icons.image,
  ),
];

final coffees = [
  Coffee(
    name: 'Batch Brew',
    image: coffee1,
    price: _doubleInRange(),
    about:
        'A batch brew is a coffee made in an automated pour over machine, like a Moccamaster. These machines use a filter and brew much larger quantities of coffee than devices like the AeroPress, V60 or Chemex.',
    prepTime: '8 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
    name: 'Cold Drip',
    image: coffee2,
    price: _doubleInRange(),
    about:
        'Cold drip coffee is similar to coffee brewed in a pour-over device, except that the process uses cold water and takes much longer. Our Merlo stores use a Yama cold drip tower to make cold drip coffee.',
    prepTime: '7 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
    name: 'Cold Brew',
    image: coffee3,
    price: _doubleInRange(),
    about:
        'Our Cold Brew coffee can is produced by submerging our premium Zambia coffee beans in cold water for an extended period of time. This results in a smooth and refreshing brew with 180mg of caffeine - similar to a double-shot espresso.',
    prepTime: '7 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
    name: 'Espresso',
    image: coffee4,
    price: _doubleInRange(),
    about:
        'Also known as a short black, an espresso is a single shot of coffee. No extra hot water is added, resulting in an intense and flavoursome drink.',
    prepTime: '10 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
    name: 'Doppio',
    image: coffee5,
    price: _doubleInRange(),
    about:
        'A Doppio is a double shot of espresso with no added hot water or milk. This results in 60 ml of coffee. Doppio means \'double\' in Italian.',
    prepTime: '6 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
    name: 'Ristretto',
    image: coffee6,
    price: _doubleInRange(),
    about:
        "A ristretto, which means 'restricted' in Italian, is a shot of espresso coffee but extracted with half the amount of water.",
    prepTime: '7 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
    name: 'Long Black',
    image: coffee7,
    price: _doubleInRange(),
    about:
        'A long black is made by pouring a double-shot of espresso over hot water. ',
    prepTime: '15 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
    name: 'Short Macchiato',
    image: coffee8,
    price: _doubleInRange(),
    about:
        'A short macchiato is served in a small glass consisting of a single espresso shot then filled with creamy steamed milk and finished with a small layer of foam.',
    prepTime: '10 minutes',
    nutritionInfo:
        'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
    ingredients: ingredients,
  ),
  Coffee(
      name: 'Long Macchiato',
      image: coffee9,
      price: _doubleInRange(),
      about:
          'A long macchiato is similar to a short macchiato, except that it contains a double shot (around 60ml) of coffee.',
      prepTime: '17 minutes',
      nutritionInfo:
          'Black coffee contains no significant amounts of the macronutrients, fat, carbohydrate and protein and therefore contains only 1-2 kcal per 100ml34.\n\nHowever, the final nutritional profile of a cup of coffee will be affected by several factors:\n\nThe addition of milk, cream, sugar or other sweeteners to taste will affect the final nutritional value and may increase the calorie content.\n\nThe variation in cup sizes used across Europe may alter the nutritional value.',
      ingredients: ingredients),
];

class Coffee {
  final String name;
  final String image;
  final double price;
  final String about;
  final String prepTime;
  final String nutritionInfo;
  final List<Ingredients> ingredients;

  Coffee({
    required this.name,
    required this.image,
    required this.price,
    required this.about,
    required this.prepTime,
    required this.nutritionInfo,
    required this.ingredients,
  });
}

class Ingredients {
  final String title;
  final IconData iconData;

  Ingredients({
    required this.title,
    required this.iconData,
  });
}
