import UIKit

struct PoiItem: Codable {
    let SIGUN_NM: String
    let SIGUN_CD: String
    let RESTRT_NM: String
    let REPRSNT_FOOD_NM: String
    let TASTFDPLC_TELNO: String
    let REFINE_LOTNO_ADDR: String
    let REFINE_ROADNM_ADDR: String
    let REFINE_ZIP_CD: String
    let REFINE_WGS84_LOGT: Double
    let REFINE_WGS84_LAT: Double
}

let jsonData = """
{
  "PlaceThatDoATasteyFoodSt": [
    {
      "head": [
        {
          "list_total_count": 137
        },
        {
          "RESULT": {
            "CODE": "INFO-000",
            "MESSAGE": "정상 처리되었습니다."
          }
        },
        {
          "api_version": "1.0"
        }
      ]
    },
    {
      "row": [
        {
          "SIGUN_NM": "의정부시",
          "SIGUN_CD": "41150",
          "RESTRT_NM": "핏제리아 루카",
          "REPRSNT_FOOD_NM": "마르게리따 피자",
          "TASTFDPLC_TELNO": "031-851-3589",
          "RM_MATR": null,
          "REFINE_LOTNO_ADDR": "경기도 의정부시 민락동 776-2번지",
          "REFINE_ROADNM_ADDR": "경기도 의정부시 송현로82번길 17",
          "REFINE_ZIP_CD": "11813",
          "REFINE_WGS84_LOGT": "127.0904053",
          "REFINE_WGS84_LAT": "37.7454846"
        },
        {
          "SIGUN_NM": "이천시",
          "SIGUN_CD": "41500",
          "RESTRT_NM": "증포설렁탕",
          "REPRSNT_FOOD_NM": "설렁탕, 도가니탕",
          "TASTFDPLC_TELNO": "031-635-7877",
          "RM_MATR": null,
          "REFINE_LOTNO_ADDR": "경기도 이천시 증포동 368번지",
          "REFINE_ROADNM_ADDR": "경기도 이천시 증신로 166",
          "REFINE_ZIP_CD": "17346",
          "REFINE_WGS84_LOGT": "127.4512903",
          "REFINE_WGS84_LAT": "37.2902983"
        }
    ]}
]}
""".data(using: .utf8)!

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
        guard let poi = PoiItem.from(dictionary: item) else {
            continue
        }
        pois.append(poi)
    }
    return pois
}

extension PoiItem {
    static func from(dictionary: Any) -> PoiItem? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary) else {
            return nil
        }
        let decoder = JSONDecoder()
        guard let item = try? decoder.decode(PoiItem.self, from: data) else {
            return nil
        }
        return item
    }
}

let items = parse(data: jsonData)
//let result = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any]

//let r2 = result!["PlaceThatDoATasteyFoodSt"] as! [Any]
//let r3 = r2[1] as! [String:Any]
//let r4 = r3["row"] as! [Any]
//let r5 = r4[0]
//let decoder = JSONDecoder()
//decoder.decode(, from: [String:Any])
