import 'dart:convert';

import 'package:equipe_basketball_with_api/components/produit_widget.dart';
import 'package:equipe_basketball_with_api/models/produit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

List<Produit> produits =[];

  // liste des produits
  Future getProduit() async{
    var response = await http.get(Uri.https("dummyjson.com", "products"));
    var jsonData = jsonDecode(response.body);
    print(jsonData["products"][0]);
    for (var produit_api in jsonData["products"]) {
      final produit = Produit(
        image: produit_api["images"][0], nomProduit: produit_api["title"], rating: produit_api["rating"], prix: produit_api["price"], categorie: produit_api["category"], stock: produit_api["stock"]);
    produits.add(produit);
    print(produits);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LISTE DES PRODUITS",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getProduit(),
        builder:(context, snapshot) {
          // si chargement terminé ? affichage des produits
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
              itemCount: produits.length,
              itemBuilder: ((context, index) {
                return ProduitItem(
                  image: produits[index].image, 
                  nomProduit: produits[index].nomProduit, 
                  rating: produits[index].rating, 
                  categorie: produits[index].categorie, 
                  prix: produits[index].prix, 
                  stock: produits[index].stock
                );
              })
              );
          }else{
            return Center(
              child: CircularProgressIndicator(
              ),
            );
          }
        }
      )
    );
  }
}
