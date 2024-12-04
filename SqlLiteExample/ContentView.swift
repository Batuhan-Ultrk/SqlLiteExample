//
//  ContentView.swift
//  SqlLiteExample
//
//  Created by Batuhan Ulutürk on 11.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Getir"){
                let kdo = KisilerDao()
                kdo.TumKisileriGetir()
            }
            Button("Kaydet"){
                let kdo = KisilerDao()
                kdo.kaydet(kisi_ad: "Ahmet", kisi_tel: "1111")
            }
            Button("Güncelle"){
                let kdo = KisilerDao()
                kdo.guncelle(kisi_id: 3, kisi_ad: "Ahmetxx", kisi_tel: "2222x")
            }
            Button("Sil"){
                let kdo = KisilerDao()
                kdo.sil(kisi_id: 3)
            }
            Button("Tek Kayıt Getir"){
                let kdo = KisilerDao()
                kdo.getir(kisi_id: 4)
            }
            
            Button("Arama Yap"){
                let kdo = KisilerDao()
                kdo.aramaYap(aramaKelimesi: "met")
            }
        }
        .onAppear(perform: {
            veritabaniniYukle()
        })
        .padding()
    }
    
    func veritabaniniYukle()  {
        let bundle = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("rehber.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: hedefYol.path) {
           print("Veritabanı Daha Önce Kopyalandı")
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
