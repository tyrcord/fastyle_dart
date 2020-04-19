import 'package:fastyle_dart/fastyle_dart.dart';

const fruitsCategory = FastCategory(label: 'Fruits', value: 'fruits');
const vegetablesCategory = FastCategory(
  label: 'Vegetables',
  value: 'vegetables',
);

const demoCategories = [fruitsCategory, vegetablesCategory];

final List<FastItem<String>> demoItems = [
  FastItem(
    label: 'Apples',
    value: 'apples',
    categories: [fruitsCategory],
  ),
  FastItem(
    label: 'Bananas',
    value: 'bananas',
    categories: [fruitsCategory],
  ),
  FastItem(
    label: 'Grappes',
    value: 'grappes',
    categories: [fruitsCategory],
  ),
  FastItem(
    label: 'Tomatoes',
    value: 'tomatoes',
    categories: [fruitsCategory, vegetablesCategory],
  ),
  FastItem(
    label: 'Broccoli',
    value: 'broccoli',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Lettuce',
    value: 'lettuce',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Potato',
    value: 'potato',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Eggplant',
    value: 'eggplant',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Avocado',
    value: 'avocado',
    categories: [vegetablesCategory, fruitsCategory],
  ),
  FastItem(
    label: 'Cabbages',
    value: 'cabbages',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Tofu',
    value: 'tofu',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Cucumber',
    value: 'cucumber',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Zucchini',
    value: 'zucchini',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Orange',
    value: 'Orange',
    categories: [fruitsCategory],
  ),
  FastItem(
    label: 'Cauliflower',
    value: 'cauliflower',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Spinach',
    value: 'spinach',
    categories: [vegetablesCategory],
  ),
  FastItem(
    label: 'Apricots',
    value: 'apricots',
    categories: [fruitsCategory],
  ),
  FastItem(
    label: 'Raspberries',
    value: 'raspberries',
    categories: [fruitsCategory],
  ),
  FastItem(
    label: 'Kiwifruit',
    value: 'kiwifruit',
    categories: [fruitsCategory],
  ),
  FastItem(
    label: 'Pêche',
    value: 'peche',
    categories: [fruitsCategory],
  ),
];
