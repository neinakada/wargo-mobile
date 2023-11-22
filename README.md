# wargo

## Tugas 7
- [x]  Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
    - Membuka terminal pada direktori untuk menyimpan project flutter
        ```
        flutter create wargo
        cd wargo
        ```
    - Menjalankan project dengan menuliskan code dibawah pada terminal
      ```
      flutter run
      ```
    - Mengenable web support
      ```
      flutter config --enable-web
      ```

- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:
    - Menambahkan kode dibawah pada class `MyHomePage` pada file `menu.dart`
        ```
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Wargo',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor:Colors.indigo,
              ),
              body: SingleChildScrollView(
                // Widget wrapper yang dapat discroll
                child: Padding(
                  padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                  child: Column(
                    // Widget untuk menampilkan children secara vertikal
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                        child: Text(
                          'Wargo Inventory', // Text yang me
                kan toko
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Grid layout
                      GridView.count(
                        // Container pada card kita.
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((WargoItem item) {
                          // Iterasi untuk setiap item
                          return WargoCard(item);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ```
    - Melihat daftar item (Lihat Item)
        - Menambahkan code dibawah pada class `MyHomePage`
            ```
            ...
            final List<WargoItem> items = [
            WargoItem("Lihat Produk", Icons.checklist),
            ...
            ];
            ...
            ```

    - Menambah item (Tambah Item)
        - Menambahkan code dibawah pada class `MyHomePage`
            ```
                final List<WargoItem> items = [
                ...
                WargoItem("Tambah Produk", Icons.add_shopping_cart),
                ...
                ];
            ```
            ```

    - Logout (Logout)
        - Menambahkan code dibawah pada class `MyHomePage`
            ```
            final List<WargoItem> items = [
            ...
            WargoItem("Logout", Icons.logout),
            ...
            ];
            ```

- [x] Memunculkan Snackbar dengan tulisan:
    - "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
    - "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
    - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

  Menambahkan kode dibawah pada class `WargoCard extends StatelessWidget`
  ```
    Widget build(BuildContext context){
      return Material(
        ...
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
        ...
        )
    )
    }
  ```

- [x] Menjawab beberapa pertanyaan berikut pada README.md pada root folder.
    - Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

      Dalam konteks pengembangan aplikasi Flutter, perbedaan utama antara Stateless dan Stateful Widget adalah sebagai berikut:

      **Stateless Widget** adalah jenis widget yang tetap dan tidak memiliki keadaan atau state yang dapat berubah. Konfigurasi widget ini diinisialisasi pada saat pembuatan dan tidak dapat diubah selama aplikasi berjalan. Stateless Widget biasanya digunakan ketika kita hanya perlu menampilkan data yang bersifat statis atau ketika tidak ada kebutuhan untuk mengubah nilai widget tersebut seperti teks. Stateless widget bersifat _immutable_.

      **Stateful Widget** adalah jenis widget yang memiliki keadaan yang bisa berubah. State widget ini dapat diubah selama aplikasi berjalan. Contohnya adalah ketika pengguna berinteraksi dengan widget tersebut. Stateful Widget biasanya digunakan ketika kita memerlukan widget yang bisa berubah sesuai dengan tindakan atau interaksi yang dilakukan oleh pengguna.

    - Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
        - MyHomePage (StatelessWidget): Ini merupakan widget utama yang mewakili halaman be dalam aplikasi untuk mengatur tampilan utama aplikasi dan termasuk dalam Scaffold.
        - Scaffold: Merupakan widget yang menyediakan kerangka dasar untuk halaman aplikasi. Scaffold mencakup AppBar dan body, serta atribut lain yang digunakan untuk mengatur tampilan.
        - AppBar: Bagian dari Scaffold yang menyajikan bagian atas (app bar) yang berisi judul aplikasi.
        - GridView.count: Untuk menampilkan tata letak grid yang berisi sejumlah item (cards).
        - WargoCard (StatelessWidget): Ini adalah widget yang mewakili card individu dalam grid dimana setiap card berisi icon dan teks, dan dapat di*click* untuk menampilkan SnackBar.
        - SnackBar: Muncul ketika ada card yang di*click* dan memberikan umpan balik kepada pengguna
        - Material: Berfungsi sebagai wadah untuk setiap carddan memberikan warna latar belakang sesuai dengan jenis item yang ditentukan
        - InkWell: Merupakan widget yang merespons sentuhan sehingga pengguna dapat menekan card. Saat di*click*, SnackBar akan muncul
        - Icon: Widget ini digunakan untuk menampilkan ikon yang sesuai dengan item yang diwakili oleh card
        - Text: Digunakan untuk menampilkan teks yang sesuai dengan item yang diwakili oleh card
        - Container: Digunakan sebagai wadah untuk menyimpan ikon dan teks dalam setiap card

- [x] **BONUS** Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout)
  Menambahkan code dibawah untuk mengganti warna dari setiap tombol

  ```
  Widget build(BuildContext context) {
  var btnColor;
  if (item.name.compareTo("Lihat Produk") == 0) {
  btnColor= Colors.orange;
  }
  else if (item.name.compareTo("Tambah Produk") == 0) {
  btnColor= Colors.cyan;
  }
  else if (item.name.compareTo("Logout") == 0) {
  btnColor= Colors.red;
  }

            return Material(
            color: btnColor,
            child: InkWell(
            ...)
            )
        ...
        }
    ```

## Tugas 8
- [x] **Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:**

    Membuat file `shop_form.dart` dan mengisinya dengan kode dibawah
    ```
      import 'package:flutter/material.dart';
      import 'package:wargo/widgets/left_drawer.dart';

      class ShopFormPage extends StatefulWidget {
          const ShopFormPage({super.key});

          @override
          State<ShopFormPage> createState() => _ShopFormPageState();
      }

      class _ShopFormPageState extends State<ShopFormPage> {
          @override
          Widget build(BuildContext context) {
              return Placeholder();
          }
      }
    ```
  - **Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.**
    Mengisi class _ShopFormPageState dengan kode dibawah pada file `shoplist_form.dart` 
    ```
      final _formKey = GlobalKey<FormState>();
      String _name = "";
      int _amount = 0;
      int _price = 0;
      String _description = "";
    
      @override
      Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Item',
            ),
          ),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Item",
                        labelText: "Nama Item",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Amount harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
 
    ```
    - **Memiliki sebuah tombol Save.**
        Menambahkan kode dibawah pada class _ShopFormPageState di bagian `returnScaffold(...)` pada file `shoplist_form.dart`
        ```
                  Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.cyan),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Item berhasil tersimpan'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text('Nama: $_name'),
                                Text('Harga: $_price'),
                                Text('Deskripsi: $_description')
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  _formKey.currentState!.reset();
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ```
    - **Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:**
        - **Setiap elemen input tidak boleh kosong.**

            Menambahkan kode-kode dibawah pada file `shoplist_form.dart` di dalam `Padding(...)`
            
            **Validator input nama item**

              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Nama tidak boleh kosong!";
                }
                return null;
              },

            **Validator input harga item**
                
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Harga tidak boleh kosong!";
                }
              }

            **Validator input deskripsi item**

              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Deskripsi tidak boleh kosong!";
                }
                return null;
              }
              
        - **Setiap elemen input harus berisi data dengan tipe data atribut modelnya.**

          Menambahkan kode dibawah pada bagian `validator` di dalam `Padding(...)` pada file `shoplist_form.dart`

              validator: (String? value) {
                ...
                if (int.tryParse(value) == null) {
                  return "Harga harus berupa angka!";
                }
              }

- [x] **Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.**

    Menambahkan kode dibawah pada `wargo_card.dart` yang menggunakan metode `Navigator.push()` untuk mengarahkan pengguna ke `ShopFormPage` ketika tombol Tambah Item diklik

      if (item.name == "Tambah Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
      }

- [x] **Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.**
  Menambahkan kode dibawah pada file `shoplist_form.dart` di dalam class `_WarkopFormPageState` di bagian `child:Column(...)` di dalam bagian `Align(...)`

      ...
      return AlertDialog(
        title: const Text('Item berhasil tersimpan'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text('Nama: $_name'),
              Text('Harga: $_price'),
              Text('Deskripsi: $_description')
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
      ...


- [x] **Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:**
    - **Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.**

      Menambahkan kode dibawah pada file `left_drawer.dart` di dalam class `LeftDrawer` pada bagian `return Drawer(...)`

          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                  ));
            },
          ),
  
    - **Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.**
      Menambahkan kode dibawah yang memanfaatkan `Navigator.pushReplacement()` pada `left_drawer.dart` di dalam class `LeftDrawer` pada bagian `return Drawer(...)` di dalam `ListTile(...)` untuk bagian `Halaman Utama`

          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },

    - **Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.**
      Menambahkan kode dibawah yang memanfaatkan `Navigator.pushReplacement()` pada `left_drawer.dart` di dalam class `LeftDrawer` pada bagian `return Drawer(...)` di dalam `ListTile(...)` untuk bagian `Tambah Item`
            
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
          },

- [x] **Menjawab beberapa pertanyaan berikut pada `README.md` pada root folder (silakan modifikasi `README.md` yang telah kamu buat sebelumnya; tambahkan subjudul untuk setiap tugas)**
    - **Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**

        **Navigator.push()** berguna untuk menambahkan route baru ke dalam stack navigasi. Ketika user menavigasi ke halaman baru, halaman tersebut akan ditambahkan ke dalam stack. Sehingga, jika pengguna menekan tombol kembali, mereka akan kembali ke halaman sebelumnya dalam stack. 

        **Navigator.pushReplacement()** berguna untuk menggantikan route yang ada di dalam stack dengan route yang baru. Ketika pengguna menavigasi ke halaman baru menggunakan pushReplacement(), halaman tersebut akan menggantikan halaman terakhir dalam stack. Sehingga, ketika pengguna menekan tombol kembali, mereka langsung keluar dari aplikasi. 
        
    - **Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**

        - Align: Widget digunakan untuk menempatkan child widget pada posisi tertentu di dalam parent widget. Contoh: Menaruh tombol di tengah-tengah layar.
        - AspectRatio: Widget ini berguna untuk mengatur rasio aspek dari child widget. Contoh: Menampilkan gambar dengan rasio aspek tertentu.
        - Baseline: Digunakan untuk menempatkan child widget pada baseline tertentu. Contoh: Menampilkan teks dengan variasi ukuran font pada satu baris.
        - Center: Widget ini digunakan untuk menempatkan child widget di tengah-tengah parent widget. Contoh: Menampilkan teks atau gambar di tengah-tengah layar.
        - Container: Widget ini menggabungkan berbagai widget seperti padding, margin, border, dan sejenisnya. Contoh: Menampilkan teks dengan latar belakang tertentu.
        - CustomSingleChildLayout: Widget ini memungkinkan kita menentukan posisi dan ukuran dari child widget secara kustom. Contoh: Menampilkan teks pada posisi tertentu di dalam parent widget.
        - FittedBox: Widget ini digunakan untuk menampilkan child widget dengan ukuran yang sesuai dengan parent widget. Contoh: Menampilkan gambar dengan ukuran tertentu pada layar.
        - Padding: Digunakan untuk memberikan jarak antara child widget dengan parent widget. Contoh: Menampilkan teks dengan jarak tertentu dari tepi layar.
        - SizedBox: Widget ini berguna untuk memberikan ukuran pada child widget. Contoh: Menampilkan teks dengan ukuran tertentu pada layar.
        - SizedOverflowBox: Widget ini digunakan untuk menampilkan child widget dengan ukuran yang melampaui ukuran parent widget, namun tetap memperhatikan batasan ukuran parent widget. Contoh: Menampilkan gambar dengan ukuran tertentu pada layar.
        - Transform: Widget ini memungkinkan kita melakukan transformasi pada child widget. Contoh: Menampilkan gambar dengan rotasi tertentu pada layar.
        - Column: Widget ini berguna untuk menampilkan beberapa child widget secara vertikal. Contoh: Menampilkan beberapa teks pada satu kolom.

    - **Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**

        - **TextFormField** untuk Nama Item yang berguna untuk menerima input nama item. Digunakan karena input yang diharapkan berupa text biasa. Terdapat dekorasi dengan placeholder "Nama Item" dan label "Nama Item".
        - **TextFormField** untuk Harga yang berguna untuk menerima input harga item. Digunakan karena input yang diharapkan berupa angka. Terdapat dekorasi dengan placeholder "Harga" dan label "Harga".
        - **TextFormField** untuk Deskripsi yang berguna untuk menerima input deskripsi item. Digunakan karena input yang diharapkan berupa text biasa. Terdapat dekorasi dengan placeholder "Deskripsi Item" dan label "Deskripsi Item".


    - **Bagaimana penerapan clean architecture pada aplikasi Flutter?** 

        Clean Architecture merupakan suatu konsep arsitektur software yang berfokus pada pemisahan tanggung jawab dan *dependency* antarkomponen dalam suatu aplikasi. Clean architecture bertujuan untuk menciptakan struktur proyek yang bersih dan mudah dimengerti. Clean Architecture mengikuti prinsip desain yang disebut "*separation of concerns*" di mana aplikasi dibagi menjadi lapisan-lapisan yang terisolasi satu sama lain. Lapisan-lapisan tersebut terdiri dari 

        Dalam konteks Flutter, implementasi Clean Architecture sering diasebut sebagai "Flutter Clean Architecture" atau "Reso Coder's Clean Architecture." Penerapan ini memiliki beberapa lapisan utama:

        1. Domain Layer:

            Terletak di dalam, tidak memiliki ketergantungan pada lapisan lain.
            Berisi aturan bisnis, entitas (model/domain objects), use cases (interactors), dan repository interfaces.

        2. Data Layer:

            Terletak di luar domain, bertanggung jawab atas akses dan penyimpanan data.
            Berisi implementasi konkret dari repository interfaces, DTO models, data sources, dan mapper.

        3. Infrastructure Layer:

            Mendukung lapisan data dengan menyediakan implementasi konkret dari repository interfaces.
            
        4. Presentation Layer (Feature Layer):

            Terletak di luar data dan domain, menangani tampilan (UI) dan interaksi pengguna.
            Berisi widget, state management, dan logika presentasi.
            Tidak memiliki logika bisnis; logika tersebut ditempatkan di dalam use cases di domain layer.

        5. Resources and Shared Library:

            Dapat diakses oleh semua lapisan.
            Resources berisi aset (gambar, font, warna) dan konfigurasi.
            Shared Library berisi komponen-komponen yang dapat digunakan ulang, fungsionalitas umum (navigasi, jaringan), dan pustaka pihak ketiga.

        Konsep utama Clean Architecture pada Flutter adalah pemisahan yang jelas antara logika, akses data, dan interface. Penerapan clean architecture dapat mempermudah dalam pengujian, meningkatkan skalabilitas, dan membuat proyek lebih mudah dipahami dan dikelola. Implementasinya melibatkan penggunaan prinsip-prinsip seperti "*Single Responsibility Principle*," "*Dependency Injection*," dan pemisahan yang ketat antara *dependency*.

## TUGAS 9

- [x] Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

    Memastikan secret variables pada repository sudah sesuai dengan ketentuan dan benar. 

- [x] Membuat halaman login pada proyek tugas Flutter.

    Membuat file `login.dart` pada proyek Flutter dan menambahkan kode berikut:

        import 'package:wargo/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        void main() {
          runApp(const LoginApp());
        }

        class LoginApp extends StatelessWidget {
          const LoginApp({super.key});

          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              title: 'Login',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const LoginPage(),
            );
          }
        }

        class LoginPage extends StatefulWidget {
          const LoginPage({super.key});

          @override
          _LoginPageState createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
          final TextEditingController _usernameController = TextEditingController();
          final TextEditingController _passwordController = TextEditingController();

          @override
          Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
              appBar: AppBar(
                title: const Text('Login'),
              ),
              body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () async {

                        String username = _usernameController.text;
                        String password = _passwordController.text;

                        // Cek kredensial
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        // Untuk menyambungkan Android emulator dengan Django pada localhost,
                        // gunakan URL http://10.0.2.2/
                        final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                          'username': username,
                          'password': password,
                        });

                        if (request.loggedIn) {
                          String message = response['message'];
                          String uname = response['username'];
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("$message Selamat datang, $uname.")));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Gagal'),
                              content:
                              Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            );
          }
        }

- [x] Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

        - Membuat app baru bernama `authentication` pada proyek Django dengan menuliskan `python manage.py startapp authentication` pada terminal
        - Menginstall library dengan menuliskan `django-cors-headers` pada terminal
        - Menambahkan authentication dan corsheaders ke dalam `INSTALLED_APPS` pada `settings.py` di proyek 
        - Menambahkan variabel dibawah

            CORS_ALLOW_ALL_ORIGINS = True
            CORS_ALLOW_CREDENTIALS = True
            CSRF_COOKIE_SECURE = True
            SESSION_COOKIE_SECURE = True
            CSRF_COOKIE_SAMESITE = 'None'
            SESSION_COOKIE_SAMESITE = 'None'
        - Membuat fungsi login dan logout pada file `views.py` pada file `authentication` dan lakukan routing pada `urls.py`

            @csrf_exempt
            def login(request):
                username = request.POST['username']
                password = request.POST['password']
                user = authenticate(username=username, password=password)
                if user is not None:
                    if user.is_active:
                        auth_login(request, user)
                        # Status login sukses.
                        return JsonResponse({
                            "username": user.username,
                            "status": True,
                            "message": "Login sukses!"
                            # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                        }, status=200)
                    else:
                        return JsonResponse({
                            "status": False,
                            "message": "Login gagal, akun dinonaktifkan."
                        }, status=401)

                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login gagal, periksa kembali email atau kata sandi."
                    }, status=401)
                
            @csrf_exempt
            def logout(request):
                username = request.user.username

                try:
                    auth_logout(request)
                    return JsonResponse({
                        "username": username,
                        "status": True,
                        "message": "Logout berhasil!"
                    }, status=200)
                except:
                    return JsonResponse({
                    "status": False,
                    "message": "Logout gagal."
                    }, status=401)

        - Menginstall package dengan menuliskan kode dibawah pada terminal

            flutter pub add provider
            flutter pub add pbp_django_auth
        - Mengubah class `MyApp` di file `main.dart` menjadi seperti kode dibawah

            class MyApp extends StatelessWidget {
              const MyApp({Key? key}) : super(key: key);

              @override
              Widget build(BuildContext context) {
                return Provider(
                  create: (_) {
                    CookieRequest request = CookieRequest();
                    return request;
                  },
                  child: MaterialApp(
                      title: 'Flutter App',
                      theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                        useMaterial3: true,
                      ),
                      home: LoginPage()),
                );
              }
            }

- [x] Membuat model kustom sesuai dengan proyek aplikasi Django.

    - Membuka endpoint `JSON` pada website Django 
    - Mengcopy data yang ada di endpoint `JSON`
    - Mengubah menjadi `dart` language
    - Mengcopy kode ke clipboard
    - Membuat folder `models` pada `lib` dan menambahkan file `product.dart` yang berisi kode yang telah dicopy ke clipboard

        // To parse this JSON data, do
        //
        //     final product = productFromJson(jsonString);

        import 'dart:convert';

        List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

        String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

        class Product {
            String model;
            int pk;
            Fields fields;

            Product({
                required this.model,
                required this.pk,
                required this.fields,
            });

            factory Product.fromJson(Map<String, dynamic> json) => Product(
                model: json["model"],
                pk: json["pk"],
                fields: Fields.fromJson(json["fields"]),
            );

            Map<String, dynamic> toJson() => {
                "model": model,
                "pk": pk,
                "fields": fields.toJson(),
            };
        }

        class Fields {
            int user;
            String name;
            int amount;
            String description;

            Fields({
                required this.user,
                required this.name,
                required this.amount,
                required this.description,
            });

            factory Fields.fromJson(Map<String, dynamic> json) => Fields(
                user: json["user"],
                name: json["name"],
                amount: json["amount"],
                description: json["description"],
            );

            Map<String, dynamic> toJson() => {
                "user": user,
                "name": name,
                "amount": amount,
                "description": description,
            };
        }

- [x] Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

    Membuat file `list_product.dart` dan mengisinya dengan kode dibawah

      import 'package:flutter/material.dart';
      import 'package:http/http.dart' as http;
      import 'dart:convert';
      import 'package:wargo/models/product.dart';
      import 'package:wargo/widgets/left_drawer.dart';
      import 'package:wargo/screens/detail_product.dart';

      class ProductPage extends StatefulWidget {
        const ProductPage({Key? key}) : super(key: key);

        @override
        _ProductPageState createState() => _ProductPageState();
      }

      class _ProductPageState extends State<ProductPage> {
        Future<List<Product>> fetchProduct() async {
          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
          var url = Uri.parse(
              'http://127.0.0.1:8000/json/');
          var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
          );

          // melakukan decode response menjadi bentuk json
          var data = jsonDecode(utf8.decode(response.bodyBytes));

          // melakukan konversi data json menjadi object Product
          List<Product> list_product = [];
          for (var d in data) {
            if (d != null) {
              list_product.add(Product.fromJson(d));
            }
          }
          return list_product;
        }

    - [x] Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.

      Menambahkan kode dibawah pada `list_product.dart`

          @override
          Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Product'),
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchProduct(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return const Column(
                            children: [
                              Text(
                                "Tidak ada data produk.",
                                style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}"),
                                    ElevatedButton(
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => DetailProductPage(id: snapshot.data![index].pk)),
                                        );
                                      },
                                      child: const Text('Detail Product'),
                                    ),
                                  ],
                                ),
                              ));
                        }
                      }
                    }));
          }
        }

- [x] Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

    Membuat file baru bernama `detail_product.dart` kemudian isi dengan kode dibawah:

      import 'dart:ui';
      import 'package:flutter/material.dart';
      import 'package:http/http.dart' as http;
      import 'dart:convert';
      import 'package:wargo/models/product.dart';
      import 'package:wargo/widgets/left_drawer.dart';
      import 'package:wargo/screens/list_product.dart';

      class DetailProductPage extends StatelessWidget {
        const DetailProductPage({Key? key, required this.id}) : super(key: key);
        final int id;

        Future<List<Product>> fetchProduct() async {
          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
          var url = Uri.parse(
              'http://127.0.0.1:8000/json/${id}');
          var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
          );

          // melakukan decode response menjadi bentuk json
          var data = jsonDecode(utf8.decode(response.bodyBytes));

          // melakukan konversi data json menjadi object Product
          List<Product> list_product = [];
          for (var d in data) {
            if (d != null) {
              list_product.add(Product.fromJson(d));
            }
          }
          return list_product;
        }

    - [x] Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.

        Menambahkan kode dibawah pada file `list_product.dart`

           ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DetailProductPage(id: snapshot.data![index].pk)),
                );
              },
              child: const Text('Detail Product'),
            ),
    - [x] Tampilkan seluruh atribut pada model item kamu pada halaman ini.

        Menambahkan kode dibawah pada file `detail_product.dart`

          @override
            Widget build(BuildContext context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Detail Product'),
                  ),
                  drawer: const LeftDrawer(),
                  body: FutureBuilder(
                      future: fetchProduct(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          if (!snapshot.hasData) {
                            return const Column(
                              children: [
                                Text(
                                  "Tidak ada data produk.",
                                  style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text("Amount: ${snapshot.data![index].fields.amount}"),
                                      const SizedBox(height: 10),
                                      Text("Price: ${snapshot.data![index].fields.price}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "${snapshot.data![index].fields.description}"),
                                    ],
                                  ),
                                ));
                          }
                        }
                      }));
            }

    - [x] Tambahkan tombol untuk kembali ke halaman daftar item.

        Menambahkan kode dibawah pada file `list_product.dart`

          ElevatedButton(
            onPressed: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
              );
            },
            child: const Text('Kembali'),
          ),

- [x]  **Menjawab beberapa pertanyaan berikut pada README.md pada root folder (silakan modifikasi README.md yang telah kamu buat sebelumnya; tambahkan subjudul untuk setiap tugas).**
    - **Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**

      Bisa. Dalam Flutter dengan Dart, kita dapat menggunakan json.decode untuk mengubah string JSON menjadi Map, kemudian mengakses nilai-nilai tertentu dari Map tersebut.

      Namun, hal ini belum tentu lebih baik, tergantung dengan webapp yang dirancang. Dengan menggunakan Models, terdapat beberapa keunggulan meliputi meningkatkan readability dan maintanability kode. Selain itu, models juga dapat memudahkan refactoring. 

      Jadi, jika kita ingin untuk merancang webapp yang rapi dan lebih mudah untuk dikembangkan, sebaiknya menggunakan Models.

    - **Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
        
        **CookieRequest** berfungsi untuk mengirim request HTTP dengan cookie. Dengan dikirimnya sebuah HTTP request, sebuah cookie ikut disertakan dalam request tersebut sehingga server dapat mengidentifikasi user yang terautentikasi dan akan menyimpan informasi session user. Instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi flutter agar semua komponen dapat mengakses cookie yang sama untuk mengakses informasi pengguna terauntentikasi yang sama.

    - **Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**

        **Membaca Data JSON:** Pertama, perlu membaca data JSON. Ini bisa dilakukan dengan menggunakan rootBundle.loadString jika membaca file JSON lokal, atau dengan menggunakan `http.get` jika mengambil data dari API.

        **Decoding JSON:** Setelah mendapatkan string JSON, perlu mengubahnya menjadi struktur data Dart yang dapat dikerjakan. Ini bisa dilakukan dengan `json.decode`.

        **Mengakses Data:** Setelah memiliki data dalam format Dart (biasanya Map atau List), kita dapat mengakses nilai-nilai tertentu dari data tersebut.

        **Menampilkan Data:** Akhirnya, kita dapat menampilkan data ini di Flutter. Misalnya dengan menggunakan `ListView.builder` untuk menampilkan daftar item dari data JSON.

    - **Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

       Berikut adalah mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter:

        1. **Input Data Akun**: Pengguna memasukkan data akun (misalnya username dan password) di aplikasi Flutter.

        2. **Pengiriman Data**: Aplikasi Flutter mengirimkan data ini ke server Django menggunakan HTTP POST request. Biasanya, data ini dikirim dalam format JSON.

        3. **Autentikasi Django**: Django menerima data ini dan mencoba untuk mengautentikasi pengguna. Ini biasanya melibatkan pencocokan username dan password dengan data yang ada di database.

        4. **Pembuatan Token**: Jika autentikasi berhasil, Django akan membuat token autentikasi untuk pengguna. Token ini adalah string unik yang digunakan untuk mengidentifikasi pengguna dalam semua request selanjutnya.

        5. **Pengiriman Token**: Django mengirimkan token ini kembali ke aplikasi Flutter dalam response HTTP.

        6. **Penyimpanan Token**: Aplikasi Flutter menerima token ini dan menyimpannya untuk digunakan dalam request selanjutnya. Token ini biasanya disimpan di local storage atau dalam state management system.

        7. **Navigasi Menu**: Setelah token diterima dan disimpan, aplikasi Flutter biasanya akan menavigasi pengguna ke halaman atau menu utama.

        8. **Request Selanjutnya**: Untuk request selanjutnya, aplikasi Flutter akan menyertakan token ini dalam header Authorization dari HTTP request. Ini memungkinkan Django untuk mengidentifikasi pengguna dan memastikan bahwa mereka telah diautentikasi.

    - **Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**

          1. Scaffold sebagai kerangka dasar aplikasi
          2. LeftDrawer sebagai widget untuk navigasi ke tambah produk baru dan lihat produk
          3. AppBar sebagai bagian baris judul di bagian atas layar
          4. ListView.builder untuk membuat daftar elemen dengan jumlah dinamis
          5. Text untuk menampilkan teks
          6. Column sebagai wadah vertical untuk layout
          7. FutureBuilder untuk membangun user interface berdasarkan status future