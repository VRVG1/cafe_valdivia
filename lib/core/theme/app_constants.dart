import 'package:flutter/material.dart';

class AppPadding {
  const AppPadding._();

  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;

  static const EdgeInsets allXs = EdgeInsets.all(xs);
  static const EdgeInsets allSm = EdgeInsets.all(sm);
  static const EdgeInsets allMd = EdgeInsets.all(md);
  static const EdgeInsets allLg = EdgeInsets.all(lg);
  static const EdgeInsets allXl = EdgeInsets.all(xl);

  static const EdgeInsets hXs = EdgeInsets.symmetric(horizontal: xs);
  static const EdgeInsets hSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets hMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets hLg = EdgeInsets.symmetric(horizontal: lg);

  static const EdgeInsets vXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets vSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets vMd = EdgeInsets.symmetric(vertical: md);

  static const EdgeInsets formPage = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: xl,
  );
  static const EdgeInsets hSmVSm = EdgeInsets.symmetric(
    horizontal: sm,
    vertical: sm,
  );
  static const EdgeInsets hMdVSm = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );
}

class AppRadius {
  const AppRadius._();

  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double modal = 28;

  static const BorderRadius xxsCircular = BorderRadius.all(Radius.circular(xxs));
  static const BorderRadius xsCircular = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius smCircular = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdCircular = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgCircular = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlCircular = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius modalCircular = BorderRadius.all(
    Radius.circular(modal),
  );

  static const BorderRadius modalTopCircular = BorderRadius.vertical(
    top: Radius.circular(modal),
  );
  static const BorderRadius xlTopCircular = BorderRadius.vertical(
    top: Radius.circular(xl),
  );
  static const BorderRadius mdTopCircular = BorderRadius.vertical(
    top: Radius.circular(md),
  );
}
