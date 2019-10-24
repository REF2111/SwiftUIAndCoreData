//
//  ThingCell.swift
//  SwiftUIAndCoreData
//
//  Created by Raphael Berendes (extern) on 24.10.19.
//  Copyright © 2019 Raphael Berendes (extern). All rights reserved.
//

import SwiftUI

struct ThingCell: View {
    
    var name: String?
    
    init(with name: String?) {
        
        self.name = name
    }
    
    var body: some View {
        
        Text(name ?? "No name")
            .frame(width: UIScreen.main.bounds.width - 40, height: 80, alignment: .center)
            .background(Color.gray)
            .cornerRadius(5)
    }
    
}

struct ThingCell_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ThingCell(with: "Placeholder")
    }
    
}
