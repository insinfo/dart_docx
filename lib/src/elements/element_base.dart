import 'package:xml/xml.dart';

import 'namespaces.dart';

abstract class ElementBase {
  String get tagName;
  String toStringXml();
  Map<String, String> get attributes;
  String get namespace;

  /// create XML element
  void buildElement(XmlBuilder builder);

  Map<String, String> get namespaces => {wordprocessingml: 'w'};
}
