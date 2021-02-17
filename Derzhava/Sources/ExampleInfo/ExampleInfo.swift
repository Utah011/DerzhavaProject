//
//  NewsModel.swift
//  Derzhava
//
//  Created by Andrew Kolbasov on 03.11.2020.
//  Copyright © 2020 Andrew Kolbasov. All rights reserved.
//

import Foundation
import UIKit

var newsArray:[News] = []
var answersArray:[Answers] = []
var secondAnswersArray:[Answers] = []
var mainDebateArray:[MainDebateModel] = []
var eternalQuestionsArray:[EternalQuestions] = []
var twitArray:[Twit] = []

func exampleFilling(){
    for i in 1...9{
        let salon = News(newstitle: "Состояние Трампа внушает большое беспокойство", newstext: "Имущество фирмы составляют основные и оборотные средства, а также иные ценности, стоимость которых отражается на самостоятельном балансе предприятия и формируется из собственных и заемных средств. Финансовые ресурсы предприятия формируются за счет прибыли от его деятельности. Имущество фирмы составляют основные и оборотные средства, а также иные ценности, стоимость которых отражается на самостоятельном балансе предприятия и формируется из собственных и заемных средств. Финансовые ресурсы предприятия формируются за счет прибыли от его деятельности. которых отражается на самостоятельном балансе предприятия и формируется из собственных и заемных средств. Финансовые ресурсы предприятия формируются за счет прибыли от его деятельности.", id: 1, photo: UIImage(named: "newspicture")!, logoofwriter: UIImage(named: "riabiglogo")!, numberofallviews: "137k", signatureofwriter: "РИА • 12:00")
        newsArray.append(salon)
    }
}

func exampleAnswers(){
    for i in 1...20{
        let answers = Answers(photo: UIImage(named: "polit")!, namesurname: "Денис Мантуров", position: "Министр промышленности и торговли Российской Федерации", maintext: "Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник, Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали. Последние сутки внушали большое беспокойство. Последующие 48 часов будут критически важны с точки зрения его лечения. Мы еще пока не стоим на четком пути к полному выздоровлению — заявил источник, Источник, знакомый с состоянием здоровья заболевшего COVID-19 президента США Дональда Трампа, заявил журналистам, что его показатели за последние сутки внушали.", time: "14:20")
        answersArray.append(answers)
    }
    // в гит
    // держава копи - главная
    
    for i in 1...20{
        let secondanswers = Answers(photo: UIImage(named: "zhirinovskiy")!, namesurname: "Владимир Жириновский", position: "Руководитель фракции ЛДПР", maintext: "Ещё одна проблема Конституции — сверхбольшие полномочия президента. Они больше, чем были у генсека и царя. Конституция фактически допускает скрытую форму монархии. Президент всё время может оставлять преемников и, пользуясь огромной властью, обеспечивать им победу на выборах. Ещё одна проблема Конституции — сверхбольшие полномочия президента. Они больше, чем были у генсека и царя. Конституция фактически допускает скрытую форму монархии. Президент всё время может оставлять преемников.", time: "16:32")
        secondAnswersArray.append(secondanswers)
        
        for i in 1...9{
            let eternalquestions = EternalQuestions(title: "Почему ВВП не растет с 2008 года? ", maintext: "Несмотря на внешнее сходство с кризисами 1998 и 2008 гг., последний спад оказался куда глубже и сложнее. Его можно сравнить лишь с трансформационным периодом 1990-х гг.")
            eternalQuestionsArray.append(eternalquestions)
        }
        
        for i in 1...9{
            let twits = Twit(photoOfUser: UIImage(named: "polit")!, name: "Издание", newsPhoto: UIImage(named: "newspicture")!, time: "12.01.21", twitText: "Несмотря на внешнее сходство с кризисами 1998 и 2008 гг., последний спад оказался куда глубже и сложнее. Его можно сравнить лишь с трансформационным периодом 1990-х гг.")
            twitArray.append(twits)
        }
        for i in 1...9{
            let debate = MainDebateModel(firstUserPhoto: UIImage(named: "polit")!, secondUserPhoto: UIImage(named: "zhirinovskiy")!, firstUserName: "Денис Мантуров", secondUserName: "Владимир Жириновский", debateTheme: "Выборы • 587к", titleDebate: "Выборы в московскую городскую Думу", mainTextDebate: "Леонид: Кроме того, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также содержится». Кроме того, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также содержится» Кроме того, как утверждают в СК, «ни в одном из предоставленных медицинскими учреждениями документов такая информация также содержится»")
            mainDebateArray.append(debate)
        }
    }
    
    
}


//1000
//2000
//4000
//6000
//8000
//10000
//15000
//20000
//25000
//30000

let data = [
    TheseUsersAreAskedToRespond(title: "Виталий Милонов", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "milonov")),
    TheseUsersAreAskedToRespond(title: "Владимир Жириновский", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "zhirinovskiy")),
    TheseUsersAreAskedToRespond(title: "Денис Мантуров", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "polit")),
    TheseUsersAreAskedToRespond(title: "Сергей Собянин", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "sob")),
    TheseUsersAreAskedToRespond(title: "Алексей Кудрин", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "kud"))
]
