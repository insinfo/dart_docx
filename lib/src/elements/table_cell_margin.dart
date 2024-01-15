import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';
import 'namespaces.dart';

//<w:tblCellMar>
//                   <w:top w:w="55" w:type="dxa" />
//                   <w:start w:w="55" w:type="dxa" />
//                   <w:bottom w:w="55" w:type="dxa" />
//                   <w:end w:w="55" w:type="dxa" />
//               </w:tblCellMar>
class TableCellMargin implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tblCellMar';
  final int top;
  final int start;
  final int bottom;
  final int end;
  final String type;

  @override
  Map<String, String> get attributes => {};

  const TableCellMargin(
      {this.top = 55,
      this.start = 55,
      this.bottom = 55,
      this.end = 55,
      this.type = 'dxa'});

  @override
  void buildElement(XmlBuilder builder) {
    //<w:tblCellMar>
//                   <w:top w:w="55" w:type="dxa" />
//                   <w:start w:w="55" w:type="dxa" />
//                   <w:bottom w:w="55" w:type="dxa" />
//                   <w:end w:w="55" w:type="dxa" />
//               </w:tblCellMar>

    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      builder.element('top',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:w': '$top', 'w:type': '$type'});
      builder.element('start',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:w': '$start', 'w:type': '$type'});
      builder.element('bottom',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:w': '$bottom', 'w:type': '$type'});
      builder.element('end',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:w': '$end', 'w:type': '$type'});
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
