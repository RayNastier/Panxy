//
//  Onboarding.swift
//  Panxy
//
//  Created by Samy Mehdid on 30/10/2022.
//

import SwiftUI

struct Onboarding: View {
    @State private var onboardingProgress: Double = 0.0
    @State private var success: Double = 100.0
    
    @AppStorage("onboarding") var beenOnboarded: Bool = false
    
    func onboarded(onboardingProgress newValue: Double) {
        beenOnboarded = newValue == success
    }
    
    var body: some View {
        ZStack(alignment: .top){
            CrystalCard()
                .padding(30)
                .padding(.top, 150)
                .rotationEffect(Angle(degrees: -15))
            VStack(spacing: 50){
                NavigationLink(destination: Wrapper(), isActive: $beenOnboarded) { EmptyView() }
                Spacer()
                VStack(spacing: 18){
                    Text("The Future.")
                        .font(.custom("Rubik-SemiBold", size: 32))
                    Text("learn more about cryptocurrencies, look to the future")
                        .font(.custom("Rubik-Medium", size: 20))
                        .frame(maxWidth: 350)
                }
                .foregroundColor(.white)
                Image("Send")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .rotationEffect(Angle(degrees: 90))
                    .foregroundColor(.white)
                    .padding(24)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Ceal"), Color.accentColor]), startPoint: .bottomLeading, endPoint: .topTrailing).cornerRadius(.infinity))
                    .padding(8)
                    .overlay {
                        Circle()
                            .trim(from: 0, to: onboardingProgress/success)
                            .stroke(.green, style: StrokeStyle(lineWidth: 6))
                            .rotationEffect(Angle(degrees: -90))
                    }
                    .onTapGesture {
                        withAnimation {
                            onboardingProgress += success / 3
                        }
                    }
            }
        }
        .padding(.bottom, 38)
        .frame(width: UIScreen.main.bounds.width)
        .onChange(of: onboardingProgress) { newValue in
            onboarded(onboardingProgress: newValue)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("Onboarding"), Color("Background")]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
