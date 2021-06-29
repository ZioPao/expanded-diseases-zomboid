ExpandedDiseases = {
	-- Maybe we can use this to make a settings menu at some point if we want by iterating all keys
    Settings = {
        Diabetes = {
            StartingInsulin = 2.0,
            StartingBloodSugar = 150.0,
            BloodSugarIncreasePer10Carbs = 40.0,
            -- The amount of glucose in mg/dL that 1 unit of insulin counteracts
            InsulinCounteractRate = 36,
            -- Placeholder, we assume that all Insulin is rapid acting in this scenario
            --  Meaning it lasts between 3 and 4 hours
            InsulinSecondsForFullEffect = 4650,
            -- Time that it takes for carbs to fully process
            CarbSecondsToProcess = 2500,
            -- The amount of glucose 1 carb generates
            CarbToGlucoseRatio = 4.5,
        }
	},
    Client = {
    },
    Server = {
    },
}