//
//  ViewController.swift
//  Todo4
//
//  Created by 豊嶋洸人 on 2019/01/20.
//  Copyright © 2019年 豊嶋洸人. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    // アイテムの型
    class Item {
        var title : String
        var done: Bool = false
        init(title: String) {
            self.title = title
        }
    }
    
    // この配列に作ったアイテムを追加していく
    var itemArray: [Item] = []
    //UI table viewコントローラーのviewdidload?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NaviBarのタイトルをでかく
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // あらかじめ3つアイテムを作っておく
        let item1: Item = Item(title: "宿題をする")
        let item2: Item = Item(title: "牛乳を買う")
        let item3: Item = Item(title: "手紙を書く")
        
        // 配列に追加
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)
        
    }
    
    // MARK - セルの数を指定
    //関数を使う時に_ラベル必要なし
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //行数
        return itemArray.count
    }
    
    // MARK - セルのカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        //矢印の表示
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたセルに実行される処理
        
        //同じ大きさの配列を作る
        let item = itemArray[indexPath.row]
        
        // チェックマーク
        item.done = !item.done
        
        // リロードしてUIに反映
        self.tableView.reloadData()
        
        // セルを選択した時の背景の変化を遅くする
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - 新規アイテム追加機能
    @IBAction func addButtonPressed(_ sender: Any) {
        // プラスボタンが押された時に実行される処理
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "新しいアイテムを追加", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
            // 「リストに追加」を押された時に実行される処理
            
            let newItem: Item = Item(title: textField.text!)
            
            // アイテム追加処理
            self.itemArray.append(newItem)
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "新しいアイテム"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK - 新規アイテム追加機能
    
        // プラスボタンが押された時に実行される処理
    @IBAction func TodoAddButton(_ sender: Any) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "新しいアイテムを追加", message: "", preferredStyle: .alert)
        
        //クロージャ(戻り値なし)
        let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
            // 「リストに追加」を押された時に実行される処理
            let newItem: Item = Item(title: textField.text!)
            
            // アイテム追加処理
            self.itemArray.append(newItem)
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "新しいアイテム"
            textField = alertTextField
        }
        //presentはしたから出てくるやつ
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // アイテム削除処理
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    


    
}


