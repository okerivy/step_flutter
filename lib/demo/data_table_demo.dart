import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
           DataTable(
             //? 栏目
             columns: [
               DataColumn(
                 label: Text("Title"),
               ),
               DataColumn(
                 label: Text("Author"),
               ),
             ],
             //? 和栏目对应的每一行
             rows: [
               DataRow(
                 cells: [
                   DataCell(Text('Hello ~')),
                   DataCell(Text('zhang san')),
                 ]
               ),
               DataRow(
                 cells: [
                   DataCell(Text('Hola ~')),
                   DataCell(Text('li si')),
                 ]
               ),
               DataRow(
                 cells: [
                   DataCell(Text('您好 ~')),
                   DataCell(Text('王五')),
                 ]
               ),
             ],
           ),
          ],
        ),
      ),
    );
  }
}