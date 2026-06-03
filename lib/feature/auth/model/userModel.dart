class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
   double Balance=0.0;

   UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.Balance,
  });





  static List<Map> localUsers=[
  {
  "firstName": "Liam",
  "lastName": "Smith",
  "email": "liam.smith99@gmail.com",
  "balance": 1500.50,
  "password": "pAword_L1am"
  },
  {
  "name": "Olivia Jones",
  "email": "olivia.j.88@gmail.com",
  "balance": 3200.00,
  "password": "Liv_Secure_2026"
  },
  {
    "firstName": "Noah",
    "lastName": "Miller",
  "email": "noah.miller.dev@gmail.com",
  "balance": 450.75,
  "password": "N0ah_M!ll3r_9"
  },
  {"firstName": "Emma",
    "lastName": "Davis",
  "email": "emma.davis.ui@gmail.com",
  "balance": 9800.20,
  "password": "EmMa_@_SafePass"
  },
  {"firstName": "Oliver",
    "lastName": "Wilson",
  "email": "oliver.wilson.biz@gmail.com",
  "balance": 120.00,
  "password": "Oli_Wils_#876"
  },
  {"firstName": "Ava",
    "lastName": "Taylor",
  "email": "ava.taylor.95@gmail.com",
  "balance": 5600.40,
  "password": "Ava_T_Strong_Px"
  },
  {"firstName": "Elijah",
    "lastName": "Thomas",
  "email": "elijah.t.tech@gmail.com",
  "balance": 230.15,
  "password": "El1jAh_Th0m4s!"
  },
  {"firstName": "Sophia",
    "lastName": "Moore",
  "email": "sophia.moore.design@gmail.com",
  "balance": 7400.00,
  "password": "Soph_M00re_Xyz"
  },
  {"firstName": "James",
    "lastName": "Jackson",
  "email": "james.j.92@gmail.com",
  "balance": 15.50,
  "password": "Jam3s_J@ckson_9"
  },
  {"firstName": "Isabella",
    "lastName": "White",
  "email": "isabella.w.finance@gmail.com",
  "balance": 12500.90,
  "password": "Isa_Wh1te_Locked"
  },
  {"firstName": "Benjamin",
    "lastName": "Harris",
  "email": "benjamin.harris.90@gmail.com",
  "balance": 890.30,
  "password": "Ben_Harr1s_#2026"
  },
  {"firstName": "Mia",
    "lastName": "Martin",
  "email": "mia.martin.arts@gmail.com",
  "balance": 3100.00,
  "password": "Mia_M@rtin_Secure"
  },
  {"firstName": "Lucas",
    "lastName": "Clark",
  "email": "lucas.clark.code@gmail.com",
  "balance": 420.00,
  "password": "Luc4s_Cl@rk_Pass"
  },
  {"firstName": "Charlotte",
    "lastName": "Lewis",
  "email": "charlotte.l.94@gmail.com",
  "balance": 670.45,
  "password": "Char_Lew1s_94!!"
  },
  {"firstName": "Henry",
    "lastName": "Walker",
  "email": "henry.walker.sales@gmail.com",
  "balance": 2100.10,
  "password": "HenRy_W@lker_88"
  }
  ];

}
