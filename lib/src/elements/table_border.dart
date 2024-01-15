import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';


//  <w:tblBorders>
//     <w:top w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:left w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:right w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:insideH w:val="single" w:sz="4" w:space="0" w:color="auto" />
//     <w:insideV w:val="single" w:sz="4" w:space="0" w:color="auto" />
// </w:tblBorders>
class TableBorder implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => position;

  /// top | start | bottom
  final String position;

  /// single
  final String val;
  final int size;
  final int space;
  /// 000000 | auto
  final String color;

  @override
  Map<String, String> get attributes => {'w:val': '$val'};

  const TableBorder({
    required this.position,
    this.val = 'single',
    this.size = 4,
    this.space = 0,
    this.color = '000000',
  });

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace, namespaces: namespaces, attributes: attributes);
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
