import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:untitled2/homepage.dart';
import 'package:untitled2/sql/sql.dart';
import 'package:untitled2/style/appstyle.dart';
import 'package:untitled2/update/updated.dart';

class Datacard extends StatefulWidget  {
  const Datacard({super.key, required this.title, required this.content, required this.data, required this.id});
  final String title ;
  final String content ;
  final String data ;
  final int id ;

  @override
  State<Datacard> createState() => _DatacardState();
}

class _DatacardState extends State<Datacard> {
  Color randomBackgroundColor = Appstyle.cardscolor[Random().nextInt(Appstyle.cardscolor.length)];
  Sql sql = Sql() ;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
          onTap: () {
            Get.to( () => Updated(id: widget.id, color: Colors.orange ) 
              , transition: Transition.fadeIn
            ) ;
          } ,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            color: Colors.orange[100] , // Background color of the cardColors.orange[100]
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title.length > 4 ? '${widget.title.substring(0, 4)}...' : widget.title,
                        style: Appstyle.maintittle
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          widget.content.length > 6 ? '${widget.content.substring(0, 6)}...' : widget.content,
                          style: Appstyle.maincontent,
                        ),
                      ),
                    ],
                  ),
                  // Right side: Delete icon and date
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete,),
                        onPressed: ()  {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.rightSlide,
                            title: 'Warning',
                            desc: 'are you want to delete this note.............',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              int response = await sql.deleteData('''
                                DELETE FROM NOTES WHERE id = ${widget.id}
                            ''') ;
                            if (response > 0) {
                              Get.snackbar('Success', 'Note Delete successfully.');
                              Get.offAll(() => Homepage() , transition: Transition.circularReveal);
                            } else {
                              Get.snackbar('Error', 'Failed to Delete note.');
                            }
                            },
                          ).show();
                            
                        },
                        color: Colors.black,
                      ),
                      SizedBox(height: 30), // Adjust size to align properly
                      Text(
                        widget.data,
                        style: Appstyle.datetittle,
                        overflow: TextOverflow.values[0],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        )
      );
  }
}