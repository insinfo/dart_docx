import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';
import 'namespaces.dart';

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
class TableCol implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tc';
  final TableColPr props;
  final List<ElementBase> children;

  @override
  Map<String, String> get attributes => {};

  const TableCol({this.props = const TableColPr(), required this.children});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
          props.buildElement(builder);
      children.forEach((child) {
        child.buildElement(builder);
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
