import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  @override
  ReusableCard({@required this.colour,this.CardChild,this.func});
  final Color colour;
  final Widget CardChild;
  final Function func;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func, 
      child: Container(
        child: this.CardChild,
        height: 200,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
class ReusableCard2 extends StatelessWidget {
  @override
  ReusableCard2({@required this.w1, @required this.w2});
  final IconData w1;
  final String w2;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            w1,
            size: 80,
          ),
          SizedBox(height: 15,),
          Text(
            w2,
            style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    ),
          )
        ],
      );
    }
}