# wargo

## Tugas 1
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

