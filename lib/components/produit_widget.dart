import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProduitItem extends StatelessWidget {
  ProduitItem(
      {Key? key,
      required this.image,
      required this.nomProduit,
      required this.rating,
      required this.categorie,
      required this.prix,
      required this.stock})
      : super(key: key);

  final String image;
  final String nomProduit;
  final dynamic rating;
  final String categorie;
  final dynamic prix;
  final dynamic stock;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.deepOrange[500]),
          height: 120,
          child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.deepOrange[600],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Colone de l'image
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                                image: NetworkImage(
                                    image))),
                      )
                    ],
                  ),
                  // Colone du nom de produit et notation
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          nomProduit,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      RatingBarIndicator(
                        rating: rating.toDouble(),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                  //Colone du prix et Favoris
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 100,
                          height: 35,
                          child: Text(
                            categorie,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        prix.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      stock < 50? Icon(
                        Icons.favorite_border,
                      ):Icon(
                        Icons.favorite,
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
