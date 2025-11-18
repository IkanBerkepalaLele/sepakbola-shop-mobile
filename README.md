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

<details>
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

<details open>
<summary><strong>Tugas 9</strong></summary>

## Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
- Kita perlu membuat model dart agar kita bisa secara eksplisit state apa saja tipe data dan field yang kita butuhkan, sehingga compiler bisa detect error ketika development. 
- Jika langsung dipetakan melalui map, tidak ada null safety yang bisa Dart berikan, sehingga program bisa saja crash saat runtime. Maintainabilitynya juga jelek, karena kita harus menghjal json yang diambil/dikirim. 

## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
- http adalah package bawaan dari Dart yang bisa kita gunakan, gunanya untuk melakukan HTTP request ke server, di konteks tugas ini, pws. Namun, hanya bisa menghandle request sederhana tanpa session.
- Sedangkan CookieRequest adalah package dari pbp_django_auth, buatan asdos pbp(?) yang digunakan untuk integrasi flutter dengan django. Disini CookieRequest digunakan untuk implementasi Django authentication system, juga menyimpan session user. 

## Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
- Agar session user tetap konsisten di seluruh aplikasi. Sehingga setiap komponen dapat mengakses session yang sama. Jika tidak dibagikan, maka session user akan terpisah-pisah sehingga bisa saja satu komponen tidak tahu user sudah login meskipun sebenarnya sudah terautentikasi. 

## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
- `10.0.2.2 `ke `ALLOWED_HOSTS` berguna jika Flutter dijalankan di android emulator, dengan `10.0.2.2` tersebut adalah ip localhost. Jika tidak diaktifkan, ketika menjalankan flutter di emulator, maka django akan menolak request dari emulator tersebut dengan error dengan error ``Invalid HTTP_HOST header`.
- CORS (Cross-Origin Resource Sharing) diaktifkan karena Flutter berjalan di origin berbeda dari Django, tanpa CORS, browser atau HTTP client akan memblokir request karena security policy.
- `SESSION_COOKIE_SAMESITE = 'None'` dan `SESSION_COOKIE_SECURE = True` diperlukan agar cookie session dapat dikirim dalam cross-origin request, setting `SameSite=None` mengizinkan cookie dikirim ke domain berbeda. 
-` <uses-permission android:name="android.permission.INTERNET"/>` ditambahkan di AndroidManifest.xml karena Android secara default tidak mengizinkan aplikasi mengakses internet - tanpa permission ini, Flutter app tidak dapat melakukan HTTP request sama sekali dan akan gagal dengan network error.

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
- User mengisi form yang telah tersedia di product form, lalu flutter akan validasi dulu dengan FormState.validate() agar data yang terisi sudah pasti cocok dengan constraint maupun data typenya. 
- Lalu data yang sudah valid akan di encode ke JSON dengan jsonEncode() karena engpoint di django menerima lewat JSON. 
- Data yang sudah diencode tersebut akan dikirim ke django menggunakan `CookieRequest.postJson()`, dengan endpoint `/create-flutter/`dengan method POST.
- Django menerima request, memvalidasi data, dan menyimpan ke database Django. Django mengembalikan response JSON berisi status sukses/error.
- Flutter menerima response JSON dan mem-parse-nya untuk mengetahui apakah operasi berhasil atau gagal.
- Untuk menampilkan data, Flutter melakukan GET request ke endpoint Django `/json/`, yang akan mengembalikan response berupa list JSON, lalu flutter akan parse JSON menggunakan model Dart `Product.fromJson()`, dan menampilkannya.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Register
1. User mengisi username, password, dan password confirmation di Flutter (`register.dart`)
2. Flutter mengirim POST request ke endpoint Django `/auth/register/` dengan data username dan password menggunakan `CookieRequest.postJson()`
3. Django memvalidasi data 
4. Django membuat user baru menggunakan `User.objects.create_user()`
5. Django mengembalikan response JSON dengan status sukses/error
6. Jika sukses, Flutter menampilkan dialog/snackbar sukses dan redirect ke halaman login

- Login:
1. User mengisi username dan password di Flutter `login.dart`
2. Flutter mengirim POST request menggunakan `CookieRequest.login()` ke endpoint `/auth/login/`
3. Django memverifikasi kredensial menggunakan `authenticate(username, password)`
4. Jika valid, Django membuat session dengan `auth_login()` dan mengirim cookie session
5. Django mengembalikan response JSON berisi status, message, username, dan userID
6. `CookieRequest` menyimpan cookie session untuk request selanjutnya
7. Flutter menyimpan informasi user (username, userID) dan redirect ke halaman utama dengan `Navigator.pushReplacement()` agar tidak bisa kembali ke halaman login

- Logout:
1. User menekan tombol logout di menu drawer
2. Flutter mengirim POST request menggunakan `CookieRequest.logout()` ke endpoint `/auth/logout/`
3. Django menghapus session dengan `auth_logout()` dan menghapus cookie
4. Django mengembalikan response JSON dengan status sukses
5. `CookieRequest` menghapus cookie yang tersimpan
6. Flutter menampilkan pesan sukses dan redirect ke halaman login dengan `Navigator.pushReplacement()` agar tidak bisa kembali ke menu utama karena sesi sudah dihapus

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
- Setelah saya tambahkan django app authentication, routing dan kode viewsnya, saya push ke github dan PWS. Lalu saya cek manual dengan masuk ke web tersebut, dan ternyata berjalan dengan baik tanpa error.

### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
- Saya buat file `register.dart` di folder screens dengan form yang berisi 3 input fields: username, password, dan password confirmation
- Form menggunakan `TextEditingController` untuk masing-masing field
- Lalu dilakukan validasi dilakukan untuk memastikan setiap field dalam di constraint yang benar serta data type yang benar pula.
- Saat tombol register ditekan, data dikirim ke endpoint Django `/auth/register/` menggunakan `CookieRequest.postJson()`
- Django akan memvalidasi dan membuat user baru dengan `User.objects.create_user()`
- Jika sukses, menampilkan dialog sukses dan redirect ke halaman login dengan `Navigator.pushReplacement()`
- Jika gagal (username sudah ada atau validasi error), menampilkan dialog error dengan pesan dari Django
- Terdapat link "Already have an account? Login" di bawah form untuk navigasi ke halaman login

### Membuat halaman login pada proyek tugas Flutter.
- Saya buat file login.dart di folder screens, yang berisi input username dan password, yang lalu akan dikirim ke API login di web PBP saya. 

### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
- Saya membuat app `authentication` di Django dengan views untuk login, logout, dan register
- Menambahkan routing di `urls.py` untuk endpoint `/auth/login/`, `/auth/logout/`, dan `/auth/register/`
- Di Flutter, saya gunakan `Provider` untuk share instance `CookieRequest` ke seluruh aplikasi di `main.dart`
- Saya implementasikan login flow di `login.dart` yang memanggil `request.login()` dan menyimpan data user (username, userID)
- Untuk register, saya buat `register.dart` yang mengirim data ke endpoint register Django
- Logout diimplementasikan di drawer dengan memanggil `request.logout()` dan redirect ke login page

### Membuat model kustom sesuai dengan proyek aplikasi Django.
- Saya memasukkan JSON yang ada di web PBP lalu masukkan ke QuickType, dengan nama model Product. Lalu saya buat folder model dan product_entry disitu dan saya masukkan kode yang sudah digenerate oleh QuickType. 

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
- Saya buat file `product_entry_list.dart` di folder screens
- Menggunakan `FutureBuilder` untuk fetch data dari endpoint `/json/` menggunakan `request.get()`
- Data JSON yang diterima di-parse menggunakan model `Product.fromJson()` menjadi List<Product>
- Menampilkan loading indicator dengan `CircularProgressIndicator` saat data sedang di-fetch
- Jika data kosong, menampilkan pesan "Belum ada data produk"
- Jika ada data, maka akan ditampilkan menggunakan `ListView.builder`

#### Tampilkan name, price, description, thumbnail, category, dan is_featured dari masing-masing item pada halaman ini (Dapat disesuaikan dengan field yang kalian buat sebelumnya).
- Thumbnail: Menggunakan `Image.network()` dengan proxy image untuk handle CORS, dilengkapi error builder untuk menampilkan icon broken_image jika gambar gagal load.
- Name: Ditampilkan sebagai judul dengan font bold
- Category: Badge hijau 
- Price: Format rupiah dengan thousand separator menggunakan regex
- Stock: Ditampilkan dengan warna hijau
- Description: Preview 100 karakter pertama dengan ellipsis jika lebih panjang
- isFeatured: Badge "Featured" yang hanya muncul jika product.isFeatured == true

### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
#### Halaman ini dapat diakses dengan menekan salah satu card item pada halaman daftar Item.
- Di item builder card, saya tambahkan kode onTap yang akan push ke halaman detail dengan konteks produk yang pada card tersebut.

#### Tampilkan seluruh atribut pada model item kamu pada halaman ini.
- Saya buat file `product_detail.dart` yang menerima object `Product` melalui constructor
- Lalu semua atribut akan ditampilkan dalam `SingleChildScrollView` agar scrollable:
- Thumbnail: Menggunakan `Image.network()` dengan proxy image untuk handle CORS, dilengkapi error builder untuk menampilkan icon broken_image jika gambar gagal load.
- Name: Ditampilkan sebagai judul dengan font bold
- Category: Badge hijau 
- Price: Format rupiah dengan thousand separator menggunakan regex
- Stock: Ditampilkan dengan warna hijau
- Description: Preview 100 karakter pertama dengan ellipsis jika lebih panjang
- isFeatured: Badge "Featured" yang hanya muncul jika product.isFeatured == true

#### Tambahkan tombol untuk kembali ke halaman daftar item.
- Sebelumnya, ketika card sebuah product diklik, saya buat navigator untuk push supaya user bisa kembali ke screen sebelumnya. 
- Di file product_detail.dart saya tambahkan button "arrow", yang akan membuat navigator pop screen saat ini sehingga user kembali ke screen sebelumnya.

### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
- Saya tambahkan kode di method login di django, yang akan mengirim userID user yang ingin login. 
- Di file product_entry_list.dart saya tambahkan tombol AllProduct dan MyProduct yang akan loop semua data produk yang ada untuk sort berdasar userID tersebut jika tombol myProduct diklik.

</details>