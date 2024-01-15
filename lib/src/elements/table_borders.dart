

import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'namespaces.dart';

//  <w:tblBorders>
//     <w:top w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:left w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:right w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:insideH w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:insideV w:val="single" w:sz="4" w:space="0" w:color="auto" />
// </w:tblBorders>
class TableBorders implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tblBorders';
  final List<TableBorder> borders;

  @override
  Map<String, String> get attributes => {};

  const TableBorders({required this.borders});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      borders.forEach((bo) {
        bo.buildElement(builder);
      });
    });
  }

  @override
  String toStringXml() {
    final builder = XmlBuilder();
    buildElement(builder);
    final relationshipXml = builder.buildDocument();
    final result = relationshipXml.toXmlString(pretty: true);
    // print(result);
    return result;
  }
}
