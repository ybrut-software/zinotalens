import 'package:flutter/material.dart';
import 'package:zinotalens/widgets/values.dart';

Widget addressViewHolder() => Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 16),
      decoration: contentContainerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: _buildPopupMenu(),
          ),
          Text(
            "Roshan Nahak",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 12),
          Text(
            "SC-MQ, QN-157, tulsi mandir odiya daffai, Government Girls Higher Secondary School,",
            style: addressTextStyle(),
          ),
          Text(
            "Dumanhill, Chirimiri, Chhattisgarh - 497557",
            style: addressTextStyle(),
          ),
          SizedBox(height: 10),
          Text(
            "8319312145",
            style: addressTextStyle(),
          )
        ],
      ),
    );

_buildPopupMenu() {
  return Container(
    height: 20,
    width: 14,
    child: PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.more_vert),
      splashRadius: 10,
      iconSize: 16,
      itemBuilder: (context) => [
        PopupMenuItem(
            child: Text("Edit"),
            height: 30,
            textStyle: TextStyle(fontSize: 12, color: Colors.black)),
        PopupMenuItem(
            child: Text("Remove"),
            height: 30,
            textStyle: TextStyle(fontSize: 12, color: Colors.black)),
      ],
    ),
  );
}
