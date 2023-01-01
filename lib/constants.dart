import 'package:easy_localization/easy_localization.dart';

var sw;
var sh;



extension TranslateString on String {
  String translate() {
    return this.tr();
  }
// ···
}