import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';

export './edge_insets.constants.dart';
export './sized_box.constants.dart';

// Strings

const kFastClearSelectionText = 'Clear Selection';
const kFastSearchPlaceholderText = 'Search...';
const kFastSelectTitleText = 'Select';
const kFastButtonLabel = 'Button';
const kFastCancelText = 'cancel';
const kFastNoneString = 'none';
const kFastValidText = 'valid';
const kFastPanelText = 'panel';
const kFastAllString = 'all';
const kFastDoneText = 'done';
const kFastNextText = 'next';
const kFastSkipText = 'skip';
const kFastEmptyString = '';

// Sizes

const kFastIconSizeXs = 18.0;
const kFastIconSizeSmall = 20.0;
const kFastIconSizeMedium = 24.0;
const kFastIconSizeLarge = 28.0;
const kFastIconSizeXl = 32.0;

// Image Sizes

const kFastImageizeXs = 16.0;
const kFastImageSizeSmall = 24.0;
const kFastImageSizeMedium = 32.0;
const kFastImageSizeLarge = 48.0;
const kFastImageSizeXl = 64.0;
const kFastImageSizeXxl = 128.0;

const kFastLineHeight = 1.2;

// Radius

const kFastBorderRadius = 12.0;
const kFastBlurRadius = 3.0;
const kFastSplashRadius = 18.0;

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

const kFastDebounceTimeDuration = Duration(milliseconds: 300);
const kFastTrottleTimeDuration = Duration(seconds: 1);

// Languages

const kFastSupportedLocales = <Locale>[Locale('en', 'US')];

// Icons

const kFastCloseIcon = Icon(Icons.close);
const kFastBackIcon = Icon(Icons.arrow_back);
const kFastDoneIcon = Icon(Icons.done);
const kFastClearSearchIcon = Icon(Icons.delete_outline);
const kFastNavigationTrailingIcon = Icon(Icons.keyboard_arrow_right);

const kFastExpandedHeight = 176.0;
