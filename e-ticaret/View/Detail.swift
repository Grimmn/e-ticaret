//
//  Detail.swift
//  e-ticaret
//
//  Created by utku enes alagöz on 26.09.2022.
//

import SwiftUI

struct Detail: View {
    
    @Binding var selectedItem:Item
    @Binding var show: Bool
    
    var animation: Namespace.ID
    @State var selectedColor: Color = Color("p1")
    
    @State var loadContent = false
    
    
    var body: some View {
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(),content: {
            VStack {
                HStack(spacing: 25){
                    
                    Button(action: {
                        
                        withAnimation(.spring()){show.toggle()}
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    }
                .padding()
                
                VStack(spacing: 10) {
                    Image(selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()
                    
                    Text(selectedItem.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text(selectedItem.subTitle)
                        .foregroundColor(.gray)
                        .padding(.top,4)
                    HStack {
                        
                        
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                       
                        Spacer()
                        
                        
                        Button(action: {}) {
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                       
                    }
                    .padding()
                    
                }
                .padding(.top,35)
                .background(Color(selectedItem.image)
                    .clipShape(CustomShape())
                    .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation))
                
                .cornerRadius(15)
                .padding()
                VStack {
                    VStack(alignment: .leading,spacing: 8) {
                        
                        Text("Özel Teklif")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("Çerçeve + Lens $35(50% İndirimli)")
                            .foregroundColor(.gray)
                        
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 30,alignment: .leading)
                    .background(Color("p4"))
                    .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Renkler")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        HStack(spacing: 15) {
                            ForEach(1...4,id: \.self){i in
                                ZStack {
                                    Color("p\(i)")
                                        .clipShape(Circle())
                                        .frame(width: 45, height: 45)
                                        .onTapGesture {
                                            withAnimation{
                                                selectedColor = Color("p\(i)")
                                            }
                                        }
                                    
                                    if selectedColor == Color("p\(i)") {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                    }
                                    
                                    
                                    
                                }
                            }
                            Spacer(minLength: 0)
                            
                        }
                    }
                    .padding()
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}){
                        Text("ÇERÇEVEYİ 3D OLARAK DENEYİN")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black,lineWidth: 1)
                            
                            )
                    }
                    Button(action: {}){
                        Text("SEPETE EKLE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color.black)
                            .cornerRadius(15)
                    }
                    .padding(.vertical)
                }
                .padding([.horizontal,.bottom])
                .frame(height: loadContent ? nil : 0)
                .opacity(loadContent ? 1 : 0)
                
                
                Spacer(minLength: 0)
                
                }
        }
        
        )
        .onAppear {
            withAnimation(Animation.spring().delay(0.45)) {
                loadContent.toggle()
            }
        }
        
        }
    }
