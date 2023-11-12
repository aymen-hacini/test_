
import 'package:flutter/material.dart';


class ProductCard extends StatefulWidget {
  final void Function()? plus;
  final void Function()? minus;
  final double? counter;
  final List<Map> products;
  final int i;
  const ProductCard(
      {super.key,
      required this.products,
      required this.i,
      required this.counter,
      this.plus,
      this.minus});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffffb200),
          boxShadow: const [
            BoxShadow(
                blurStyle: BlurStyle.outer,
                color: Color.fromARGB(255, 255, 244, 207),
                offset: Offset(0, 0),
                blurRadius: 20),
          ],
          border: Border.all(color: const Color(0xfffff4cf), width: 2),
          borderRadius: BorderRadius.circular(15)),
      height: double.infinity,
      width: MediaQuery.sizeOf(context).width * .4,
      child: Column(children: [
        const Icon(
          Icons.abc,
          size: 70,
        ),
        Text(
          "${widget.products[widget.i]["title"]}",
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        Text("${widget.products[widget.i]["title"]}",
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: widget.plus,
                icon: const Icon(Icons.add_circle_sharp, color: Colors.white)),
            IconButton(
                onPressed: widget.minus,
                icon: const Icon(
                  Icons.remove_circle,
                  color: Colors.white,
                )),
          ],
        )
      ]),
    );
  }
}
