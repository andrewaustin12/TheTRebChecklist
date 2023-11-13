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
    
    // TReb Build 8 View Model
    @Published var trebBuild8ViewModel = TRebBuild8ViewModel()
    
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
        
        // Build View 2
        trebBuild2ViewModel.isScrubberFilledChecked &&
        !trebBuild2ViewModel.scrubberLife.isEmpty &&
        trebBuild2ViewModel.isOringsLubricatedChecked &&
        trebBuild2ViewModel.isHeadScrewedTightChecked &&
        trebBuild2ViewModel.isBatteryLifeChecked &&
        !trebBuild2ViewModel.voltLife.isEmpty &&
        !trebBuild2ViewModel.batterPercentLife.isEmpty &&
        
        // Build View 3
        trebBuild3ViewModel.isMVAmbientAirChecked &&
        !trebBuild3ViewModel.s1ReadingAir.isEmpty &&
        !trebBuild3ViewModel.s3ReadingAir.isEmpty &&
        !trebBuild3ViewModel.s3ReadingAir.isEmpty &&
        trebBuild3ViewModel.isCalibratedWith02Checked &&
        trebBuild3ViewModel.isMVHighOxygenChecked &&
        !trebBuild3ViewModel.s1ReadingHighO2.isEmpty &&
        !trebBuild3ViewModel.s2ReadingHighO2.isEmpty &&
        !trebBuild3ViewModel.s3ReadingHighO2.isEmpty &&
        
        // Build View 4
        trebBuild4ViewModel.isInspectedForDamageWearChecked &&
        trebBuild4ViewModel.isOPRVClosedChecked &&
        trebBuild4ViewModel.isUnitAssembledCanClosedChecked &&
        trebBuild4ViewModel.isMouthPieceValvesChecked &&
        trebBuild4ViewModel.isLoopAssembledToUnitChecked &&
        
        // Build View 5
        trebBuild5ViewModel.isPositivePressureTestChecked &&
        trebBuild5ViewModel.isCounterlungVentingChecked &&
        trebBuild5ViewModel.isNegativePressureTestChecked &&
        
        // Build View 6
        trebBuild6ViewModel.isDiluentBailoutOCRegChecked &&
        trebBuild6ViewModel.isDiluentHoseConnectedChecked &&
        trebBuild6ViewModel.isControlerOnChecked &&
        trebBuild6ViewModel.isOxygenHoseConnectedChecked &&
        trebBuild6ViewModel.isPreBreatheDoneChecked &&
        
        // Build View 7
        trebBuild7ViewModel.isMAVo2DilChecked &&
        trebBuild7ViewModel.isAcsOperationalChecked &&
        trebBuild7ViewModel.isSolenoidWorkingChecked &&
        trebBuild7ViewModel.isControllerOffChecked &&
        trebBuild7ViewModel.isOxygenMiddlePressureChecked &&
        
        // Build View 8
        !trebBuild8ViewModel.diveTime.isEmpty &&
        !trebBuild8ViewModel.ccrTotalTime.isEmpty &&
        !trebBuild8ViewModel.diveTime.isEmpty &&
        !trebBuild8ViewModel.maxDepth.isEmpty &&
        !trebBuild8ViewModel.scrubberUsed.isEmpty &&
        !trebBuild8ViewModel.ppo2ThisDive.isEmpty &&
        !trebBuild8ViewModel.availNextDive.isEmpty
        
        print("All Steps Completed: \(allStepsCompleted)")
        return allStepsCompleted
    }
    
    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        
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
        if !trebBuild3ViewModel.isMVAmbientAirChecked { steps.append(8) }
        if trebBuild3ViewModel.s1ReadingAir.isEmpty { steps.append(8) }
        if trebBuild3ViewModel.s2ReadingAir.isEmpty { steps.append(8) }
        if trebBuild3ViewModel.s3ReadingAir.isEmpty  { steps.append(8) }
        if !trebBuild3ViewModel.isCalibratedWith02Checked { steps.append(9) }
        if !trebBuild3ViewModel.isMVHighOxygenChecked { steps.append(10) }
        if trebBuild3ViewModel.s1ReadingHighO2.isEmpty || trebBuild3ViewModel.s2ReadingHighO2.isEmpty || trebBuild3ViewModel.s3ReadingHighO2.isEmpty { steps.append(10) }
        if !trebBuild4ViewModel.isInspectedForDamageWearChecked { steps.append(11) }
        if !trebBuild4ViewModel.isOPRVClosedChecked { steps.append(12) }
        if !trebBuild4ViewModel.isUnitAssembledCanClosedChecked { steps.append(13) }
        if !trebBuild4ViewModel.isMouthPieceValvesChecked { steps.append(14) }
        if !trebBuild4ViewModel.isLoopAssembledToUnitChecked { steps.append(15) }
        if !trebBuild5ViewModel.isPositivePressureTestChecked { steps.append(16) }
        if !trebBuild5ViewModel.isCounterlungVentingChecked { steps.append(17) }
        if !trebBuild5ViewModel.isNegativePressureTestChecked { steps.append(18) }
        if !trebBuild6ViewModel.isDiluentBailoutOCRegChecked { steps.append(19) }
        if !trebBuild6ViewModel.isDiluentHoseConnectedChecked { steps.append(20) }
        if !trebBuild6ViewModel.isControlerOnChecked { steps.append(21) }
        if !trebBuild6ViewModel.isOxygenHoseConnectedChecked { steps.append(22) }
        if !trebBuild6ViewModel.isPreBreatheDoneChecked { steps.append(23) }
        if !trebBuild7ViewModel.isMAVo2DilChecked { steps.append(24) }
        if !trebBuild7ViewModel.isAcsOperationalChecked { steps.append(25) }
        if !trebBuild7ViewModel.isSolenoidWorkingChecked { steps.append(26) }
        if !trebBuild7ViewModel.isControllerOffChecked { steps.append(27) }
        if !trebBuild7ViewModel.isOxygenMiddlePressureChecked { steps.append(28) }
        if trebBuild8ViewModel.diveTime.isEmpty { steps.append(29) }
        if trebBuild8ViewModel.ccrTotalTime.isEmpty { steps.append(30) }
        if trebBuild8ViewModel.maxDepth.isEmpty { steps.append(31) }
        if trebBuild8ViewModel.scrubberUsed.isEmpty { steps.append(32) }
        if trebBuild8ViewModel.ppo2ThisDive.isEmpty { steps.append(33) }
        if trebBuild8ViewModel.availNextDive.isEmpty { steps.append(34) }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...34 {
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
    @Published var isMVAmbientAirChecked = false
    @Published var s1ReadingAir = ""
    @Published var s2ReadingAir = ""
    @Published var s3ReadingAir = ""
    @Published var isCalibratedWith02Checked = false
    @Published var isMVHighOxygenChecked = false
    @Published var s1ReadingHighO2 = ""
    @Published var s2ReadingHighO2 = ""
    @Published var s3ReadingHighO2 = ""
    
}

// ViewModel for TReb Build 4 View
class TRebBuild4ViewModel: ObservableObject {
    @Published var isInspectedForDamageWearChecked = false
    @Published var isOPRVClosedChecked = false
    @Published var isUnitAssembledCanClosedChecked = false
    @Published var isMouthPieceValvesChecked = false
    @Published var isLoopAssembledToUnitChecked = false}

// ViewModel for TReb Build 5 View
class TRebBuild5ViewModel: ObservableObject {
    @Published var isPositivePressureTestChecked = false
    @Published var isCounterlungVentingChecked = false
    @Published var isNegativePressureTestChecked = false
}

// ViewModel for TReb Build 6 View
class TRebBuild6ViewModel: ObservableObject {
    @Published var isDiluentBailoutOCRegChecked = false
    @Published var isDiluentHoseConnectedChecked = false
    @Published var isControlerOnChecked = false
    @Published var isOxygenHoseConnectedChecked = false
    @Published var isPreBreatheDoneChecked = false
}

// ViewModel for TReb Build 7 View
class TRebBuild7ViewModel: ObservableObject {
    @Published var isMAVo2DilChecked = false
    @Published var isAcsOperationalChecked = false
    @Published var isSolenoidWorkingChecked = false
    @Published var isControllerOffChecked = false
    @Published var isOxygenMiddlePressureChecked = false
}

// ViewModel for TReb Build 8 View
class TRebBuild8ViewModel: ObservableObject {
    @Published var diveTime = ""
    @Published var ccrTotalTime = ""
    @Published var maxDepth = ""
    @Published var scrubberUsed = ""
    @Published var ppo2ThisDive = ""
    @Published var availNextDive = ""
}
