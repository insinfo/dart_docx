import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'namespaces.dart';
import 'page_size.dart';

//         <w:sectPr>
//             <w:type w:val="nextPage" />
//             <w:pgSz w:w="11906" w:h="16838" />
//             <w:pgMar w:left="1134" w:right="1134" w:gutter="0" w:header="0" w:top="1134"
//                 w:footer="0" w:bottom="1134" />
//             <w:pgNumType w:fmt="decimal" />
//             <w:formProt w:val="false" />
//             <w:textDirection w:val="lrTb" />
//         </w:sectPr>
class SectPr implements ElementBase {
  @override
  String get tagName => 'sectPr';

  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  final SectType sectType;
  final PageSize pageSize;
  final PageMargin pageMargin;
  final String pgNumType;
  final String textDirection;
  final bool formProt;

  SectPr(
      {this.sectType = const SectType(val: 'nextPage'),
      this.pageSize = const PageSize(width: 11906, height: 11906),
      this.pageMargin = const PageMargin(
          left: 1134,
          right: 1134,
          gutter: 0,
          header: 0,
          top: 1134,
          footer: 0,
          bottom: 1134),
      this.pgNumType = 'decimal',
      this.textDirection = 'lrTb',
      this.formProt = false});

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName, namespace: namespace, namespaces: namespaces,
        nest: () {
      sectType.buildElement(builder);
      pageSize.buildElement(builder);
      pageMargin.buildElement(builder);

      builder.element('pgNumType',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:fmt': pgNumType});
      builder.element('formProt',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:val': formProt.toString()});
      builder.element('textDirection',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:val': textDirection});
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

  @override
  Map<String, String> get attributes => <String, String>{};
}
