import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';

// Strings

const kFastEmptyString = '';
const kFastNoneString = 'none';
const kFastAllString = 'all';
const kFastButtonLabel = 'Button';
const kFastClearSelectionText = 'Clear Selection';
const kFastSelectTitleText = 'Select';

// EdgeInsets

const kFastEdgeInsets24 = EdgeInsets.all(24.0);
const kFastEdgeInsets16 = EdgeInsets.all(16.0);
const kFastEdgeInsets12 = EdgeInsets.all(12.0);
const kFastEdgeInsets8 = EdgeInsets.all(8.0);
const kFastEdgeInsets6 = EdgeInsets.all(6.0);

// Sizes

const kFastIconSize = 20.0;
const kFastIconSizeMedium = 24.0;
const kFastIconSizeXl = 28.0;

const kFastLineHeight = 1.2;

const kFastSizedBox8 = SizedBox(height: 8.0);
const kFastSizedBox16 = SizedBox(height: 16.0);
const kFastSizedBox24 = SizedBox(height: 24.0);
const kFastSizedBox32 = SizedBox(height: 32.0);
const kFastSizedBox64 = SizedBox(height: 64.0);

// Radius

const kFastBorderRadius = 12.0;
const kFastBlurRadius = 3.0;

// Options

final kFastFuzzyOptions = FuzzyOptions(
  isCaseSensitive: false,
  shouldNormalize: true,
  shouldSort: true,
  location: 0,
  threshold: 0.25,
  distance: 100,
  findAllMatches: false,
  minMatchCharLength: 2,
);

final kFastFastItemFuzzyOptions = FuzzyOptions(
  isCaseSensitive: kFastFuzzyOptions.isCaseSensitive,
  shouldNormalize: kFastFuzzyOptions.shouldNormalize,
  shouldSort: kFastFuzzyOptions.shouldSort,
  location: kFastFuzzyOptions.location,
  threshold: kFastFuzzyOptions.threshold,
  distance: kFastFuzzyOptions.distance,
  findAllMatches: kFastFuzzyOptions.findAllMatches,
  minMatchCharLength: kFastFuzzyOptions.minMatchCharLength,
  keys: [
    WeightedKey<FastItem>(
      name: 'labelText',
      getter: (FastItem item) => item.labelText,
      weight: 1,
    ),
    WeightedKey(
      name: 'descriptionText',
      getter: (FastItem item) => item.descriptionText ?? kFastEmptyString,
      weight: 0.5,
    ),
  ],
);

// Alpha

const kDisabledAlpha = 155;

// Duration

const kFastTrottleTimeDuration = Duration(seconds: 1);

// Languages

const kFastSupportedLocales = <Locale>[Locale('en', 'US')];
