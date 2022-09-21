import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/models/debts_model.dart';

class CustomTile extends StatelessWidget {
  Data data;
  int i;
  CustomTile({Key? key, required this.data, required this.i}) : super(key: key);
  TextStyle fadeStyle = const TextStyle(
      fontWeight: FontWeight.w600, color: fadeWhite, fontSize: 13);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
      padding: EdgeInsets.all(10),
      color: white,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.network(
              data.img ?? "",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      data.name ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(data.amount ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: i.isEven ? orange : green))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "Until ${data.until}",
                      style: fadeStyle,
                    ),
                    Spacer(),
                    Text(
                      "Out of ${data.outOfAmount}",
                      style: fadeStyle,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
