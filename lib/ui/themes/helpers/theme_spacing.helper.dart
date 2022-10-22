import 'package:fastyle_dart/fastyle_dart.dart';
import 'package:flutter/material.dart';

class FastThemeSpacingHelper {
  EdgeInsets getPadding(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.size.width >= FastMediaBreakpoints.tablet) {
      return kFastEdgeInsets24;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.desktop) {
      return kFastEdgeInsets32;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.large) {
      return kFastEdgeInsets40;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.xl) {
      return kFastEdgeInsets48;
    }

    return kFastEdgeInsets16;
  }

  EdgeInsets getHorizontalPadding(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.size.width >= FastMediaBreakpoints.tablet) {
      return kFastHorizontalEdgeInsets24;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.desktop) {
      return kFastHorizontalEdgeInsets32;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.large) {
      return kFastHorizontalEdgeInsets40;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.xl) {
      return kFastHorizontalEdgeInsets48;
    }

    return kFastHorizontalEdgeInsets16;
  }

  EdgeInsets getVerticalPadding(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.size.width >= FastMediaBreakpoints.tablet) {
      return kFastVerticalEdgeInsets24;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.desktop) {
      return kFastVerticalEdgeInsets32;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.large) {
      return kFastVerticalEdgeInsets40;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.xl) {
      return kFastVerticalEdgeInsets48;
    }

    return kFastVerticalEdgeInsets16;
  }

  SizedBox getVerticalSpacing(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.size.width >= FastMediaBreakpoints.tablet) {
      return kFastVerticalSizedBox24;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.desktop) {
      return kFastVerticalSizedBox32;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.large) {
      return kFastVerticalSizedBox40;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.xl) {
      return kFastVerticalSizedBox48;
    }

    return kFastVerticalSizedBox16;
  }

  SizedBox getHorizontalSpacing(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    if (mediaQueryData.size.width >= FastMediaBreakpoints.tablet) {
      return kFastHorizontalSizedBox24;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.desktop) {
      return kFastHorizontalSizedBox32;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.large) {
      return kFastHorizontalSizedBox40;
    } else if (mediaQueryData.size.width >= FastMediaBreakpoints.xl) {
      return kFastHorizontalSizedBox48;
    }

    return kFastHorizontalSizedBox16;
  }
}
