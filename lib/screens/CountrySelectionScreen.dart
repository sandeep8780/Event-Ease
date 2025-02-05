import 'package:eventease/screens/sign_in_screen.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountrySelectionScreen extends StatefulWidget {
  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  final List<Map<String, String>> countries = [
   {'name': 'United States', 'code': 'us'},
    {'name': 'India', 'code': 'in'},
    {'name': 'Canada', 'code': 'ca'},
    {'name': 'Australia', 'code': 'au'},
    {'name': 'United Kingdom', 'code': 'gb'},
    {'name': 'China', 'code': 'cn'},
    {'name': 'France', 'code': 'fr'},
    {'name': 'Germany', 'code': 'de'}, // Added Germany
    {'name': 'Brazil', 'code': 'br'}, // Added Brazil
    {'name': 'South Africa', 'code': 'za'}, // Added South Africa
    {'name': 'Mexico', 'code': 'mx'}, // Added Mexico
    {'name': 'Japan', 'code': 'jp'}, // Added Japan
    {'name': 'Italy', 'code': 'it'}, // Added Italy
   {'name': 'Spain', 'code': 'es'}, // Added Spain
    {'name': 'Russia', 'code': 'ru'}, // Added Russia
   {'name': 'Argentina', 'code': 'ar'}, // Added Argentina
    {'name': 'Saudi Arabia', 'code': 'sa'}, // Added Saudi Arabia
    {'name': 'Egypt', 'code': 'eg'}, // Added Egypt
  ];

  List<Map<String, String>> filteredCountries = [];
  TextEditingController _searchController = TextEditingController();
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    filteredCountries = countries; // Initially display all countries
    _searchController.addListener(_filterCountries);
  }

  void _filterCountries() {
    setState(() {
      filteredCountries = countries
          .where((country) => country['name']!
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }
  void _saveSelectedCountry() {
    if (selectedCountry != null) {
      // Navigate to SignInScreen with the selected country as data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a country')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Country'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search country',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'assets/icons/${filteredCountries[index]['code']!.toLowerCase()}.png', // Flag from assets
                      height: 30, // Adjust the height as needed
                    ),
                    title: Text(filteredCountries[index]['name']!),
                    onTap: () {
                      setState(() {
                        selectedCountry = filteredCountries[index]['name'];
                      });
                    },
                    selected: selectedCountry == filteredCountries[index]['name'],
                    selectedTileColor: Colors.blue.withOpacity(0.2),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveSelectedCountry, // Pop out with the selected country
              icon: Icon(Icons.save),
              label: Text('Save and Continue'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
