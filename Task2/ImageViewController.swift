//
//  ImageViewController.swift
//  Task2
//
//  Created by Amit Sharma on 24/03/23.
//

import UIKit
import SDWebImage

struct AlbumResponse: Codable {
    let resultCount: Int
    let results: [Album]
}

struct Album: Codable {
    var artistName: String
    var collectionName: String?
    var artworkUrl100: String
}

class ImageViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var myTable: UITableView!
    
    var albums = [Album]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath) as! NewFileTableViewCell
        cell.artistNameLable.text = albums[indexPath.row].artistName
        cell.albumLable.text = albums[indexPath.row].collectionName
        
        let imageStr = albums[indexPath.row].artworkUrl100
        if let imageurl = URL(string: imageStr){
//            let data = try? Data(contentsOf: imageurl)
//            cell.imageLable.image = UIImage(data: data!)
            cell.imageLable.contentMode = .scaleAspectFill
            cell.imageLable.sd_setImage(with: imageurl)
            
            
            
            
        }else{
            debugPrint("imagenotfound")
        }
        return cell
    }
    
    func getData(){
        let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson&limit=60")
        URLSession.shared.dataTask(with: url!, completionHandler: {[weak self] data, response, error in
            if let error = error {
                debugPrint(error)
            }
            else if let data = data {
                do {
                    let albumResponse = try JSONDecoder().decode(AlbumResponse.self, from: data)
                    self?.albums = albumResponse.results
                    DispatchQueue.main.async {
                        self?.myTable.reloadData()
                    }
                } catch  {
                    debugPrint(error)
                }
            }
            else {
                debugPrint("Something went wrong.")
            }
        })
        .resume()
    }
}






