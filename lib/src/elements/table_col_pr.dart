import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';
import 'namespaces.dart';

//  <w:tcPr>
//     <w:tcW w:w="4819" w:type="dxa" />
//     <w:tcBorders>
//         <w:top w:val="single" w:sz="4" w:space="0" w:color="000000" />
//         <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
//         <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
//     </w:tcBorders>
// </w:tcPr>
class TableColPr implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tcPr';
  final TableColW w;
  final TableColBorders borders;

  @override
  Map<String, String> get attributes => {};

  const TableColPr(
      {this.w = const TableColW(w: 4819, type: 'dxa'),
      this.borders = const TableColBorders(borders: [
        TableBorder(position: 'top', val: 'single', size: 6, space: 0),
        TableBorder(position: 'start'),
        TableBorder(position: 'bottom'),
        TableBorder(position: 'end'),
      ])});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      w.buildElement(builder);
      borders.buildElement(builder);
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
