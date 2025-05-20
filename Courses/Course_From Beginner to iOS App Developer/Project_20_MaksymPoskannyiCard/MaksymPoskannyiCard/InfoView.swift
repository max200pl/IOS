import SwiftUI


struct InfoUser: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(red: 0.09, green: 0.63, blue: 0.52))
                    
                    Text(text)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color(red: 0.09, green: 0.63, blue: 0.52))
                        .padding()
                }
            )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoUser(text: "Hello, World!", imageName: "person.circle").previewLayout(.sizeThatFits)
    }
}
