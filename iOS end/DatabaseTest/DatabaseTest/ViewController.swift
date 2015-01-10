//
//  ViewController.swift
//  DatabaseTest
//
//  Created by Tanmay Bakshi on 2014-09-02.
//  Copyright (c) 2014 TBSS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview: UITableView!
    @IBOutlet var inputFriendName: UITextField!
    @IBOutlet var inputFriendInfo: UITextField!
    
    var data: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = dataOfJson("http://tanmaybakshi.com/extra/serviceselect.php")
        println(data)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reload() {
        data = dataOfJson("http://tanmaybakshi.com/extra/serviceselect.php")
        self.tableview.reloadData()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func dataOfJson(url: String) -> NSArray {
        var data = NSData(contentsOfURL: NSURL(string: url)!)
        return (NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSArray)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: additionInfoCell = self.tableview.dequeueReusableCellWithIdentifier("customCell") as additionInfoCell
        var maindata = (data[indexPath.row] as NSDictionary)
        cell.friendName!.text = maindata["Name"] as String
        cell.friendInfo!.text = maindata["Additional Info"] as String
        return cell
    }
    
    @IBAction func uploadToDatabase() {
        var url: NSString = "http://www.tanmaybakshi.com/extra/servicequery.php?x=\(inputFriendName.text)&y=\(inputFriendInfo.text)"
        url = url.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        url = url.stringByReplacingOccurrencesOfString("/n", withString: "%0A")
        var data = NSData(contentsOfURL: NSURL(string: url)!)
        var result = NSString(data: data!, encoding: NSUTF8StringEncoding)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

