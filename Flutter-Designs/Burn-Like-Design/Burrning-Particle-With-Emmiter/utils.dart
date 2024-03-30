import 'dart:math';

Random _random = Random();

double doubleInRange(num start, num end) =>
    _random.nextDouble() * (end - start) + start;
