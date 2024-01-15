import 'dart:convert';

import 'package:dart_docx/dart_docx.dart';
import 'package:xml/src/xml/builder.dart';

// <?xml version="1.0" encoding="UTF-8"?>
// <Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
//     <Default Extension="xml" ContentType="application/xml" />
//     <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml" />
//     <Default Extension="png" ContentType="image/png" />
//     <Default Extension="jpeg" ContentType="image/jpeg" />
//     <Override PartName="/docProps/core.xml"
//         ContentType="application/vnd.openxmlformats-package.core-properties+xml" />
//     <Override PartName="/docProps/app.xml"
//         ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml" />
//     <Override PartName="/word/document.xml"
//         ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml" />
//     <Override PartName="/word/settings.xml"
//         ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml" />
//     <Override PartName="/word/styles.xml"
//         ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml" />
//     <Override PartName="/word/fontTable.xml"
//         ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml" />
//     <Override PartName="/word/_rels/document.xml.rels"
//         ContentType="application/vnd.openxmlformats-package.relationships+xml" />
//     <Override PartName="/_rels/.rels"
//         ContentType="application/vnd.openxmlformats-package.relationships+xml" />
// </Types>
// \[Content_Types].xml
class ContentTypes implements DocxBase {
  @override
  void buildElement(XmlBuilder builder) {
    throw UnimplementedError();
  }

  @override
  String get tagName => 'types';

  //
  final List<String> _items = [];
  int _imageId = 1;
  
  void addImage() {
    _items.add('<Override PartName="/word/media/image$_imageId.png" ContentType="image/png" />');
    _imageId++;
  }

  @override
  String toStringXml() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
    <Default Extension="xml" ContentType="application/xml" />
    <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml" />
    <Default Extension="png" ContentType="image/png" />
    <Default Extension="jpeg" ContentType="image/jpeg" />
    <Override PartName="/docProps/core.xml"
        ContentType="application/vnd.openxmlformats-package.core-properties+xml" />
    <Override PartName="/docProps/app.xml"
        ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml" />
    <Override PartName="/word/document.xml"
        ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml" />
        ${_items.join()}
    <Override PartName="/word/settings.xml"
        ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.settings+xml" />
    <Override PartName="/word/styles.xml"
        ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.styles+xml" />
    <Override PartName="/word/fontTable.xml"
        ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.fontTable+xml" />
    <Override PartName="/word/_rels/document.xml.rels"
        ContentType="application/vnd.openxmlformats-package.relationships+xml" />
    <Override PartName="/_rels/.rels"
        ContentType="application/vnd.openxmlformats-package.relationships+xml" />
</Types>''';
  }

  /// Xml String to bytes
  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}
