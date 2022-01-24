import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../src.dart';

double screenHeight = 0;
double screenWidth = 0;

alertShowTodo(BuildContext context, ToDoListModel tr) {
  screenHeight = MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;

  showDialog(
    barrierColor: Colors.white70,
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
      content: details(context, tr),
      actions: [
        Container(
          margin: const EdgeInsets.only(bottom: 30.0),
          child: ButonnWidget(
              text: 'Ok',
              onpressed: () {
                Navigator.pop(context);
              }
              // child: ButonnWidget(text:'ok', onPressed:(){
              //     Navigator.pop(context);
              //   },
              // child: ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child:Text(
              //     "OK",
              //     textAlign: TextAlign.center,
              //     style: GoogleFonts.openSans(color: Colors.white),
              //   ),
              //   style: ButtonStyle(
              //     minimumSize: MaterialStateProperty.all(const Size(100, 50)),
              //     backgroundColor:
              //         MaterialStateProperty.all(const Color(0xFF00E676)),
              //   ),
              // ),
              ),
        ),
      ],
    ),
  );
}

details(BuildContext context, ToDoListModel tr) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    height: screenHeight * 0.55,
    width: screenWidth * 0.90,
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tr.icone,
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Text(
                tr.title,
                style: TextStyles.trTitleAlert,
                // style: const TextStyle(
                //     fontSize: 15,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.green),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('dd MMM').format(tr.date),
                    style: TextStyles.dateFormatAlert,
                    // style: const TextStyle(
                    //     fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    tr.time.format(context),
                    textAlign: TextAlign.end,
                    style: TextStyles.trTimeAlert,
                    // style: const TextStyle(
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w600,
                    //     color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Descrição',
                style: TextStyles.titleDescriptionAlert,
                // style: GoogleFonts.openSans(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tr.descricao,
                style: TextStyles.trDescriptionAlert,
                // style: const TextStyle(
                //     fontSize: 15,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
