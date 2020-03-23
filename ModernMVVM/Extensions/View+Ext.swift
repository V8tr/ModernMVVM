//
//  View+Ext.swift
//  ModernMVVM
//
//  Created by Vadim Bulavin on 3/20/20.
//  Copyright © 2020 Vadym Bulavin. All rights reserved.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView { AnyView(self) }
}
