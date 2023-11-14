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
                          'Wargo Inventory', // Text yang menandakan toko
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
        - MyHomePage (StatelessWidget): Ini merupakan widget utama yang mewakili halaman beranda dalam aplikasi untuk mengatur tampilan utama aplikasi dan termasuk dalam Scaffold.
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