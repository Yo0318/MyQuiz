//
//  StartViewCOntroller.swift
//  MyQuiz
//
//  Created by yo on 2020/06/13.
//  Copyright © 2020 yo. All rights reserved.
//

import UIKit

class StartViewController:UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //Do any additional set up after loading the view.
    }
    //次の画面に遷移する前に呼び出される準備処理
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        
        //遷移先画面の呼び出し
        guard let nextViewController=segue.destination as?QuestionViewController else{
            return
        }  // 変数チェック
        
        //問題文の取り出し
        guard let questionData=QuestionDataManager.sharedInstance.nextQuestion()else{
            //取得できずに終了
            return
        }
        
        //問題文のセット
        nextViewController.questionData=questionData
    }
    
    //タイトルに戻ってくるときに呼び出される処理
    @IBAction func goToTitle(_segue:UIStoryboardSegue){
        
    }
}
