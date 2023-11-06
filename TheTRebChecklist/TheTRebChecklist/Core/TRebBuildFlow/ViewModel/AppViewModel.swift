//
//  PriorToDiveViewModel.swift
//  XccrChecklist
//
//  Created by andrew austin on 10/15/23.
//

import Foundation

class AppViewModel: ObservableObject {
    // TReb Build 1 View Model
    @Published var trebBuild1ViewModel = TRebBuild1ViewModel()
    
    // TReb Build 2 View Model
    @Published var trebBuild2ViewModel = TRebBuild2ViewModel()
    
    // TReb Build 3 View Model
    @Published var trebBuild3ViewModel = TRebBuild3ViewModel()
    
    // TReb Build 4 View Model
    @Published var trebBuild4ViewModel = TRebBuild4ViewModel()
    
    // TReb Build 5 View Model
    @Published var trebBuild5ViewModel = TRebBuild5ViewModel()
    
    // TReb Build 6 View Model
    @Published var trebBuild6ViewModel = TRebBuild6ViewModel()
    
    // TReb Build 7 View Model
    @Published var trebBuild7ViewModel = TRebBuild7ViewModel()
    
    // Add a computed property to check if all steps are completed
    var areAllStepsCompleted: Bool {
        print("Debugging areAllStepsCompleted")
        
        let allStepsCompleted =
        // Build View 1
            trebBuild1ViewModel.is02DilFilledChecked &&
            !trebBuild1ViewModel.oxygenPressure.isEmpty &&
            !trebBuild1ViewModel.diluent1Pressure.isEmpty &&
            trebBuild1ViewModel.is02DilAnalyzedChecked &&
            !trebBuild1ViewModel.oxygenPercent.isEmpty &&
            !trebBuild1ViewModel.diluent1Percent.isEmpty &&
            trebBuild1ViewModel.isUsingMixedGasChecked &&
            !trebBuild1ViewModel.diluent2Mix.isEmpty &&
            !trebBuild1ViewModel.diluent3Mix.isEmpty &&
            !trebBuild1ViewModel.diluent4Mix.isEmpty &&
        
        // Build View 2
            trebBuild2ViewModel.isScrubberFilledChecked &&
            !trebBuild2ViewModel.scrubberLife.isEmpty &&
            trebBuild2ViewModel.isOringsLubricatedChecked &&
            trebBuild2ViewModel.isHeadScrewedTightChecked &&
            trebBuild2ViewModel.isBatteryLifeChecked &&
            !trebBuild2ViewModel.voltLife.isEmpty &&
            !trebBuild2ViewModel.batterPercentLife.isEmpty &&
        
        // Build View 3
            trebBuild3ViewModel.isSensorsCalibratedChecked &&
            trebBuild3ViewModel.isHeadInsertedChecked &&
            trebBuild3ViewModel.isRedMarksAlignedChecked &&
            trebBuild3ViewModel.isLPHPHosesConnectedChecked &&
            trebBuild3ViewModel.isBovValvesChecked &&
        
        // Build View 4
            trebBuild4ViewModel.isMavsWorkingChecked &&
            trebBuild4ViewModel.isAdvWorkingChecked &&
            trebBuild4ViewModel.isWingFunctioningPropChecked &&
            trebBuild4ViewModel.isBovChecked &&
            trebBuild4ViewModel.isCounterlungValveChecked &&
        
        // Build View 5
            trebBuild5ViewModel.isOverpressureDumpClosed &&
            trebBuild5ViewModel.isNegPressureTestDone &&
            trebBuild5ViewModel.isBothValvesOpenChecked &&
        
        // Build View 6
            trebBuild6ViewModel.isPosPressureTestDone &&
            trebBuild6ViewModel.isOverpressureDumpOpen &&
        
        // Build View 7
            trebBuild7ViewModel.isPrimaryHandsetChecked &&
            trebBuild7ViewModel.isBovSwitchedCCModeChecked &&
            trebBuild7ViewModel.isPreBreatheChecked &&
            trebBuild7ViewModel.isBovSwitchedOCModeChecked &&
            trebBuild7ViewModel.isHandsetOffTanksClosedChecked
        
        print("All Steps Completed: \(allStepsCompleted)")
        return allStepsCompleted
    }

    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        // Build View 1
        
        if !trebBuild1ViewModel.is02DilFilledChecked { steps.append(1) }
        if trebBuild1ViewModel.oxygenPressure.isEmpty || trebBuild1ViewModel.diluent1Pressure.isEmpty { steps.append(1) }
        if !trebBuild1ViewModel.is02DilAnalyzedChecked { steps.append(2) }
        if trebBuild1ViewModel.oxygenPercent.isEmpty || trebBuild1ViewModel.diluent1Percent.isEmpty { steps.append(2) }
        if !trebBuild2ViewModel.isScrubberFilledChecked { steps.append(4) }
        if trebBuild2ViewModel.scrubberLife.isEmpty { steps.append(4) }
        if !trebBuild2ViewModel.isOringsLubricatedChecked { steps.append(5) }
        if !trebBuild2ViewModel.isHeadScrewedTightChecked { steps.append(6) }
        if !trebBuild2ViewModel.isBatteryLifeChecked { steps.append(7) }
        if trebBuild2ViewModel.voltLife.isEmpty { steps.append(7) }
        if trebBuild2ViewModel.batterPercentLife.isEmpty { steps.append(7) }
        if !trebBuild3ViewModel.isSensorsCalibratedChecked { steps.append(11) }
        if !trebBuild3ViewModel.isHeadInsertedChecked { steps.append(12) }
        if !trebBuild3ViewModel.isRedMarksAlignedChecked { steps.append(13) }
        if !trebBuild3ViewModel.isLPHPHosesConnectedChecked { steps.append(14) }
        if !trebBuild3ViewModel.isBovValvesChecked { steps.append(15) }
        if !trebBuild4ViewModel.isMavsWorkingChecked { steps.append(16) }
        if !trebBuild4ViewModel.isAdvWorkingChecked { steps.append(17) }
        if !trebBuild4ViewModel.isWingFunctioningPropChecked { steps.append(18) }
        if !trebBuild4ViewModel.isBovChecked { steps.append(19) }
        if !trebBuild4ViewModel.isCounterlungValveChecked { steps.append(20) }
        if !trebBuild5ViewModel.isOverpressureDumpClosed { steps.append(21) }
        if !trebBuild5ViewModel.isNegPressureTestDone { steps.append(22) }
        if !trebBuild5ViewModel.isBothValvesOpenChecked { steps.append(23) }
        if !trebBuild6ViewModel.isPosPressureTestDone { steps.append(24) }
        if !trebBuild6ViewModel.isOverpressureDumpOpen { steps.append(25) }
        
        if !trebBuild7ViewModel.isPrimaryHandsetChecked { steps.append(26) }
        if !trebBuild7ViewModel.isBovSwitchedCCModeChecked { steps.append(27) }
        if !trebBuild7ViewModel.isPreBreatheChecked { steps.append(28) }
        if !trebBuild7ViewModel.isBovSwitchedOCModeChecked { steps.append(29) }
        if !trebBuild7ViewModel.isHandsetOffTanksClosedChecked { steps.append(30) }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...30 {
            if !incompleteSteps.contains(step) {
                completed.append(step)
            }
        }
        return completed
    }
}


// ViewModel for TReb Build 1 View
class TRebBuild1ViewModel: ObservableObject {
    @Published var is02DilFilledChecked = false
    @Published var oxygenPressure = ""
    @Published var diluent1Pressure = ""
    @Published var is02DilAnalyzedChecked = false
    @Published var oxygenPercent = ""
    @Published var diluent1Percent = ""
    @Published var isUsingMixedGasChecked = false
    @Published var diluent2Mix = ""
    @Published var diluent3Mix = ""
    @Published var diluent4Mix = ""
}

// ViewModel for TReb Build 2 View
class TRebBuild2ViewModel: ObservableObject {
    @Published var isScrubberFilledChecked = false
    @Published var scrubberLife = ""
    @Published var isOringsLubricatedChecked = false
    @Published var isHeadScrewedTightChecked = false
    @Published var isBatteryLifeChecked = false
    @Published var voltLife = ""
    @Published var batterPercentLife = ""

}

// ViewModel for TReb Build 3 View
class TRebBuild3ViewModel: ObservableObject {
    @Published var isSensorsCalibratedChecked: Bool = false
    @Published var isHeadInsertedChecked: Bool = false
    @Published var isRedMarksAlignedChecked: Bool = false
    @Published var isLPHPHosesConnectedChecked: Bool = false
    @Published var isBovValvesChecked: Bool = false
    
}

// ViewModel for TReb Build 4 View
class TRebBuild4ViewModel: ObservableObject {
    @Published var isMavsWorkingChecked: Bool = false
    @Published var isAdvWorkingChecked: Bool = false
    @Published var isWingFunctioningPropChecked: Bool = false
    @Published var isBovChecked: Bool = false
    @Published var isCounterlungValveChecked: Bool = false
}

// ViewModel for TReb Build 5 View
class TRebBuild5ViewModel: ObservableObject {
    @Published var isOverpressureDumpClosed: Bool = false
    @Published var isNegPressureTestDone: Bool = false
    @Published var isBothValvesOpenChecked: Bool = false
}

// ViewModel for TReb Build 6 View
class TRebBuild6ViewModel: ObservableObject {
    @Published var isPosPressureTestDone: Bool = false
    @Published var isOverpressureDumpOpen: Bool = false
}

// ViewModel for TReb Build 7 View
class TRebBuild7ViewModel: ObservableObject {
    @Published var isPrimaryHandsetChecked: Bool = false
    @Published var isBovSwitchedCCModeChecked: Bool = false
    @Published var isPreBreatheChecked: Bool = false
    @Published var isBovSwitchedOCModeChecked: Bool = false
    @Published var isHandsetOffTanksClosedChecked: Bool = false
}
