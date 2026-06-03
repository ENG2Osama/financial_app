class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String country;
  final String phone;
   double Balance=0.0;

   UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.Balance,
    required this.country,
    required this.phone,
  });





  static List<Map> localUsers=[
    {
      "firstName": "Ahmed",
      "lastName": "AlAriqi",
      "email": "ahmed1023@gmail.com",
      "phone": "+999701234001",
      "country": "Noor Republic",
      "balance": 1500.50,
      "password": "Ahmed_1023"
    },
    {
      "firstName": "Sara",
      "lastName": "AlHashmi",
      "email": "sara2045@gmail.com",
      "phone": "+999701234002",
      "country": "Waha Kingdom",
      "balance": 3200.00,
      "password": "Sara_2045"
    },
    {
      "firstName": "Khaled",
      "lastName": "AlShamiri",
      "email": "khaled3187@gmail.com",
      "phone": "+999701234003",
      "country": "Rimal Union",
      "balance": 450.75,
      "password": "Khaled_3187"
    },
    {
      "firstName": "Fatima",
      "lastName": "AlMaqdashi",
      "email": "fatima4261@gmail.com",
      "phone": "+999701234004",
      "country": "Ofoq Republic",
      "balance": 9800.20,
      "password": "Fatima_4261"
    },
    {
      "firstName": "Yousef",
      "lastName": "AlAnsi",
      "email": "yousef5374@gmail.com",
      "phone": "+999701234005",
      "country": "Zumorod State",
      "balance": 120.00,
      "password": "Yousef_5374"
    },
    {
      "firstName": "Reem",
      "lastName": "AlQaisi",
      "email": "reem6482@gmail.com",
      "phone": "+999701234006",
      "country": "Sahab Kingdom",
      "balance": 5600.40,
      "password": "Reem_6482"
    },
    {
      "firstName": "Mazen",
      "lastName": "AlHakimi",
      "email": "mazen7529@gmail.com",
      "phone": "+999701234007",
      "country": "Nogoom Union",
      "balance": 230.15,
      "password": "Mazen_7529"
    },
    {
      "firstName": "Nora",
      "lastName": "AlZubairi",
      "email": "nora8641@gmail.com",
      "phone": "+999701234008",
      "country": "Fajr Republic",
      "balance": 7400.00,
      "password": "Nora_8641"
    },
    {
      "firstName": "Ali",
      "lastName": "AlMatari",
      "email": "ali9752@gmail.com",
      "phone": "+999701234009",
      "country": "Qimam State",
      "balance": 15.50,
      "password": "Ali_9752"
    },
    {
      "firstName": "Maha",
      "lastName": "AlSabri",
      "email": "maha1086@gmail.com",
      "phone": "+999701234010",
      "country": "Wadi Kingdom",
      "balance": 12500.90,
      "password": "Maha_1086"
    },
    {
      "firstName": "Hassan",
      "lastName": "AlJabri",
      "email": "hassan2194@gmail.com",
      "phone": "+999701234011",
      "country": "Bahr Union",
      "balance": 890.30,
      "password": "Hassan_2194"
    },
    {
      "firstName": "Layan",
      "lastName": "AlOmari",
      "email": "layan3307@gmail.com",
      "phone": "+999701234012",
      "country": "Rawda Republic",
      "balance": 3100.00,
      "password": "Layan_3307"
    },
    {
      "firstName": "Tariq",
      "lastName": "AlSaqaf",
      "email": "tariq4418@gmail.com",
      "phone": "+999701234013",
      "country": "Amal State",
      "balance": 420.00,
      "password": "Tariq_4418"
    },
    {
      "firstName": "Hend",
      "lastName": "AlHaddad",
      "email": "hend5529@gmail.com",
      "phone": "+999701234014",
      "country": "Shorouq Kingdom",
      "balance": 670.45,
      "password": "Hend_5529"
    },
    {
      "firstName": "Abdullah",
      "lastName": "AlNuaimi",
      "email": "abdullah6631@gmail.com",
      "phone": "+999701234015",
      "country": "Hilal Union",
      "balance": 2100.10,
      "password": "Abdullah_6631"
    }
  ]
 ;

}
