import 'dart:convert';
import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

// <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
// <Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"
//     xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
//     <Template></Template>
//     <TotalTime>0</TotalTime>
//     <Application>LibreOffice/7.5.4.2$Windows_X86_64
//         LibreOffice_project/36ccfdc35048b057fd9854c757a8b67ec53977b6</Application>
//     <AppVersion>15.0000</AppVersion>
//     <Pages>1</Pages>
//     <Words>1</Words>
//     <Characters>5</Characters>
//     <CharactersWithSpaces>5</CharactersWithSpaces>
//     <Paragraphs>1</Paragraphs>
// </Properties>
/// \docProps\app.xml
class AppProperties implements DocxBase {
  @override
  void buildElement(XmlBuilder builder) {
    throw UnimplementedError();
  }

  @override
  String get tagName => 'properties';

  @override
  String toStringXml() {
    return '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"
    xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">
    <Template></Template>
    <TotalTime>0</TotalTime>
    <Application>LibreOffice/7.5.4.2\$Windows_X86_64
        LibreOffice_project/36ccfdc35048b057fd9854c757a8b67ec53977b6</Application>
    <AppVersion>15.0000</AppVersion>
    <Pages>1</Pages>
    <Words>1</Words>
    <Characters>5</Characters>
    <CharactersWithSpaces>5</CharactersWithSpaces>
    <Paragraphs>1</Paragraphs>
</Properties>''';
  }

  /// Xml String to bytes
  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}
