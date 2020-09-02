import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';

// Strings

const kFastEmptyString = '';
const kFastNoneString = 'none';
const kFastAllString = 'all';

// EdgeInsets

const kFastEdgeInsets24 = EdgeInsets.all(24.0);
const kFastEdgeInsets16 = EdgeInsets.all(16.0);
const kFastEdgeInsets12 = EdgeInsets.all(12.0);
const kFastEdgeInsets8 = EdgeInsets.all(8.0);
const kFastEdgeInsets6 = EdgeInsets.all(6.0);

// Sizes

const kFastIconSize = 20.0;

// Options

final kFastFuzzyOptions = FuzzyOptions(
  isCaseSensitive: false,
  shouldNormalize: true,
  shouldSort: true,
  distance: 100,
  threshold: 0.25,
  location: 0,
  findAllMatches: false,
  minMatchCharLength: 2,
);
