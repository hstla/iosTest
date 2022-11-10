//
//  PoiData.swift
//  MapSample
//
//  Created by 황현성 on 2022/02/11.
//

import Foundation
class PoiItem: Codable {
    let SIGUN_NM: String
    let SIGUN_CD: String
    let RESTRT_NM: String
    let REPRSNT_FOOD_NM: String
    let TASTFDPLC_TELNO: String
    let REFINE_LOTNO_ADDR: String
    let REFINE_ROADNM_ADDR: String
    let REFINE_ZIP_CD: String
    let REFINE_WGS84_LOGT: String
    let REFINE_WGS84_LAT: String
}

class PoiData: ObservableObject {
    @Published var rows = [PoiItem]()
    func startLoading() {
        NSLog("startLoading()")
        let strUrl = "\(Const.baseUrl)?Type=json&Key=\(Const.key)"
        guard let url = URL(string: strUrl) else {
            print("Failed to build url with \(strUrl)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                print("No data from dataTask with url: \(strUrl)")
                return
            }
            guard let pois = self.parse(data: data) else {
                print("Parse failed")
                return
            }
            NSLog("endLoading(1)")
            OperationQueue.main.addOperation {
                NSLog("endLoading(2). loaded \(pois.count) items")
                self.rows = pois
            }
        }
        task.resume()
        print("Unimplemented")
    }
    struct Const {
        static let baseUrl = "https://openapi.gg.go.kr/PlaceThatDoATasteyFoodSt"
        static let key = "e92ec3e6a9f44981974d4746d28f8995"
    }
    func parse(data: Data) -> [PoiItem]? {
        guard let root = try? JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            return nil
        }
        guard let arr = root["PlaceThatDoATasteyFoodSt"] as? [Any] else {
            return nil
        }
        guard let rowobj = arr[1] as? [String:[Any]] else {
            return nil
        }
        guard let items = rowobj["row"] else {
            return nil
        }
        var pois = [PoiItem]()
        for item in items {
            print("-----------", item)
            guard let poi = PoiItem.from(dictionary: item) else {
                continue
            }
            pois.append(poi)
        }
        return pois
    }
}

fileprivate extension PoiItem {
    static func from(dictionary: Any) -> PoiItem? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary) else {
            print("toJson failed")
            return nil
        }
        let decoder = JSONDecoder()
        guard let item = try? decoder.decode(PoiItem.self, from: data) else {
            print("deder failed")
            return nil
        }
        return item
    }
}
