import 'package:archive/archive.dart';
import 'package:dart_docx/dart_docx.dart';

class Docx {
  final appProperties = AppProperties();
  final coreProperties = CoreProperties();
  final types = ContentTypes();

  final style = Styles();
  final settings = Settings();
  final fontTable = FontTable();

  final relationsWord = Relationships(relations: []);
  final rootRelations = Relationships(relations: []);

  late Document _document;

  Document get document => _document;

  Docx() {
    _document = Document(children: []);

    relationsWord.addStyle();
    relationsWord.addFontTable();
    relationsWord.addSettings();

    rootRelations.addCoreProperties();
    rootRelations.addExtendedProperties();
    rootRelations.addDocument();
  }
  List<int> build() {
    final archive = Archive();

    final styleBytes = style.toBytes();
    final settingsBytes = settings.toBytes();
    final fontTableBytes = fontTable.toBytes();
    final documentBytes = _document.toBytes();
    final typesBytes = types.toBytes();
    final appPropertiesBytes = appProperties.toBytes();
    final corePropertiesBytes = coreProperties.toBytes();
    final relationsWordBytes = relationsWord.toBytes();
    final rootRelationsBytes = rootRelations.toBytes();

    archive
        .addFile(ArchiveFile('word/styles.xml', styleBytes.length, styleBytes));
    archive.addFile(
        ArchiveFile('word/settings.xml', settingsBytes.length, settingsBytes));
    archive.addFile(ArchiveFile(
        'word/fontTable.xml', fontTableBytes.length, fontTableBytes));
    archive.addFile(
        ArchiveFile('word/document.xml', documentBytes.length, documentBytes));

    archive.addFile(ArchiveFile('word/_rels/document.xml.rels',
        relationsWordBytes.length, relationsWordBytes));

    archive.addFile(ArchiveFile(
        '_rels/.rels', rootRelationsBytes.length, rootRelationsBytes));

    archive.addFile(ArchiveFile(
        'docProps/app.xml', appPropertiesBytes.length, appPropertiesBytes));

    archive.addFile(ArchiveFile(
        'docProps/core.xml', corePropertiesBytes.length, corePropertiesBytes));

    archive.addFile(
        ArchiveFile('[Content_Types].xml', typesBytes.length, typesBytes));

    final encodedzipdata = ZipEncoder().encode(archive);
    return encodedzipdata ?? [];
  }
}
