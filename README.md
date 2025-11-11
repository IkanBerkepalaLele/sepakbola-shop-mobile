- Repository Tugas Inidividu Flutter Pemograman Berbasis PBP (Pemrograman Berbasis Platform)

<details>
  <summary><strong>Tugas 7</strong></summary>


 ## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
 - Widget tree adalah struktur pohon yang menggambarkan hubungan antara satu widget dan widget lainnya, sebuah widget disebut parent jika ia mengontrol atau menyusun layout dan properti dari widget lain. 
 - Sebuah parent widget bisa menghandle satu atau banyak widget lain (children), ketika sebuah tree di build, parent akan memberi properti, argumen, constraint ke child widget. Lalu ketika sebuah parent di rebuild, children dari parent tersebut akan otomatis ter-update.

 ## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
1. MaterialApp
   - Widget root aplikasi yang menyediakan struktur Material Design
   - Mengatur tema, routing, dan konfigurasi aplikasi secara keseluruhan

2. MyApp
   - Widget kustom sebagai entry point aplikasi
   - Tidak memiliki state yang berubah

3. ThemeData
   - Mendefinisikan tema visual aplikasi 

4. ColorScheme
   - Mendefinisikan warna aplikasi 

5. MyHomePage
   - Widget halaman utama aplikasi
   - Menampilkan AppBar, InfoCard, dan grid ItemCard

6. Scaffold
   - Menyediakan struktur dasar halaman Material Design
   - Berisi AppBar dan body

7. AppBar
   - Bar di bagian atas halaman
   - Menampilkan judul "Sepakbola Shop"

8. Text
   - Menampilkan teks judul, nama, npm, kelas, sambutan

9. Padding
   - Memberikan jarak/ruang di sekitar widget child
   - Digunakan di body, teks sambutan, dll

10. Column
    - Menyusun widget secara vertikal
    - Digunakan untuk layout utama dan dalam InfoCard

11. Row
    - Menyusun widget secara horizontal
    - Menampilkan 3 InfoCard (NPM, Name, Class)

12. InfoCard
    - Widget custom untuk menampilkan informasi (NPM, Nama, Kelas)

13. Card
    - Membuat material card dengan elevation/bayangan
    - Digunakan dalam InfoCard

14. Container
    - Widget serbaguna untuk styling dan layout
    - Digunakan di InfoCard dan ItemCard untuk padding dan ukuran

15. SizedBox
    - Memberikan jarak vertikal atau horizontal dengan ukuran tetap
    - Digunakan untuk spacing antar widget

16. Center
    - Menempatkan child widget di tengah
    - Membungkus Column yang berisi sambutan dan grid

17. GridView.count
    - Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap (3 kolom)
    - Menampilkan ItemCard untuk setiap item

18. ItemCard
    - Widget kustom untuk menampilkan kartu item (All Product, My Product, Add Product)
    - Memiliki ikon, nama, dan warna

19. Material
    - Menyediakan efek visual Material Design
    - Digunakan dalam ItemCard untuk background color dan border radius

20. InkWell
    - Memberikan efek ripple saat ditekan
    - menampilkan SnackBar

21. Icon
    - Menampilkan ikon Material Design
    - Digunakan dalam ItemCard (shopping_bag, add)

22. ScaffoldMessenger
    - Mengelola SnackBar untuk menampilkan pesan
    - Dipanggil saat ItemCard ditekan

23. SnackBar
    - Menampilkan pesan singkat di bagian bawah layar
    - Muncul saat user menekan salah satu tombol

24. MediaQuery
    - Mendapatkan informasi tentang ukuran dan orientasi layar
    - Digunakan untuk membuat InfoCard responsive


 ## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
 - Material app berfungsi mengatur tema aplikasi secara global menggunakan colorScheme, metadata, navigasi, dll. Mirip seperti tag `<head>` di html
 - karena material app berfungsi sebagai fondasi dari app yang dijalankan.

 ## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
 - StatelessWidget adalah widget yang dimana data dan propertinya tidak bisa berubah atau statis, namun masih bisa berubah jika parent memberi data baru. Cocok digunakan untuk UI murni seperti logo, teks, dan semacamnya. 
 - StatefulWidget adalah widget yang dimana data dan propertinya bisa berubah dengan interaksi user. Cocok untuk digunakan pada form, counter, animasi, dan semacamnya.  
  
 ## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
 - BuildContext adalah handler lokasi widget pada widget tree. Jadi dengan BuildContext, saat widget di build, widget yang berada di bawah bisa mengambil context / properti yang berada di atas widget tersebut. Contohnya mengakses tema, media, state global, dll. 

 ## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
 - Hot Reload adalah fitur di flutter yang bisa diakses dengan menekan "r" pada saat `flutter run`. Hot reload berguna untuk membuild ulang widget tree, sehingga state aplikasi masih bertahan. Hot reload umumnya digunakan melihat perubahan pada UI dengan cepat tanpa merubah state yang sudah ada. Cocok digunakan jika kode yang berubah adalah kode yang berhubungan dengan UI, seperti warna, teks, maupun styling. 
 - Hot Restart adalah fitur di flutter yang bisa diakses dengan menekan "R" pada saat `flutter run`. Hot restart berguna untuk mereset ulang/restart aplikasi sehingga semua state yang sudah ada menjadi hilang. Hot Restart bisa digunakan jika perubahan yang diinginkan tidak terlihat saat menggunakan Hot Reload. Hot Restart cocok digunakan saat ada perubahan logic pada aplikasi flutter.


</details> 

<details open>
<summary><strong>Tugas 8</strong></summary>

 ## Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
 
- `Navigator.push()` menambahkan halaman baru ke dalam navigation stack, sehingga user dapat kembali ke halaman sebelumnya dengan tombol back. Method ini cocok digunakan ketika user perlu navigasi yang reversible, misalnya saat membuka detail produk dari halaman utama - user bisa kembali ke halaman utama setelah melihat detail. Di aplikasi ini, `Navigator.push()`  digunakan saat user menekan tombol "Menambahkan Produk" untuk melihat daftar produk, karena setelah melihat daftar, user mungkin ingin kembali ke halaman utama dengan tombol back.

- `Navigator.pushReplacement()` menggantikan halaman saat ini dengan halaman baru, menghapus halaman sebelumnya dari navigation stack sehingga user tidak dapat kembali ke halaman tersebut dengan tombol back. Method ini cocok digunakan untuk navigasi yang tidak boleh di-reverse, seperti setelah login atau logout. Di aplikasi ini, `Navigator.pushReplacement()` digunakan di dalam drawer ketika user memilih "Halaman Utama" karena drawer adalah menu navigasi utama dan tidak masuk akal jika user bisa kembali berkali-kali ke halaman yang sama dengan menekan back.

 ## Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

- `Scaffold` digunakan sebagai kerangka dasar di setiap halaman `menu.dart` dan `productlist_form.dart` yang menyediakan struktur Design standar dengan area untuk `appBar`, `body`, dan `endDrawer`. Untuk header, terdapat custom widget `CustomAppBar` yang menampilkan logo dan tombol hamburger menu di kanan halaman untuk menjaga konsistensi. Untuk navigasi, terdapat  widget `LeftDrawer` yang berisi menu dengan ikon dan efek ripple hijau saat diklik.

 ## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
 
- `Padding` menjaga jarak antar elemen sehingga input tidak saling berdempetan dan lebih mudah dibaca. Di aplikasi ini, setiap input field menggunakan `Padding(padding: const EdgeInsets.all(8.0))` agar tidak menempel dengan input lainnya, seperti pada field "Nama Produk", "Harga Produk", dan field lainnya di `productlist_form.dart`. 

- `SingleChildScrollView` berguna untuk form yang memiliki banyak input karena memungkinkan konten yang panjang untuk di-scroll ketika melebihi ukuran layar, sehingga mencegah overflow error pada layar kecil atau ketika keyboard muncul. Di aplikasi ini, `SingleChildScrollView` membungkus seluruh `Column` yang berisi form title dan semua input fields (nama, harga, stock, deskripsi, kategori, thumbnail, featured toggle, dan tombol simpan), memastikan user dapat mengakses semua field meskipun tinggi konten melebihi tinggi layar. 

- `ListView` berguna untuk menampilkan list item yang panjang dan otomatis scrollable. ListView digunakan di Drawer menggunakan ListView agar header dan setiap ListTile dapat discroll ketika tinggi layar terbatas.


 ## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
- Karena website saya dominan putih dengan aksen hijau, maka di file `main.dart` saya ganti dari biru ke hijau,       
```
theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.white)
    .copyWith(secondary: Colors.greenAccent[400]),
    ),
```
- Saya ganti Appbar jadi hanya ada logo dan warna putih, sama juga dengan drawernya, dimana kalau ditekan akan muncul ripple hijau.
- Lalu di form produk, saya tambahkan ketika user focus di suatu input, saya jadikan warna hijau form input tsb.
```
focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: Colors.green, width: 2.0),
),
```
</details>