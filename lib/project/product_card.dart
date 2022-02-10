import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.p_category,
    required this.p_availability,
    required this.p_name,
    required this.p_details,
    required this.p_cost,
    required this.p_img,
  }) : super(key: key);

  final String p_category;
  final String p_availability;
  final String p_name;
  final String p_details;
  final String p_cost;
  final String p_img;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 160,
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: 150,
              height: 160,
              child: Image.asset(
                p_img,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 10.0,
                bottom: 18.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: w / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              p_category,
                              style: TextStyle(
                                color:
                                    Colors.blueGrey.shade300.withOpacity(0.6),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.0,
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 8.0,
                                    bottom: 8.0),
                                child: Text(
                                  p_availability,
                                  style: TextStyle(
                                    color:
                                        Colors.grey.shade500.withOpacity(0.6),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 3,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        p_name,
                        style: TextStyle(
                          color: Colors.blue.withOpacity(0.6),
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text('$p_name - $p_details.'), //₹35,299
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.redAccent.withOpacity(0.6),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '₹$p_cost',
                        style: TextStyle(
                          color: Colors.redAccent.withOpacity(0.6),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        elevation: 3.0,
      ),
    );
  }
}
