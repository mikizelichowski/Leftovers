//
//  MainView.swift
//  Leftovers
//
//  Created by Mikolaj Zelichowski on 23/10/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @Namespace var animation
    // Hidding Tab Bar
    init(){
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().isHidden = true
    }
    
    let screen = UIScreen.main.bounds
    @State var showTabBar: Bool = true
    @State private var isVisibleAddButtons: Bool = false
    
    var body: some View {
        TabView(selection: $viewModel.currentTab) {
            NavigationView {
                HomeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.tag(Tab.home)
            
            NavigationView {
                RecipeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.tag(Tab.recipe)
            
            NavigationView {
                NotificationView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.tag(Tab.notification)
            
            NavigationView {
                ProfileView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }.tag(Tab.profile)
        }
        .overlay(
            // CustomTab
            HStack(spacing: 0){
                //MARK: Home button Tab
                TabButton(Tab: .home)
                
                //MARK: Recipe button tab
                TabButton(Tab: .recipe)
                
                //MARK: Home button Tab
                Button {
                    withAnimation {
                        viewModel.currentTab = .add
                    }
                } label: {
                    Image("add_button_icon")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48, height: 48)
                        .cornerRadius(18)
                        .foregroundColor(Color("green_color"))
                        .padding(4)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                }
                .tag(Tab.add)
                //.offset(y: viewModel.currentTab == Tab.home ? -10 : 0)
                .offset(y: -50)
                
                //MARK: Notification button Tab
                TabButton(Tab: .notification)
                
                //MARK: Profile button Tab
                TabButton(Tab: .profile)
            }.frame(height: 80)
                .padding(.top, 10)
                .padding(.bottom, -10)
                .padding(.horizontal, 5)
                .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.65), value: viewModel.currentTab)
                .background {
                    /// Custom Corner
                    CustomCorner(corners: [.topLeft, .topRight], radius: 0)
                        .fill(Color.white)
                        .ignoresSafeArea()
                }
            // MARK: Hide and Show TabBar when show Trainer Detail View
                .offset(y: showTabBar ? 0 : 130)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: showTabBar)
            
            , alignment: .bottom
        )
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    @ViewBuilder
    func TabButton(Tab: Tab)-> some View {
        Button{
            withAnimation{
                viewModel.currentTab = Tab
            }
        } label: {
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(viewModel.currentTab == Tab ? Color("green_color") : Color("rounded_color"))
                .offset(y: viewModel.currentTab == Tab ? -10 : 0)
                .background(content: {
                    if viewModel.currentTab == Tab {
                        Circle()
                            .fill(Color("green_color").opacity(0.2))
                            .scaleEffect(2.5)
                            .shadow(color: .black.opacity(0.3), radius: 8, x:5, y:10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .offset(y: viewModel.currentTab == Tab ? -10 : 0)
                    }
                })
                .frame(maxWidth: .infinity)
                .padding(.top,15)
                .padding(.bottom,10)
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.currentTab = Tab
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

enum Tab: String, CaseIterable {
    case home = "home_icon"
    case recipe = "recipe_icon"
    case add = "add_button_icon"
    case notification = "notification_icon"
    case profile = "profile_icon"
}

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
