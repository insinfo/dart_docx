import 'package:xml/xml.dart';

abstract class DocxBase {
  String get tagName;
  String toStringXml();
  void buildElement(XmlBuilder builder);
}
