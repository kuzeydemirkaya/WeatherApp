
import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundColor(isNight: $isNight)
            VStack {
                City(CityName: "Istanbul")
                MainWeather(ImageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill", Temp: 18)
                
                HStack(spacing: 20) {
                    WeekList(DayOfWeek: "MON", WeatherImage: "cloud.sun.fill", Temp: 18)
                    WeekList(DayOfWeek: "TUE", WeatherImage: "sun.max.fill", Temp: 28)
                    WeekList(DayOfWeek: "WEN", WeatherImage: "wind.snow", Temp: 5)
                    WeekList(DayOfWeek: "THR", WeatherImage: "cloud.rain.fill", Temp: 10)
                    WeekList(DayOfWeek: "SUN", WeatherImage: "cloud.moon.fill", Temp: 12)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                    
                } label: {
                    MyButton(ButtonText: "Change Time of Day")
                }
                Spacer()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeekList: View {
    
    var DayOfWeek: String
    var WeatherImage: String
    var Temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(DayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: WeatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(Temp)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColor: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct City: View {
    
    var CityName: String
    
    var body: some View {
        Text(CityName)
            .font(.system(size: 40, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeather: View {
    
    var ImageName: String
    var Temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            
            Text("\(Temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 60)
    }
}

struct MyButton: View {
    
    var ButtonText: String
    
    var body: some View {
        Text(ButtonText)
            .frame(width: 280, height: 50, alignment: .center)
            .background(Color.white)
            .font(.system(size: 19, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

