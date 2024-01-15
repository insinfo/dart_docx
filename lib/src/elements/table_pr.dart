import 'package:dart_docx/dart_docx.dart';
import 'package:xml/xml.dart';
import 'namespaces.dart';

// <w:tblPr>
//           <w:tblW w:w="5000" w:type="pct" />
//           <w:jc w:val="start" />
//           <w:tblInd w:w="-5" w:type="dxa" />
//           <w:tblLayout w:type="fixed" />
//           <w:tblCellMar>
//               <w:top w:w="55" w:type="dxa" />
//               <w:start w:w="55" w:type="dxa" />
//               <w:bottom w:w="55" w:type="dxa" />
//               <w:end w:w="55" w:type="dxa" />
//           </w:tblCellMar>
//       </w:tblPr>
class TablePr implements ElementBase {
  @override
  String get namespace => wordprocessingml;

  @override
  Map<String, String> get namespaces => {wordprocessingml: 'w'};

  @override
  String get tagName => 'tblPr';

  final TableW tblW;

  /// center | start | end | both
  final String align;
  final String tblLayout;
  final TableInd tableInd;
  final TableCellMargin cellMargin;

  const TablePr({
    this.tblW = const TableW(w: 5000, type: 'pct'),
    this.align = 'start',
    this.tblLayout = 'fixed',
    this.tableInd = const TableInd(w: -5, type: 'dxa'),
    this.cellMargin = const TableCellMargin(
        top: 55, start: 55, bottom: 55, end: 55, type: 'dxa'),
  });

  @override
  Map<String, String> get attributes => {};

  @override
  void buildElement(XmlBuilder builder) {
    builder.element(tagName,
        namespace: namespace,
        namespaces: namespaces,
        attributes: attributes, nest: () {
      tblW.buildElement(builder);
      builder.element('jc',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:val': align});
      tableInd.buildElement(builder);
      builder.element('tblLayout',
          namespace: namespace,
          namespaces: namespaces,
          attributes: {'w:type': tblLayout});
      cellMargin.buildElement(builder);
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

  
  // <w:tbl>
  //           <w:tblPr>
  //               <w:tblW w:w="5000" w:type="pct" />
  //               <w:jc w:val="start" />
  //               <w:tblInd w:w="-5" w:type="dxa" />
  //               <w:tblLayout w:type="fixed" />
  //               <w:tblCellMar>
  //                   <w:top w:w="55" w:type="dxa" />
  //                   <w:start w:w="55" w:type="dxa" />
  //                   <w:bottom w:w="55" w:type="dxa" />
  //                   <w:end w:w="55" w:type="dxa" />
  //               </w:tblCellMar>
  //           </w:tblPr>
  //           <w:tblGrid>
  //               <w:gridCol w:w="4819" />
  //               <w:gridCol w:w="4819" />
  //           </w:tblGrid>
  //           <w:tr>
  //               <w:trPr></w:trPr>
  //               <w:tc>
  //                   <w:tcPr>
  //                       <w:tcW w:w="4819" w:type="dxa" />
  //                       <w:tcBorders>
  //                           <w:top w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                       </w:tcBorders>
  //                   </w:tcPr>
  //                   <w:p>
  //                       <w:pPr>
  //                           <w:pStyle w:val="Contedodatabela" />
  //                           <w:rPr></w:rPr>
  //                       </w:pPr>
  //                       <w:r>
  //                           <w:rPr></w:rPr>
  //                       </w:r>
  //                   </w:p>
  //               </w:tc>
  //               <w:tc>
  //                   <w:tcPr>
  //                       <w:tcW w:w="4819" w:type="dxa" />
  //                       <w:tcBorders>
  //                           <w:top w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:end w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                       </w:tcBorders>
  //                   </w:tcPr>
  //                   <w:p>
  //                       <w:pPr>
  //                           <w:pStyle w:val="Contedodatabela" />
  //                           <w:rPr></w:rPr>
  //                       </w:pPr>
  //                       <w:r>
  //                           <w:rPr></w:rPr>
  //                       </w:r>
  //                   </w:p>
  //               </w:tc>
  //           </w:tr>
  //           <w:tr>
  //               <w:trPr></w:trPr>
  //               <w:tc>
  //                   <w:tcPr>
  //                       <w:tcW w:w="4819" w:type="dxa" />
  //                       <w:tcBorders>
  //                           <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                       </w:tcBorders>
  //                   </w:tcPr>
  //                   <w:p>
  //                       <w:pPr>
  //                           <w:pStyle w:val="Contedodatabela" />
  //                           <w:rPr></w:rPr>
  //                       </w:pPr>
  //                       <w:r>
  //                           <w:rPr></w:rPr>
  //                       </w:r>
  //                   </w:p>
  //               </w:tc>
  //               <w:tc>
  //                   <w:tcPr>
  //                       <w:tcW w:w="4819" w:type="dxa" />
  //                       <w:tcBorders>
  //                           <w:start w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                           <w:end w:val="single" w:sz="4" w:space="0" w:color="000000" />
  //                       </w:tcBorders>
  //                   </w:tcPr>
  //                   <w:p>
  //                       <w:pPr>
  //                           <w:pStyle w:val="Contedodatabela" />
  //                           <w:rPr></w:rPr>
  //                       </w:pPr>
  //                       <w:r>
  //                           <w:rPr></w:rPr>
  //                       </w:r>
  //                   </w:p>
  //               </w:tc>
  //           </w:tr>
  //       </w:tbl>