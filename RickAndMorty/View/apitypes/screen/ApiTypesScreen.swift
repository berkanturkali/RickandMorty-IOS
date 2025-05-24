//

import SwiftUI

struct ApiTypesScreen: View {
    
    @Environment(\.isLargeScreen) private var isLargeScreen
    @Environment(\.dismiss) private var dismiss
    
    let apiTypes: [ApiType] = ApiType.allCases
    
    @State var selectedType: ApiType?
    
    @State var isCheckMarkActive: Bool = false
    
    let previousSelectedItem: ApiType?
    
    let onApplyButtonClick: (
        ApiType?
    ) -> Void
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                LazyVStack {
                    ZStack {
                        BackButton()
                        
                        Image(
                            systemName: "checkmark"
                        )
                        .foregroundColor(
                            isCheckMarkActive ? Color.accentColor : Color.onBackgroundSecondary
                        )
                        .font(
                            isLargeScreen ? .largeTitle : .title3
                        )
                        .frame(
                            maxWidth: .infinity,
                            alignment: .trailing
                        )
                        .font(isLargeScreen ? .largeTitle : .title3)
                        .frame(
                            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                            alignment: .trailing
                        ).onTapGesture {
                            if(isCheckMarkActive) {
                                onApplyButtonClick(
                                    selectedType
                                )
                                dismiss()
                            }
                     
                        }
                        
                        Text(
                            LocalizedStrings.apiTypes
                        )
                        .font(
                            .title2
                        )
                        .fontWeight(
                            .bold
                        )
                        .foregroundColor(
                            Color.onBackground
                        )
                        
                    }
                    .padding(
                        .horizontal
                    )
                    
                    ForEach(
                        apiTypes.indices,
                        id: \.self
                    ) { index in
                        VStack {
                            ApiTypeItemView(
                                isSelected:
                                        .constant(
                                            apiTypes[index].displayName == selectedType?.displayName
                                        ),
                                item: apiTypes[index]
                            ) { type in
                                if(selectedType != nil && selectedType == type) {
                                    selectedType = nil
                                    return
                                }
                                selectedType = type
                                setIsCheckMarkActive(
                                    selectedType: selectedType,
                                    previouslySelectedType: previousSelectedItem
                                )
                            }
                            
                            if(index < apiTypes.count - 1) {
                                Divider()
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            selectedType = previousSelectedItem
        }
        
        .navigationBarBackButtonHidden(true)
    }
    func setIsCheckMarkActive(selectedType: ApiType?, previouslySelectedType: ApiType?) {
        isCheckMarkActive = selectedType?.displayName != previouslySelectedType?.displayName
    }
}

#Preview {
    ApiTypesScreen(
        selectedType: nil,
        isCheckMarkActive: false,
        previousSelectedItem: nil
    ) { type in
        
    }
}
