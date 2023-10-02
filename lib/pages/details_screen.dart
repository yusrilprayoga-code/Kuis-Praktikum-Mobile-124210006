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
    // Create a list of DataRow widgets for your table
    List<DataRow> tableRows = [
      DataRow(
        cells: [
          DataCell(Text("Disease PlantName",
              style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text(widget.place.plantName)),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text("Disease Ciri-Ciri",
              style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text(
            widget.place.nutshell[0],
            textAlign: TextAlign.justify,
          )),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text("Disease Nutshell",
              style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text(widget.place.nutshell[1])),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text("Disease Symptom",
              style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text(widget.place.symptom)),
        ],
      ),
      DataRow(
        cells: [
          DataCell(Text("Disease Id",
              style: TextStyle(fontWeight: FontWeight.bold))),
          DataCell(Text(widget.place.id)),
        ],
      ),
    ];

    // Build the DataTable widget
    DataTable dataTable = DataTable(
      columns: [
        DataColumn(
            label: Text("Attribute",
                style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label:
                Text("Value", style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: tableRows,
    );

    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), // Adjust the radius as needed
            bottomRight: Radius.circular(50), // Adjust the radius as needed
          ),
        ),
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
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              SnackBar snackBar = SnackBar(
                content: Text(
                    isFavorite ? "Added to Favorite" : "Removed from Favorite"),
                duration: Duration(seconds: 1),
                backgroundColor: isFavorite ? Colors.green : Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
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
            // Create a container for the image
            SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(20), // Add a circular border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Add shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), // Clip the image inside the container with the same border radius
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: widget.place.imgUrls,
                  fit: BoxFit.cover,
                ),
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
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Add the DataTable here
            dataTable,
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchInBrowser(widget.place.imgUrls);
        },
        backgroundColor: Colors.green,
        tooltip: "Open Image Link",
        child: Icon(Icons.open_in_browser, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, // Position at the bottom-right corner
    );
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Failed to open link: $_url');
    }
  }
}
