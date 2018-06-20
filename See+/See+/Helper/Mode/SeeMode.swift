//
//  SeeMode.swift
//  See plus
//
//  Created by Quentin CLEMENT on 14/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

enum SeeRubric: Int {
    case art
    case castle
    case green
    case museum
    case nightlife
    case cinema
}

class SeeMode: NSObject {
    
    class func activatedMode() -> UserMode {
        if Defaults[.connectedUserMode] == 0 {
            return .discover
        } else {
            return .propose
        }
    }
    
    class func colorForActivatedMode(mode: UserMode = UserMode(rawValue: Defaults[.connectedUserMode])!) -> UIColor {
        if mode == .discover {
            return .appPurple() // discover
        } else {
            return .appRed() // propose
        }
    }
    
    class func experiences(rubric: SeeRubric) -> [SeeExperience] {
        switch rubric {
        case .cinema:
            return [SeeExperience(name: NSLocalizedString("cine.besson", comment: ""), location: "93210 Saint-Denis", imageName: "besson", author: "Bob", mapPositionRatio: (0.535, 0.31)), // Saint Denis PLeyel
                SeeExperience(name: NSLocalizedString("cine.magic", comment: ""), location: "93000 Bobigny", imageName: "bobigny", author: "Bob", mapPositionRatio: (0.63, 0.33)), // Mairie Aubervillier
                SeeExperience(name: NSLocalizedString("cine.butte", comment: ""), location: "75018 Paris", imageName: "butte", author: "Bob", mapPositionRatio: (0.72, 0.32)), // Drancy
                SeeExperience(name: NSLocalizedString("cine.studio", comment: ""), location: "93330 Aubervilliers", imageName: "studio", author: "Bob", mapPositionRatio: (0.525, 0.415)), // Abbesses
                SeeExperience(name: NSLocalizedString("cine.fr", comment: ""), location: "75002 Paris", imageName: "cine", author: "Bob", mapPositionRatio: (0.64, 0.6)), // Bercy
                SeeExperience(name: NSLocalizedString("cine.jerome", comment: ""), location: "75013 Paris", imageName: "seydoux", author: "Bob", mapPositionRatio: (0.58, 0.6)) // Jussieu
            ]
        case .castle:
            return [SeeExperience(name: NSLocalizedString("monu.toit", comment: ""), location: "750018 Paris", imageName: "defense", author: "Bob", mapPositionRatio: (0.35, 0.415)), // La défence : Arche
                SeeExperience(name: NSLocalizedString("monu.condorcet", comment: ""), location: "75009 Paris", imageName: "condorcet", author: "Bob", mapPositionRatio: (0.495, 0.44)), // Gare Saint Lazare : Condorcert collège
                SeeExperience(name: NSLocalizedString("monu.prison", comment: ""), location: "75005 Paris", imageName: "prison", author: "Bob", mapPositionRatio: (0.52, 0.54)), // Saint Michel: Conciergerie
                SeeExperience(name: NSLocalizedString("monu.malmaison", comment: ""), location: "75006 Paris", imageName: "malmaison", author: "Bob", mapPositionRatio: (0.33, 0.52)), // Rueil : Chateau de malmaison
                SeeExperience(name: NSLocalizedString("monu.mosq", comment: ""), location: "75005 Paris", imageName: "mosque", author: "Bob", mapPositionRatio: (0.65, 0.57)), // Gare Austerlizt : Grand mosquée
                SeeExperience(name: NSLocalizedString("monu.observ", comment: ""), location: "92190 Meudon", imageName: "meudon", author: "Bob", mapPositionRatio: (0.47, 0.655)), // Clamart : Observatoir meudon
                SeeExperience(name: NSLocalizedString("monu.peur", comment: ""), location: "75002 Paris", imageName: "peur", author: "Bob", mapPositionRatio: (0.42, 0.7)), // Issy: Tour Anne de Bretagne
                SeeExperience(name: NSLocalizedString("monu.vanne", comment: ""), location: "93005 Paris", imageName: "vanne", author: "Bob", mapPositionRatio: (0.55, 0.66)), // Bagneu - Cachan : Acuqeduc
                SeeExperience(name: NSLocalizedString("monu.asnières", comment: ""), location: "92600 Asnières sur Seine", imageName: "asniere", author: "Bob", mapPositionRatio: (0.57, 0.69)) // Villejuif IGR : Chateau asnières
            ]
        case .green:
            return [SeeExperience(name: NSLocalizedString("vert.pinson", comment: ""), location: "95360 Montmagny", imageName: "pinson", author: "Bob", mapPositionRatio: (0.67, 0.225)), // Bourget : La butte Pinson
                SeeExperience(name: NSLocalizedString("vert.plage", comment: ""), location: "95290 L’Isle-Adam", imageName: "islam", author: "Bob", mapPositionRatio: (0.525, 0.31)), // Saint Denis PLeyel : Plage islam
                SeeExperience(name: NSLocalizedString("vert.ourcq", comment: ""), location: "93600 Aulnay sous bois", imageName: "ourcq", author: "Bob", mapPositionRatio: (0.61, 0.44)), // Stalingrad : Ourcq
                SeeExperience(name: NSLocalizedString("vert.vincennes", comment: ""), location: "75012 Paris", imageName: "vinc", author: "Bob", mapPositionRatio: (0.71, 0.55)), // Chateau vincenne :  Bois de Vincennes
                SeeExperience(name: NSLocalizedString("vert.cloud", comment: ""), location: "92210 Saint-Cloud", imageName: "cloud", author: "Bob", mapPositionRatio: (0.33, 0.58)), // Saint Cloud : Saint cloud le duc
                SeeExperience(name: NSLocalizedString("vert.bercy", comment: ""), location: "75012 Paris", imageName: "bercy", author: "Bob", mapPositionRatio: (0.64, 0.6)), // Bercy : Parc de Bercy
                SeeExperience(name: NSLocalizedString("vert.loups", comment: ""), location: "92290 Châtenay-Malabry", imageName: "loups", author: "Bob", mapPositionRatio: (0.5, 0.7)) // Robinson : Vallée aux Loups
            ]
        case .nightlife:
            return [SeeExperience(name: NSLocalizedString("noct.moon", comment: ""), location: "75011 Paris", imageName: "moon", author: "Bob", mapPositionRatio: (0.62, 0.52)), // Bastille : Moonshiner
                SeeExperience(name: NSLocalizedString("noct.bleu", comment: ""), location: "75012 Paris", imageName: "bleu", author: "Bob", mapPositionRatio: (0.61, 0.54)), // Gare de lyon : Train bleu
                SeeExperience(name: NSLocalizedString("noct.ferme", comment: ""), location: "92000 Nanterre", imageName: "ferme", author: "Bob", mapPositionRatio: (0.32, 0.4)), // Naterre la folie : Ferme du bonheur
                SeeExperience(name: NSLocalizedString("vert.chez", comment: ""), location: "94340 Joinville-le-Pont", imageName: "chez", author: "Bob", mapPositionRatio: (0.79, 0.62)), // Joinville le pont : Chez gégène
                SeeExperience(name: NSLocalizedString("noct.emb", comment: ""), location: "95110 Sannois", imageName: "emb", author: "Bob", mapPositionRatio: (0.59, 0.45)), // Gare du nord EMB
                SeeExperience(name: NSLocalizedString("noct.piaules", comment: ""), location: "75011 Paris", imageName: "piaules", author: "Bob", mapPositionRatio: (0.64, 0.46)), // Belleville : Piaules
                SeeExperience(name: NSLocalizedString("noct.chinois", comment: ""), location: "93100 Montreuil", imageName: "chin", author: "Bob", mapPositionRatio: (0.7, 0.5)), // Croix chaveaux : Chinois
                SeeExperience(name: NSLocalizedString("noct.plan", comment: ""), location: "91130 Ris-Orangis", imageName: "plan", author: "Bob", mapPositionRatio: (0.73, 0.68)) ] // Le vert de maison : Le plan
        case .art:
            return [SeeExperience(name: NSLocalizedString("art.recollets", comment: ""), location: "75010 Paris", imageName: "recollet", author: "Bob", mapPositionRatio: (0.596, 0.465)), // Gare de l’est √ Couvent des Récollets
                SeeExperience(name: NSLocalizedString("art.corbusier", comment: ""), location: "75016 Paris", imageName: "corbusier", author: "Bob", mapPositionRatio: (0.393, 0.583)), // Michel Ange √ Apt Corbusier
                SeeExperience(name: NSLocalizedString("art.cartier", comment: ""), location: "74014 Paris", imageName: "cartier", author: "Bob", mapPositionRatio: (0.535, 0.575)), // Denfer Rochereau √ Fondation cartier
                SeeExperience(name: NSLocalizedString("art.frigos", comment: ""), location: "75013 Paris", imageName: "frigo", author: "Bob", mapPositionRatio: (0.627, 0.608)), // Biblio Francois Mit √
                SeeExperience(name: NSLocalizedString("art.quatre", comment: ""), location: "75019 Paris", imageName: "cent", author: "Bob", mapPositionRatio: (0.617, 0.42)), // Riquet √ 104
                SeeExperience(name: NSLocalizedString("art.phil", comment: ""), location: "75019 Paris", imageName: "phil", author: "Bob", mapPositionRatio: (0.662, 0.42)), // Porte de Pantin √ Phila
                SeeExperience(name: NSLocalizedString("art.val", comment: ""), location: "94400 Vitry-sur-Seine", imageName: "mac", author: "Bob", mapPositionRatio: (0.66, 0.66)), // Vitry centre √ MAC/VAL
                SeeExperience(name: NSLocalizedString("art.monzie", comment: ""), location: "92420 Vaucresson", imageName: "stein", author: "Bob", mapPositionRatio: (0.32, 0.617)), // Saint clou √ Steine
                SeeExperience(name: NSLocalizedString("art.seine", comment: ""), location: "92100 Boulogne-Billancourt", imageName: "sein", author: "Bob", mapPositionRatio: (0.375, 0.66))] // Pont de sèvre √ Seine musicale
        case .museum:
            return [SeeExperience]()
        }
    }

}
