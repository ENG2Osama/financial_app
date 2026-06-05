class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String country;
  final String phone;
   double Balance=0.0;
  List<Map<String,String>> linkedBanks;

   UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.Balance,
    required this.country,
    required this.phone,
    required this.linkedBanks,
  });





  static List<Map> localUsers=[
    {
      "firstName": "Ahmed",
      "lastName": "AlAriqi",
      "email": "ahmed1023@gmail.com",
      "phone": "+999701234001",
      "country": "Noor Republic",
      "balance": 1500.50,
      "password": "Ahmed_1023",
      "linkedBanks": [
        {"bankName": "Alkuraimi Islamic Microfinance Bank", "bankNumber": "123456789"},
        {"bankName": "Tadhamon International Islamic Bank", "bankNumber": "987654321"}
      ],
    },
    {
      "firstName": "Sara",
      "lastName": "AlHashmi",
      "email": "sara2045@gmail.com",
      "phone": "+999701234002",
      "country": "Waha Kingdom",
      "balance": 3200.00,
      "password": "Sara_2045",
      "linkedBanks": [
        {"bankName": "CAC Bank", "bankNumber": "234567891"},
        {"bankName": "Yemen Bahrain Shamil Bank", "bankNumber": "876543219"}
      ],
    },
    {
      "firstName": "Khaled",
      "lastName": "AlShamiri",
      "email": "khaled3187@gmail.com",
      "phone": "+999701234003",
      "country": "Rimal Union",
      "balance": 450.75,
      "password": "Khaled_3187",
      "linkedBanks": [
        {"bankName": "Saba Islamic Bank", "bankNumber": "345678912"},
        {"bankName": "Al-Amal Microfinance Bank", "bankNumber": "765432198"}
      ],
    },
    {
      "firstName": "Fatima",
      "lastName": "AlMaqdashi",
      "email": "fatima4261@gmail.com",
      "phone": "+999701234004",
      "country": "Ofoq Republic",
      "balance": 9800.20,
      "password": "Fatima_4261",
      "linkedBanks": [
        {"bankName": "National Bank of Yemen", "bankNumber": "456789123"},
        {"bankName": "Yemen Kuwait Bank", "bankNumber": "654321987"}
      ],
    },
    {
      "firstName": "Yousef",
      "lastName": "AlAnsi",
      "email": "yousef5374@gmail.com",
      "phone": "+999701234005",
      "country": "Zumorod State",
      "balance": 120.00,
      "password": "Yousef_5374",
      "linkedBanks": [
        {"bankName": "Shamil Bank of Yemen and Bahrain", "bankNumber": "567891234"},
        {"bankName": "QNB Yemen", "bankNumber": "543219876"}
      ],
    },
    {
      "firstName": "Reem",
      "lastName": "AlQaisi",
      "email": "reem6482@gmail.com",
      "phone": "+999701234006",
      "country": "Sahab Kingdom",
      "balance": 5600.40,
      "password": "Reem_6482",
      "linkedBanks": [
        {"bankName": "Alkuraimi Islamic Microfinance Bank", "bankNumber": "678912345"},
        {"bankName": "CAC Bank", "bankNumber": "432198765"}
      ],
    },
    {
      "firstName": "Mazen",
      "lastName": "AlHakimi",
      "email": "mazen7529@gmail.com",
      "phone": "+999701234007",
      "country": "Nogoom Union",
      "balance": 230.15,
      "password": "Mazen_7529",
      "linkedBanks": [
        {"bankName": "Tadhamon International Islamic Bank", "bankNumber": "789123456"},
        {"bankName": "Saba Islamic Bank", "bankNumber": "321987654"}
      ],
    },
    {
      "firstName": "Nora",
      "lastName": "AlZubairi",
      "email": "nora8641@gmail.com",
      "phone": "+999701234008",
      "country": "Fajr Republic",
      "balance": 7400.00,
      "password": "Nora_8641",
      "linkedBanks": [
        {"bankName": "Yemen Bahrain Shamil Bank", "bankNumber": "891234567"},
        {"bankName": "National Bank of Yemen", "bankNumber": "219876543"}
      ],
    },
    {
      "firstName": "Ali",
      "lastName": "AlMatari",
      "email": "ali9752@gmail.com",
      "phone": "+999701234009",
      "country": "Qimam State",
      "balance": 15.50,
      "password": "Ali_9752",
      "linkedBanks": [
        {"bankName": "Al-Amal Microfinance Bank", "bankNumber": "912345678"},
        {"bankName": "Shamil Bank of Yemen and Bahrain", "bankNumber": "198765432"}
      ],
    },
    {
      "firstName": "Maha",
      "lastName": "AlSabri",
      "email": "maha1086@gmail.com",
      "phone": "+999701234010",
      "country": "Wadi Kingdom",
      "balance": 12500.90,
      "password": "Maha_1086",
      "linkedBanks": [
        {"bankName": "Yemen Kuwait Bank", "bankNumber": "135792468"},
        {"bankName": "QNB Yemen", "bankNumber": "864297531"}
      ],
    },
    {
      "firstName": "Hassan",
      "lastName": "AlJabri",
      "email": "hassan2194@gmail.com",
      "phone": "+999701234011",
      "country": "Bahr Union",
      "balance": 890.30,
      "password": "Hassan_2194",
      "linkedBanks": [
        {"bankName": "Saba Islamic Bank", "bankNumber": "357924681"},
        {"bankName": "Tadhamon International Islamic Bank", "bankNumber": "642813579"}
      ],
    },
    {
      "firstName": "Layan",
      "lastName": "AlOmari",
      "email": "layan3307@gmail.com",
      "phone": "+999701234012",
      "country": "Rawda Republic",
      "balance": 3100.00,
      "password": "Layan_3307",
      "linkedBanks": [
        {"bankName": "National Bank of Yemen", "bankNumber": "468135792"},
        {"bankName": "Yemen Bahrain Shamil Bank", "bankNumber": "531792468"}
      ],
    },
    {
      "firstName": "Tariq",
      "lastName": "AlSaqaf",
      "email": "tariq4418@gmail.com",
      "phone": "+999701234013",
      "country": "Amal State",
      "balance": 420.00,
      "password": "Tariq_4418",
      "linkedBanks": [
        {"bankName": "National Bank of Yemen", "bankNumber": "468135792"},
        {"bankName": "Yemen Bahrain Shamil Bank", "bankNumber": "531792468"}
      ],
    },
    {
      "firstName": "Hend",
      "lastName": "AlHaddad",
      "email": "hend5529@gmail.com",
      "phone": "+999701234014",
      "country": "Shorouq Kingdom",
      "balance": 670.45,
      "password": "Hend_5529",
      "linkedBanks": [
        {"bankName": "Shamil Bank of Yemen and Bahrain", "bankNumber": "579246813"},
        {"bankName": "Al-Amal Microfinance Bank", "bankNumber": "428613795"}
      ],
    },
    {
      "firstName": "Abdullah",
      "lastName": "AlNuaimi",
      "email": "abdullah6631@gmail.com",
      "phone": "+999701234015",
      "country": "Hilal Union",
      "balance": 2100.10,
      "password": "Abdullah_6631",
      "linkedBanks": [
        {"bankName": "QNB Yemen", "bankNumber": "681357924"},
        {"bankName": "Yemen Kuwait Bank", "bankNumber": "317924685"}
      ],
    }
  ]
 ;



}
