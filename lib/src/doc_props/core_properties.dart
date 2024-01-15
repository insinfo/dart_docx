import 'dart:convert';
import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <cp:coreProperties
//     xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"
//     xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/"
//     xmlns:dcmitype="http://purl.org/dc/dcmitype/"
//     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
//     <dcterms:created xsi:type="dcterms:W3CDTF">2023-07-24T15:20:36Z</dcterms:created>
//     <dc:creator></dc:creator>
//     <dc:description></dc:description>
//     <dc:language>pt-BR</dc:language>
//     <cp:lastModifiedBy></cp:lastModifiedBy>
//     <dcterms:modified xsi:type="dcterms:W3CDTF">2023-07-24T15:21:11Z</dcterms:modified>
//     <cp:revision>1</cp:revision>
//     <dc:subject></dc:subject>
//     <dc:title></dc:title>
// </cp:coreProperties>
/// \docProps\core.xml
class CoreProperties implements DocxBase {
  @override
  void buildElement(XmlBuilder builder) {
    throw UnimplementedError();
  }

  @override
  String get tagName => 'coreProperties';

  @override
  String toStringXml() {
    return '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<cp:coreProperties
    xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dcmitype="http://purl.org/dc/dcmitype/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <dcterms:created xsi:type="dcterms:W3CDTF">2023-07-24T15:20:36Z</dcterms:created>
    <dc:creator></dc:creator>
    <dc:description></dc:description>
    <dc:language>pt-BR</dc:language>
    <cp:lastModifiedBy></cp:lastModifiedBy>
    <dcterms:modified xsi:type="dcterms:W3CDTF">2023-07-24T15:21:11Z</dcterms:modified>
    <cp:revision>1</cp:revision>
    <dc:subject></dc:subject>
    <dc:title></dc:title>
</cp:coreProperties>''';
  }

  /// Xml String to bytes
  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}
