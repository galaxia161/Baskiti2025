// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:baskiti/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class EditProfilePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
 final List<String> villes = [
    "Sidi Allal Tazi",
    "Sidi Allal Al Bahraoui",
    "Sidi Ali Ban Hamdouche",
    "Sidi Addi",
    "Sid Zouin",
    "Sidi Abdallah Ghiat",
    "Settat",
    "Sefrou",
    "Selouane",
    "Sebt Gzoula",
    "Sebt Jahjouh",
    "Sebt El Maarif",
    "Sale",
    "SEBT EL GUERDANE",
    "Sala El Jadida",
    "Saidia",
    "Safi",
    "Sabaa Aiyoun",
    "Rommani",
    "Rissani",
    "Ribate El Kheir",
    "Ras El Ma",
    "Ras El Ain",
    "Rabat",
    "Ounagha",
    "Oulmes",
    "Ouled Youssef",
    "Ouled Tayeb",
    "Oulad Zbair",
    "Oulad Teima",
    "Oulad MRah",
    "Oulad M Barek",
    "Oulad H Riz Sahel",
    "Oulad Ghadbane",
    "Oulad Frej",
    "Oulad Berhil",
    "Oulad Ayad",
    "Oulad Amrane",
    "Oukaimeden",
    "Oujda",
    "Ouezzane",
    "Oued Zem",
    "Oued Laou",
    "Oued Amlil",
    "Ouarzazate",
    "Oualidia",
    "Nouaceur",
    "Nhima",
    "Nador",
    "Moulay Idriss Zerhoun",
    "Moulay Bousselham",
    "Moulay Ali Cherif",
    "Moqrisset",
    "Mohammadia",
    "Missour",
    "Mirleft",
    "Midelt",
    "Midar",
    "Melloussa",
    "Meknes",
    "Mehdia",
    "Mediouna",
    "Mdiq",
    "Mechra Bel Ksiri",
    "Martil",
    "Marrakech",
    "Madagh",
    "Mrirt",
    "Lqliaa",
    "Lixus",
    "Larache",
    "Lalla Mimouna",
    "Lagouira",
    "Laayoune",
    "Laattaouia",
    "Ksar Sghir",
    "Ksar el Kebir",
    "klaat Megouna",
    "Khouribga",
    "Khenifra",
    "Khenichet",
    "Khemisset",
    "Khemis Zemamra",
    "Khemis Sahel",
    "Khemis Dades",
    "Ketama",
    "Kenitra",
    "Kehf Nsour",
    "Kattara",
    "Kassita",
    "Kasba Tadla",
    "Karia Ba Mohammed",
    "Jorf El Melha",
    "Jorf",
    "Jerada",
    "Jemaa Sahim",
    "Jebha",
    "Itzer",
    "Inseka",
    "Inezgane",
    "Imzouren",
    "Imouzzer Kandar",
    "Immouzer Marmoucha",
    "Imintanoute",
    "Imilili",
    "Imilchil",
    "Ihddaden",
    "Ighrem Nougdal",
    "Ifrane",
    "Harhoura",
    "Haj Kaddour",
    "Hagunia",
    "Had Kourt",
    "Guisser",
    "Guerguerat",
    "Guercif",
    "Guelta Zemmour",
    "Guelmim",
    "Goulmima",
    "Fquih Ben Salah",
    "Fnideq",
    "Figuig",
    "Fes",
    "Farcia",
    "Essaouira",
    "Errachidia",
    "Erfoud",
    "Er Rich",
    "El Ouatia",
    "El Menzel",
    "El Mansouria",
    "El Kelaa des sraghna",
    "El Jadida",
    "El Hanchane",
    "El Hajeb",
    "El Guerdane",
    "El Gara",
    "El Borouj",
    "El Aioun Sidi Mellouk",
    "Driouch",
    "Douar Bel Aguide",
    "Deroua",
    "Demnate",
    "Debdou",
    "Dcheira",
    "Dar Kebdani",
    "Dar Gueddari",
    "Dar Bouaaza",
    "Dakhla",
    "Chichaoua",
    "Chemaia",
    "Chefchaouen",
    "Chalwa",
    "Casablanca",
    "Brikcha",
    "Bradia",
    "Bouznika",
    "Bouskoura",
    "Boumia",
    "Boumalne Dades",
    "Boulemane",
    "Bouknadel",
    "Boujniba",
    "Boujdour",
    "Boujad",
    "Bouizakarne",
    "Bouguedra",
    "Boufakrane",
    "Boudnib",
    "Bouarfa",
    "Bouanane",
    "Bou Craa",
    "Bni Hadifa",
    "Bni Drar",
    "Bni Bouayach",
    "Bir Lehlou",
    "Bir Gandouz",
    "Biougra",
    "Bhalil",
    "Berrechid",
    "Berkane",
    "Beni Tadjit",
    "Beni Mellal",
    "Beni Chiker",
    "Beni Ansar",
    "Benguerir",
    "Ben Yakhlef",
    "Ben Taieb",
    "Ben Slimane",
    "Ben Ahmed",
    "Bab Taza",
    "Bab Berred",
    "Azrou",
    "Azilal",
    "Azemmour",
    "Assahrij",
    "Assa",
    "Asilah",
    "Arfoud",
    "Arbaoua",
    "Aoufous",
    "Amizmiz",
    "Amgala",
    "Amalou Ighriben",
    "Al Hoceima",
    "Al Aaroui",
    "Aklim",
    "Ajdir",
    "Ait Ourir",
    "Ait Melloul",
    "Ait Ishaq",
    "Ait Iaaza",
    "Ait Daoud",
    "Ait Bouhlal",
    "Ait Boubidmane",
    "Ait Benhaddou",
    "Ait Baha",
    "Ain Taoujdate",
    "Ain Jemaa",
    "Ain Harrouda",
    "Ain Erreggada",
    "Ain Dorij",
    "Ain Defali",
    "Ain Bni Mathar",
    "Ain Aouda",
    "Ain Aleuh",
    "Ahfir",
    "Aguelmous",
    "Agourai",
    "Agdz",
    "Agadir",
    "Afourar",
    "Sidi Bennour",
    "Sidi Bettache",
    "Sidi Bibi",
    "Sidi Bou Othmane",
    "Sidi Boubker",
    "Sidi Ifni",
    "Sidi Jaber",
    "Sidi Kacem",
    "Sidi Lyamani",
    "Sidi Oud tazla",
    "Sidi Rahhal",
    "Sidi Slimane",
    "Sidi Smail",
"Sidi Taibi",
"Sidi Yahya el Gharb",
"Skhirat",
"Skhour Rehamna",
"Smara",
"Soualem",
"Souk Sebt Oulad Nemma",
"Souq Larba al Gharb",
"Taddert",
"Tafarsit",
"Tafetachte",
"Tafraout",
"Taghjijt",
"Tahala",
"Tahannaout",
"Tainaste",
"Taliouine",
"Talmest",
"Talssint",
"Tamallalt",
"Tamanar",
"Tamansourt",
"Tameslouht",
"Tamesna",
"Tan Tan",
"Tanger",
"Taounate",
"Taourirte",
"Tarfaya",
"Targuist",
"Taroudant",
"Tata",
"Taza",
"Taznakht",
"Telouet",
"Temara",
"Temsia",
"Tendrara",
"Tetouan",
"Thar Es Souk",
"Tichla",
"Tidass",
"Tifariti",
"Tifelt",
"Tiflet",
"Tighza",
"Timahdite",
"Tinejdad",
"Tinghir",
"Tinmel",
"Tissa",
"Tit Mellil",
"Tiznit",
"Tiztoutine",
"Torres de Alcala",
"Tounfite",
"Youssoufia",
"Zag",
"Zagora",
"Zaio",
"Zaouiat Cheikh",
"Zeghanghane",
"Zemamra"
  ];
  
  String? ville;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    TextEditingController _username = TextEditingController(text: userProvider.username );
    TextEditingController _email = TextEditingController(text: userProvider.email );
    TextEditingController _lastname = TextEditingController(text: userProvider.last_name );
    TextEditingController _firstname = TextEditingController(text: userProvider.first_name );
    TextEditingController _address_1 = TextEditingController(text: userProvider.address_1 );
    TextEditingController _phone_1 = TextEditingController(text: userProvider.phone_1 );
    return Scaffold(
      appBar: AppBar(
        title: Text('Editer mon profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1
              Text(
                'Informations client',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer le mot de passe';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  labelText: 'Nom à afficher',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Section 2
              Text(
                "Détails d'expédition",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _lastname,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _firstname,
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _address_1,
                decoration: InputDecoration(
                  labelText: 'Adresse',
                  border: OutlineInputBorder(),
                ),
              ),
            SizedBox(height: 10),
             DropdownButtonFormField<String>(
            value: userProvider.city,
            hint: const Text("Choisir une ville"),
            decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        ),
            items: villes.map((String ville) {
              return DropdownMenuItem<String>(
                value: ville,
                child: Text(ville),
              );
            }).toList(),
            onChanged: (String? newValue) { 
                ville = newValue;
             },
          ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phone_1,
                decoration: InputDecoration(
                  labelText: 'Téléphone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
             ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Traiter les données ici
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Formulaire soumis avec succès !')),
                      );
                    }
                  },
                  child: Text('Soumettre'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
