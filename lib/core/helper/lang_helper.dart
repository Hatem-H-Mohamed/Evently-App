import 'package:intl/intl.dart';

class LangHelper {
  /// Returns the current locale of the app.
  static bool isArabic() => Intl.getCurrentLocale() == 'ar';
}
