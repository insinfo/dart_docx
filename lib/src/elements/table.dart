import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';

import 'element_base.dart';
import 'namespaces.dart';

//  <w:tbl>
//     <w:tblPr>
//         <w:tblW w:w="5000" w:type="pct" />
//         <w:jc w:val="start" />
//         <w:tblInd w:w="-5" w:type="dxa" />
//         <w:tblLayout w:type="fixed" />
//         <w:tblCellMar>
//             <w:top w:w="55" w:type="dxa" />
//             <w:start w:w="55" w:type="dxa" />
//             <w:bottom w:w="55" w:type="dxa" />
//             <w:end w:w="55" w:type="dxa" />
//         </w:tblCellMar>
//     </w:tblPr>
//     <w:tblGrid>
//         <w:gridCol w:w="4819" />
//         <w:gridCol w:w="4819" />
//     </w:tblGrid>
//     <w:tr>
//         <w:trPr></w:trPr>
//         <w:tc>
//             <w:tcPr>
//                 <w:tcW w:w="4819" w:type="dxa" />
//                 <w:tcBorders>
//                     <w:top w:val="single" w:sz="4" w:space="0" w:color="000000" />
//                     <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
//                     <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
//                 </w:tcBorders>
//             </w:tcPr>
//             <w:p>
//                 <w:pPr>
//                     <w:pStyle w:val="Contedodatabela" />
//                     <w:rPr></w:rPr>
//                 </w:pPr>
//                 <w:r>
//                     <w:rPr></w:rPr>
//                 </w:r>
//             </w:p>
//         </w:tc>
class Table implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tbl';
  final TablePr props;
  final TableGrid tblGrid;

  final List<TableRow> rows;

  @override
  Map<String, String> get attributes => {};

  const Table({
    this.props = const TablePr(
      tblW: TableW(w: 5000, type: 'pct'),
      align: 'start',
      tblLayout: 'fixed',
      tableInd: TableInd(w: -5, type: 'dxa'),
      cellMargin:
          TableCellMargin(top: 55, start: 55, bottom: 55, end: 55, type: 'dxa'),
    ),
    this.tblGrid = const TableGrid(gridCols: []),
    required this.rows,
  });

  factory Table.fromList(List<List<String>> items) {
    final rows = items.map((item) {
      final cols = item
          .map((c) => TableCol(children: [
                Paragraph(props: ParagraphPr(), children: [
                  Span(c),
                ]),
              ]))
          .toList();
      return TableRow(cols: cols);
    }).toList();

    final tbl = Table(rows: rows);

    return tbl;
  }

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      props.buildElement(builder);
      tblGrid.buildElement(builder);
      rows.forEach((row) {
        row.buildElement(builder);
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
