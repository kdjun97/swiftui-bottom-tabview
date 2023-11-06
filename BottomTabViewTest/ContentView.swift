import Foundation
import SwiftUI

public struct ContentView : View {
    @State var selectedIndex: Int = 0
    let menuList = [MenuInformation.home, MenuInformation.book, MenuInformation.cat, MenuInformation.profile]
    
    public init() {}
    
    public var body : some View {
        ZStack(alignment: .bottom) {
            mainBody
        }
    }
    
    private var mainBody : some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                FirstView().tag(0)
                SecondView().tag(1)
                ThirdView().tag(2)
                FourthView().tag(3)
            }.overlay(
                Color.clear
                    .edgesIgnoringSafeArea(.horizontal)
                    .frame(height: 64)
                    .overlay(
                        alignment: .leading, content: {
                            HStack (spacing:0) {
                                ForEach(menuList, id: \.self) { menu in
                                    MenuButton(selectedIndex: $selectedIndex, menu: menu)
                                        .padding(
                                            EdgeInsets(
                                                top: 0,
                                                leading: (menu.rawValue == 0) ? 22 : 0,
                                                bottom: 0,
                                                trailing: (menu.rawValue != 3) ? 22 : 0
                                            )
                                        )
                                }
                            }
                        }
                    ).padding(EdgeInsets(top: 0,leading: 12,bottom: 0,trailing: 12)), alignment: .bottom)
        }
    }
}

enum MenuInformation : Int {
    case home = 0
    case book = 1
    case cat = 2
    case profile = 3
    
    func getName() -> String {
        switch (self) {
        case .home:
            return "Home"
        case .book:
            return "Book"
        case .cat:
            return "Cat"
        case .profile:
            return "Profile"
        }
    }
    
    func getImage() -> Image {
        switch (self) {
        case .home:
            return Image(systemName: "house")
        case .book:
            return Image(systemName: "book")
        case .cat:
            return Image(systemName: "cat")
        case .profile:
            return Image(systemName: "person")
        }
    }
}

struct MenuButton : View {
    @Binding var selectedIndex : Int
    let menu: MenuInformation
    
    var body : some View {
        VStack (spacing:0) {
            Button(action: {
                selectedIndex = menu.rawValue
            }, label: {
                menu.getImage()
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(selectedIndex == menu.rawValue ? .red : .gray)
            }).padding(.bottom, 6)
            Text(menu.getName()).font(.system(size: 10)).foregroundColor(selectedIndex == menu.rawValue ? .red : .gray)
        }.frame(width: 64,height: 44).padding(.top, 12)
    }
}

struct FirstView : View {
    var body : some View {
        VStack {
            Text("Home View for test")
        }
    }
}

struct SecondView : View {
    var body : some View {
        VStack {
            Text("Book View for test")
        }
    }
}

struct ThirdView : View {
    var body : some View {
        VStack {
            Text("Cat View for test")
        }
    }
}

struct FourthView : View {
    var body : some View {
        VStack {
            Text("Profile View for test")
        }
    }
}
