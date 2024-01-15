import 'dart:io';

import 'package:dart_docx/dart_docx.dart';

void main(List<String> args) async {

  final docx = Docx();
  docx.document.addBody(
    Body(children: [
      Paragraph(props: ParagraphPr(styleId: 'Ttulo1'), children: [
        Span('Hello world', bold: true, color: '000000'),
      ]),
      // Table.fromList([
      //   ['a', 'b', 'c'],
      //   ['a', 'b', 'c']
      // ]),
      SectPr(
          sectType: SectType(val: 'nextPage'),
          pageSize: PageSize(width: 11906, height: 11906),
          pageMargin: PageMargin(
              left: 1134,
              right: 1134,
              gutter: 0,
              header: 0,
              top: 1134,
              footer: 0,
              bottom: 1134),
          pgNumType: 'decimal',
          textDirection: 'lrTb',
          formProt: false),
    ]),
  );

  // print('main body: ${doc.toStringXml()}');

  final bytes = docx.build();
  await File('teste.docx').writeAsBytes(bytes);
}
