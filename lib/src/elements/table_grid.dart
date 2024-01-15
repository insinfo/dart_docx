import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'namespaces.dart';

//  <w:tblGrid>
//     <w:gridCol w:w="4819" />
//     <w:gridCol w:w="4819" />
// </w:tblGrid>
class TableGrid implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tblGrid';
  final List<TableGridCol> gridCols;

  @override
  Map<String, String> get attributes => {};

  const TableGrid({required this.gridCols});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      gridCols.forEach((gc) {
        gc.buildElement(builder);
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
