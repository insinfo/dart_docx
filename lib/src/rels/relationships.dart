import 'dart:convert';

import 'package:xml/xml.dart' as xml;
import 'package:dart_docx/dart_docx.dart';

import '../elements/namespaces.dart';

// _rels/
//    .rels
// <?xml version="1.0" encoding="UTF-8"?>
// <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
//     <Relationship Id="rId1"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles"
//         Target="styles.xml" />
//     <Relationship Id="rId2"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable"
//         Target="fontTable.xml" />
//     <Relationship Id="rId3"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings"
//         Target="settings.xml" />
// </Relationships>

// <?xml version="1.0" encoding="UTF-8"?>
// <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
//     <Relationship Id="rId1"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles"
//         Target="styles.xml" />
//     <Relationship Id="rId2"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image"
//         Target="media/image1.png" />
//     <Relationship Id="rId3"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable"
//         Target="fontTable.xml" />
//     <Relationship Id="rId4"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings"
//         Target="settings.xml" />
// </Relationships>
class Relationships implements DocxBase {
  Map<String, String> namespaces = {packageRelationships: ''};

  @override
  String get tagName => 'Relationships';
  int id = 1;

  List<Relationship> relations = [];
  late xml.XmlBuilder _xmlBuilder;

  Relationships({required this.relations}) {
    _xmlBuilder = xml.XmlBuilder();
  }

  int addStyle({String fileName = 'styles.xml'}) {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles',
        target: fileName));
    id++;
    return idRelation;
  }

  int addFontTable({String fileName = 'fontTable.xml'}) {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/fontTable',
        target: fileName));
    id++;
    return idRelation;
  }

  int addSettings({String fileName = 'settings.xml'}) {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/settings',
        target: fileName));
    id++;
    return idRelation;
  }

  int addTheme() {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/theme',
        target: 'theme$idRelation.xml'));
    id++;
    return idRelation;
  }

// <?xml version="1.0" encoding="UTF-8"?>
// <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
//     <Relationship Id="rId1"
//         Type="http://schemas.openxmlformats.org/officedocument/2006/relationships/metadata/core-properties"
//         Target="docProps/core.xml" />
//     <Relationship Id="rId2"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties"
//         Target="docProps/app.xml" />
//     <Relationship Id="rId3"
//         Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument"
//         Target="word/document.xml" />
// </Relationships>

  int addCoreProperties({String fileName = 'docProps/core.xml'}) {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officedocument/2006/relationships/metadata/core-properties',
        target: fileName));
    id++;
    return idRelation;
  }

  int addExtendedProperties({String fileName = 'docProps/app.xml'}) {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties',
        target: fileName));
    id++;
    return idRelation;
  }

  int addDocument({String fileName = 'word/document.xml'}) {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument',
        target: fileName));
    id++;
    return idRelation;
  }

  // <Relationship Id="rId2"
  //       Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image"
  //       Target="media/image1.png" />
  int _imageId = 1;
  int addImage() {
    final idRelation = id;
    relations.add(Relationship(
        id: 'rId$idRelation',
        type:
            'http://schemas.openxmlformats.org/officeDocument/2006/relationships/image',
        target: 'media/image$_imageId.png'));
    id++;
    _imageId++;
    return idRelation;
  }

  @override
  String toStringXml() {
    _xmlBuilder.processing('xml', 'version="1.0" encoding="UTF-8"');
    _xmlBuilder.element(tagName, namespaces: namespaces, nest: () {
      relations.forEach((i) {
        i.buildElement(_xmlBuilder);
      });
    });
    final relationshipsXml = _xmlBuilder.buildDocument();
    final result = relationshipsXml.toXmlString(pretty: true);
    //print(result);
    return result;
  }

  @override
  void buildElement(xml.XmlBuilder builder) {
    throw UnimplementedError();
  }

  /// Xml String to bytes
  List<int> toBytes() {
    return utf8.encode(toStringXml());
  }
}
