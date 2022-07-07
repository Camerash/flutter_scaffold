import 'package:intl/intl.dart';

/// Examples:
/// $10 -> HK$10
/// $10.1 -> HK$10.1
/// $10.11 -> HK$10.11
/// $10.111 -> HK$10.11
final priceFormat = NumberFormat.currency(symbol: 'HK\$')
  ..minimumFractionDigits = 0
  ..maximumFractionDigits = 2;
