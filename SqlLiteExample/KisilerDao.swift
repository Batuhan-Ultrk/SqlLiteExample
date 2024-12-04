//
//  KisilerDao.swift
//  SqlLiteExample
//
//  Created by Batuhan Ulutürk on 11.06.2024.
//

import Foundation

class KisilerDao {
    let db : FMDatabase?
    
    init() {
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path : hedefYol.path)
    }
    
    func TumKisileriGetir() {
        db?.open()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while result.next() {
                let kisi_id = result.string(forColumn: "kisi_id")!
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                print("-------------------------------------")
                print("Kişi Id : \(kisi_id)")
                print("Kişi Ad : \(kisi_ad)")
                print("Kişi Tel : \(kisi_tel)")
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kaydet(kisi_ad : String, kisi_tel : String)  {
        db?.open()
        do{
           try db?.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad , kisi_tel])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func guncelle(kisi_id : Int ,kisi_ad : String, kisi_tel : String)  {
        db?.open()
        do{
            try db?.executeUpdate("UPDATE kisiler SET kisi_ad = ? , kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad , kisi_tel, kisi_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func sil(kisi_id : Int){
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func getir(kisi_id : Int){
        db?.open()
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
        
            while result.next(){
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                print("----------------------------")
                print("Kişi Ad : \(kisi_ad)")
                print("Kişi Ad : \(kisi_tel)")
            }
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func aramaYap(aramaKelimesi:String){
        db?.open()
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad LIKE ?", values: ["%\(aramaKelimesi)%"])
            
            while result.next(){
                let ad = result.string(forColumn: "kisi_ad")!
                let tel = result.string(forColumn: "kisi_tel")!
                let id = result.string(forColumn: "kisi_id")!
                
                print("Kişi Ad \(ad)")
                print("Kişi Tel \(tel)")
                print("Kişi ID \(id)")
            }
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
