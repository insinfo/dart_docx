import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'namespaces.dart';

//             <w:tcBorders>
//                 <w:top w:val="single" w:sz="4" w:space="0" w:color="000000" />
//                 <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
//                 <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
//             </w:tcBorders>
// <w:tcBorders>
//     <w:top w:val="single" w:sz="6" w:space="0" w:color="000000" />
//     <w:start w:val="single" w:sz="6" w:space="0" w:color="000000" />
//     <w:bottom w:val="single" w:sz="6" w:space="0" w:color="000000" />
//     <w:end w:val="single" w:sz="6" w:space="0" w:color="000000" />
// </w:tcBorders>
class TableColBorders implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tcBorders';
  final List<TableBorder> borders;

  @override
  Map<String, String> get attributes => {};

  const TableColBorders({required this.borders});

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
