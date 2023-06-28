import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:unoquide/constants/constants.dart';

import '../../../../config/shared-services.dart';
import '../../../../models/studentModel.dart';

class Notes extends StatefulWidget {
  Notes({Key? key, required this.notes, required this.subjectName})
      : super(key: key);
  List<Assignment> notes = [];
  String subjectName;

  @override
  State<Notes> createState() => _NotesState(notes);
}

class _NotesState extends State<Notes> {
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();
  List<Assignment> notes = [];
  String Scho = "School Name";
  _NotesState(this.notes);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .1,
        ),
        const Center(
          child: Text(
            "Notes",
            style: TextStyle(
                color: blackColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway'),
          ),
        ),
        Text(
          widget.subjectName,
          style: const TextStyle(
              color: blackColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway'),
        ),
        Expanded(
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this would produce 2 rows.
            crossAxisSpacing: 5.0,

            mainAxisSpacing: 5.0,
            crossAxisCount: 3,
            // Generate 100 Widgets that display their index in the List
            children: List.generate(notes.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PDF(
                              enableSwipe: true,
                              swipeHorizontal: true,
                              autoSpacing: true,
                              pageFling: true,
                              nightMode: false,
                              onPageChanged: (int? current, int? total) =>
                                  _pageCountController
                                      .add('${current! + 1} - $total'),
                              onViewCreated:
                                  (PDFViewController pdfViewController) async {
                                _pdfViewController.complete(pdfViewController);
                                final int currentPage =
                                    await pdfViewController.getCurrentPage() ??
                                        0;
                                final int? pageCount =
                                    await pdfViewController.getPageCount();
                                _pageCountController
                                    .add('${currentPage + 1} - $pageCount');
                              }).cachedFromUrl(
                            notes[index].file!.location!,
                            placeholder: (progress) => Center(
                              child: CircularProgressIndicator(
                                value: progress,
                              ),
                            ),
                            errorWidget: (dynamic error) =>
                                Center(child: Text(error.toString())),
                          )));
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF2a9d8f),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(notes[index].name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway')),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
