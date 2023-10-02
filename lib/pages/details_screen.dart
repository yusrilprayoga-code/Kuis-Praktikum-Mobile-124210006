import 'package:flutter/material.dart';
import 'package:kuis_praktikum_124210006/constants/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.place});
  final Diseases place;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // back button
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              SnackBar snackBar = SnackBar(
                content: Text("Back to Home"),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.green,
          title: Text(
            "Halaman Detail",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            //favorite
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
                SnackBar snackBar = SnackBar(
                  content: Text(isFavorite
                      ? "Added to Favorite"
                      : "Removed from Favorite"),
                  duration: Duration(seconds: 1),
                  backgroundColor: isFavorite ? Colors.green : Colors.red,
                );
                //scaffodmessenger color
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              //icon favorite
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //buatkan image keren
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.place.imgUrls),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high),
                ),
              ),
              SizedBox(height: 16),

              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  widget.place.name,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Disease PlantName",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.place.plantName,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Disease Ciri-Ciri",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.place.nutshell[0],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Disease Nutshell",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.place.nutshell[1],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Disease  Symptom",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.place.symptom,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                "Disease Id",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.place.id,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        bottomNavigationBar:
            //floating button to home
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: FloatingActionButton(
                  onPressed: () {
                    launchUrl(Uri.parse(widget.place.imgUrls));
                  },
                  backgroundColor: Colors.green,
                  child: Icon(Icons.help, color: Colors.black),
                )));
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Gagal Membuka Link : $_url');
    }
  }
}
