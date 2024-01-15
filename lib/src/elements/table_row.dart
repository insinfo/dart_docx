import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

// <w:tr>
//     <w:trPr></w:trPr>
//     <w:tc>
//         <w:tcPr>
//             <w:tcW w:w="4819" w:type="dxa" />
//             <w:tcBorders>
//                 <w:top w:val="single" w:sz="4" w:space="0" w:color="000000" />
//                 <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
//                 <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
//             </w:tcBorders>
//         </w:tcPr>
//         <w:p>
//             <w:pPr>
//                 <w:pStyle w:val="Contedodatabela" />
//                 <w:rPr></w:rPr>
//             </w:pPr>
//             <w:r>
//                 <w:rPr></w:rPr>
//             </w:r>
//         </w:p>
//     </w:tc>
// </w:tr>
class TableRow implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tr';
  final List<TableCol> cols;

  @override
  Map<String, String> get attributes => {};

  const TableRow({required this.cols});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      cols.forEach((col) {
        col.buildElement(builder);
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
