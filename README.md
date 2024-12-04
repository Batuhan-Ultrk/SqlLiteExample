# SqlLiteExample

**SqlLiteExample**, FMDB kullanarak SQLite veritabanı işlemlerini Swift ile gerçekleştiren bir örnek projedir. Bu proje, SQLite dosyasını manuel olarak dışarıdan entegre etme ve FMDB kullanarak CRUD işlemlerini gerçekleştirme üzerine odaklanır.

---

## Özellikler

- Harici bir SQLite dosyasının manuel entegrasyonu.
- **FMDB** ile CRUD (Create, Read, Update, Delete) işlemleri.
- Veritabanı bağlantısı ve sorgu yönetimi.
- SwiftUI projelerine kolay entegrasyon.

---

## Kurulum

### 1. **FMDB Dosyalarını Manuel Olarak Entegre Etme**

1. **FMDB Kütüphanesini İndirin**  
   [FMDB GitHub Repository](https://github.com/ccgus/fmdb)'den FMDB dosyalarını indirin. Gerekli dosyalar:
   - `FMDatabase.h`
   - `FMDatabase.m`
   - `FMResultSet.h`
   - `FMResultSet.m`

2. **FMDB Dosyalarını Projeye Ekleyin**  
   İndirdiğiniz dosyaları projenizin Xcode dosya yapısına sürükleyip bırakın ve projeye ekleyin. FMDB Objective-C tabanlı olduğu için bir **Bridging Header** dosyası eklemeniz gerekecek.

3. **Bridging Header Ekleyin**
   - Xcode'da `File > New > File > Header File` seçeneğiyle bir header dosyası oluşturun.
   - Dosyayı **ProjeAdı-Bridging-Header.h** olarak adlandırın.
   - `Build Settings > Swift Compiler - General > Objective-C Bridging Header` kısmına dosya yolunu ekleyin (örneğin: `ProjeAdı/ProjeAdı-Bridging-Header.h`).
   - Header dosyasına şu satırı ekleyin:
     ```objective-c
     #import "FMDatabase.h"
     ```

### 2. **SQLite Dosyasını Projeye Ekleme**

Harici bir SQLite dosyasını projede kullanmak için:

1. SQLite dosyanızı projenizin ana dizinine sürükleyip bırakın (örneğin, `example.sqlite`).
2. "Copy items if needed" seçeneğini işaretleyerek dosyayı projeye ekleyin.

