###########################################################
#
# Title:       Simple Farm Manager
#
# Name:        Luke Oltmanns
# Class:       CompSci371
# Purpose:     Final Project
# Description: A Basic Farm Managment Application That
#              Displays Total Cost Expenses and Profits
#
###########################################################

##################   Milk Price Stats   ###################
  function milkPriceStats()
    # Local Variables 
      fatMilkComp = 3.85
      proteinMilkComp = 3.1
      otherSolidsMilkComp = 5.75
      SCCCells = 350
      fatCompPrice = 1.6275
      proteinCompPrice = 4.4394
      otherSolidsCompPrice = 0.1387
      SCCAdjRate = 0.00105
      PPD = 2.06

    # Milk Price Stats Menu
      println("*************   Milk Price Stats   *************\n")
      println("Average rates as of August 2020:\n")
      println("\tFat %: \t\t\t\t\t\t\t\t", fatMilkComp)
      println("\tProtien %: \t\t\t\t\t\t\t", proteinMilkComp)
      println("\tOther Solids %: \t\t\t\t\t", otherSolidsMilkComp)
      println("\tSCC (100,000 cells): \t\t\t\t", SCCCells)
      println("\tFat \$/lb: \t\t\t\t\t\t\t", fatCompPrice)
      println("\tProtein \$/lb: \t\t\t\t\t\t", proteinCompPrice)
      println("\tOther Solids \$/lb: \t\t\t\t\t", otherSolidsCompPrice)
      println("\tSCC Adjust. Rate (\$/cwt): \t\t\t", SCCAdjRate)
      println("\tPPD (\$/cwt): \t\t\t\t\t\t", PPD)

    # User Option to Edit
      print("\n\tWould you like to edit rates? (y/n): ")
      userMilkPriceStatsInput = chomp(readline())

    # User Edit
      if(userMilkPriceStatsInput == "y")
        print("\n\tEnter Fat %: \t\t\t\t\t\t")
        fatMilkComp = chomp(readline())
        fatMilkComp = (parse(Float16, fatMilkComp))

        print("\tEnter Protien %: \t\t\t\t\t")
        proteinMilkComp = chomp(readline())
        proteinMilkComp = (parse(Float16, proteinMilkComp))

        print("\tEnter Other Solids %: \t\t\t\t")
        otherSolidsMilkComp = chomp(readline())
        otherSolidsMilkComp = (parse(Float16, otherSolidsMilkComp))
        
        print("\tEnter SCC (100,000 cells): \t\t\t")
        SCCCells = chomp(readline())
        SCCCells = (parse(Float16, SCCCells))

        print("\tEnter Fat \$/lb: \t\t\t\t\t")
        fatCompPrice = chomp(readline())
        fatCompPrice = (parse(Float16, fatCompPrice))

        print("\tEnter Protein \$/lb: \t\t\t\t")
        proteinCompPrice = chomp(readline())
        proteinCompPrice = (parse(Float16, proteinCompPrice))

        print("\tEnter Other Solids \$/lb: \t\t\t")
        otherSolidsCompPrice = chomp(readline())
        otherSolidsCompPrice = (parse(Float16, otherSolidsCompPrice))

        print("\tEnter SCC Adjust. Rate (\$/cwt): \t")
        SCCAdjRate = chomp(readline())
        SCCAdjRate = (parse(Float16, SCCAdjRate))

        print("\tEnter PPD (\$/cwt): \t\t\t\t\t")
        PPD = chomp(readline())
        PPD = (parse(Float16, PPD))
      end

    # Calculations
      milkPricePerCWT = (fatMilkComp * fatCompPrice) + (proteinMilkComp * proteinCompPrice) + (otherSolidsMilkComp * otherSolidsCompPrice) + (((350 - SCCCells) * SCCAdjRate) + PPD )
      milkPricePerPound = milkPricePerCWT / 100
      milkPricePerGallon = milkPricePerCWT / 11.63

    # Display Milk Price Stats
      println("\n\n\tMilk Stats:\n")
      println("\t\tIncome rate \$/cwt: \t\t\t\t", round(milkPricePerCWT; digits = 2))
      println("\t\tIncome rate \$/lbs: \t\t\t\t", round(milkPricePerPound; digits = 2))
      println("\t\tIncome rate \$/gal: \t\t\t\t", round(milkPricePerGallon; digits = 2))

    # End of Function
      println("\n************************************************\n")
      println("\n...press ENTER to continue\n")
      empty = readline()

      return(milkPricePerPound)
  end
 

#####################   Herd Stats   ######################
  function heardInfo(milkPricePerPound::Number, herdSize::Number)
    # Local Variables 
      averageMilkPerCowPerDay = 65

    # Herd Stats Menu
      println("****************   Herd Stats   ****************\n")
      println("Average milk cow/lbs/day: \t\t\t\t", averageMilkPerCowPerDay)
    
    # User Option to Edit
      print("\n\tWould you like to edit rate? (y/n): ")
      userHerdStatsInput = chomp(readline())

    # User Edit
      if(userHerdStatsInput == "y")
        print("\n\tEnter milk cow/lbs/day: \t\t\t")
        averageMilkPerCowPerDay = chomp(readline())
        averageMilkPerCowPerDay = (parse(Float16, averageMilkPerCowPerDay))
      end

    # Validate Beforehand Herd Stats
      if(milkPricePerPound == 0)
        println("\n\tIncome rate \$/lbs not detrmined")
        println("\tUsing average rate for calculations:0.23\n")
        milkPricePerPound = 0.23
      end

    # Calculations
      IncomePerCowPerDay = milkPricePerPound * averageMilkPerCowPerDay
      IncomePerHerdPerDay = IncomePerCowPerDay * herdSize

    # Display Herd Stats
      println("\n\n\tHerd Info:\n")
      println("\t\tIncome rate cow/day: \t\t\t", round(IncomePerCowPerDay; digits = 2))
      println("\t\tIncome rate herd/day: \t\t\t", round(IncomePerHerdPerDay; digits = 2))
    
    # End of Function
      println("\n************************************************\n")
      println("\n...press ENTER to continue\n")
      empty = readline()

      return(IncomePerHerdPerDay)
  end
 

####################   Feeding Stats   ####################
  function feedingStats(herdSize::Number)
    # Local Variables 
      feedCostPerCow = 4.01

      cornSilageAmount = 70
      alfalfaHayAmount = 6
      cornAmount = 12
      distillersGrainAmount = 6
      soybeanMealAmount = 5
      mineralVitaminAmount= 1

      editedCornSilageAmount = 70
      editedAlfalfaHayAmount = 6
      editedCornAmount = 12
      editedDistillersGrainAmount = 6
      editedSoybeanMealAmount = 5
      editedMineralVitaminAmount = 1

      cornSilageCostRate = 24.42
      alfalfaHayCostRate = 11.22
      cornCostRate = 14.71
      distillersGrainCostRate = 12.97
      soybeanMealCostRate = 25.44
      mineralVitaminCostRate = 8.73
      additionalCostRate = 2.51

    # Feeding Stats Menu
      println("***************   Feeding Stats   **************\n")
      println("Predicted cost to feed cow/day: \t\t", feedCostPerCow)

    # User Option to Edit
      print("\n\tWould you like to edit rate? (y/n): ")
      userFeedingStatsCostInput = chomp(readline())

    # User Edit
      if(userFeedingStatsCostInput == "y")
        print("\n\tEnter cost to feed cow/day: \t\t")
        feedCostPerCow = chomp(readline())
        feedCostPerCow = (parse(Float16, feedCostPerCow))
      end

    # Feeding Stats
      println("\n\nTMR:\n")
      println("\tCorn Silage %: \t\t\t\t\t\t", cornSilageAmount)
      println("\tAlfalfa Hay %: \t\t\t\t\t\t", alfalfaHayAmount)
      println("\tCorn %: \t\t\t\t\t\t\t", cornAmount)
      println("\tDistillers Grain %: \t\t\t\t", distillersGrainAmount)
      println("\tSoybean Meal %: \t\t\t\t\t", soybeanMealAmount)
      println("\tMineral/Vitamin/Additives %: \t\t", mineralVitaminAmount)

    # User Option to Edit
      print("\n\tWould you like to edit rates? (y/n): ")
      userFeedingStatsRateInput = chomp(readline())

    # User Edit
      if(userFeedingStatsRateInput == "y")
        print("\n\tCorn Silage %: \t\t\t\t\t\t")
        editedCornSilageAmount = chomp(readline())
        editedCornSilageAmount = (parse(Float16, editedCornSilageAmount))

        print("\tAlfalfa Hay %: \t\t\t\t\t\t")
        editedAlfalfaHayAmount = chomp(readline())
        editedAlfalfaHayAmount = (parse(Float16, editedAlfalfaHayAmount))

        print("\tCorn %: \t\t\t\t\t\t\t")
        editedCornAmount = chomp(readline())
        editedCornAmount = (parse(Float16, editedCornAmount))

        print("\tDistillers Grain %: \t\t\t\t")
        editedDistillersGrainAmount = chomp(readline())
        editedDistillersGrainAmount = (parse(Float16, editedDistillersGrainAmount))

        print("\tSoybean Meal %: \t\t\t\t\t")
        editedSoybeanMealAmount = chomp(readline())
        editedSoybeanMealAmount = (parse(Float16, editedSoybeanMealAmount))

        print("\tMineral/Vitamin/Additives %: \t\t")
        editedMineralVitaminAmount = chomp(readline())
        editedMineralVitaminAmount = (parse(Float16, editedMineralVitaminAmount))

        # Validate Edited Feeding (Validate User Edit)
          TotalFeedRate = editedCornSilageAmount + editedAlfalfaHayAmount + editedCornAmount + editedDistillersGrainAmount + editedSoybeanMealAmount + editedMineralVitaminAmount

          if(TotalFeedRate != 100)
            println("\n\tTotal pecentage does not add up to 100%" )
            println("\tMaking corrected adjustements to corn silage ")
            adjustment = 100 - TotalFeedRate
            editedCornSilageAmount = editedCornSilageAmount + adjustment
            println("\tNew Corn Silage Value: \t\t\t\t", editedCornSilageAmount)
          end
      end

    # Validate Beforehand Feeding Stats
      if(feedCostPerCow == 0)
        println("\n\tCost to feed cow/day not detrmined")
        println("\tUsing average rate for calculations:4.25\n")
        feedCostPerCow = 4.01
      end

    # Calculations
      function calculateCost(ration::Number, newRation::Number, costPercent::Number)
        cost = ((((((abs(ration - newRation)) / ration) * costPercent) + costPercent) / 100) * feedCostPerCow)
        return cost
      end

      cornSilagePrice = calculateCost(cornSilageAmount, editedCornSilageAmount, cornSilageCostRate)
      alfalfaHayPrice = calculateCost(alfalfaHayAmount, editedAlfalfaHayAmount, alfalfaHayCostRate)
      cornPrice = calculateCost(cornAmount, editedCornAmount, cornCostRate)
      distillersGrainPrice = calculateCost(distillersGrainAmount, editedDistillersGrainAmount, distillersGrainCostRate)
      soybeanMealPrice = calculateCost(soybeanMealAmount, editedSoybeanMealAmount, soybeanMealCostRate)
      mineralVitaminPrice = calculateCost(mineralVitaminAmount, editedMineralVitaminAmount, mineralVitaminCostRate)
      additionalPrice = calculateCost(1, 1, additionalCostRate)

      feedCostPerCowPerDay = cornSilagePrice + alfalfaHayPrice + cornPrice + distillersGrainPrice + soybeanMealPrice + mineralVitaminPrice + additionalPrice
      feedCostPerHerdPerDay = feedCostPerCowPerDay * herdSize

    # Display Feeding Stats
      println("\n\n\tCalculated Feed Cost:\n")
      println("\t\tCorn Silage \$/day: \t\t\t\t", round(cornSilagePrice; digits = 2))
      println("\t\tAlfalfa Hay \$/day: \t\t\t\t", round(alfalfaHayPrice; digits = 2))
      println("\t\tCorn \$/day: \t\t\t\t\t", round(cornPrice; digits = 2))
      println("\t\tDistillers Grain \$/day: \t\t", round(distillersGrainPrice; digits = 2))
      println("\t\tSoybean Meal \$/day: \t\t\t", round(soybeanMealPrice; digits = 2))
      println("\t\tMineral/Vitamin/Additive \$/day: ", round(mineralVitaminPrice; digits = 2))

      println("\n\t\tCost to feed cow/day: \t\t\t", round(feedCostPerCowPerDay; digits = 2))
      println("\t\tCost to feed herd/day: \t\t\t", round(feedCostPerHerdPerDay; digits = 2))

    # End of Function
      println("\n************************************************\n")
      println("\n...press ENTER to continue\n")
      empty = readline()

      return(feedCostPerHerdPerDay)
  end
 

####################   Employee Info   ####################
  function employeeInfo(farmName, farmOwner)
    # Local Variables 
      IncrementEmployee = 0
      NumberOfEmployees = 0

    # Employee Info Menu
      println("***************   Employee Info   **************\n")

    # Prompt User to Enter Basic Employee Info
      print("Enter Number of Employees: \t\t\t\t")
      NumberOfEmployees = chomp(readline())
      NumberOfEmployees = (parse(Int8, NumberOfEmployees))

    # Created Arrays
      employeePayArray = collect(1:NumberOfEmployees)
      employeeHoursArray = collect(1:NumberOfEmployees)
      weeklyPayArray = collect(1:NumberOfEmployees)

    # Loop That Prompts the User to Enter Info for Each Employee
      while(NumberOfEmployees != 0 && IncrementEmployee < NumberOfEmployees)

        # Local Variable
          IncrementEmployee += 1

        # User Edit
          print("\n\tEnter hrs/week for Employee", IncrementEmployee, ": \t\t")
          employeeHours = chomp(readline())
          employeeHours = (parse(Float16, employeeHours))

          print("\tEnter \$/hr for Employee", IncrementEmployee, ": \t\t\t")
          employeePay = chomp(readline())
          employeePay = (parse(Float16, employeePay))

          employeeNumber = IncrementEmployee

        # Replace Created Array With New Employee Info
          replace!(employeeHoursArray, employeeNumber => employeeHours)    
          replace!(employeePayArray, employeeNumber => employeePay)
      end

    # Display Employee Info
      println("\nEmployee Stats:")
      println("\n\tFarm Name: \t\t", farmName)
      println("\tFarm Owner: \t", farmOwner )
      println("\n\tEmployees:")

    # Loop That Displayes Each Employees Info
      for i = 1:NumberOfEmployees
        weeklyPay = employeePayArray[i] * employeeHoursArray[i]
        replace!(weeklyPayArray, i => weeklyPay)
        println("\t\tEmployee ",i, ": ", employeeHoursArray[i], "hr/week, ", employeePayArray[i], "\$/hr = ", weeklyPay, "\$/week")
      end

    # Calculations
      weeklyEmployeeExpence = sum(weeklyPayArray)
      dailyEmployeeExpence = weeklyEmployeeExpence / 7

    # Display Employee Info Continued
      println("\n\tTotal employee expense/week:\t\t", round(weeklyEmployeeExpence; digits = 2))
      println("\tTotal employee expense/day:\t\t\t", round(dailyEmployeeExpence; digits = 2))

    # End of Function
      println("\n************************************************\n")
      println("\n...press ENTER to continue\n")
      empty = readline()

      return(dailyEmployeeExpence)
  end
 

####################   General Stats   #################### 
  function general(milkPricePerPound::Number, IncomePerHerdPerDay::Number, feedCostPerHerdPerDay::Number, employeeCostPerday::Number, farmName, farmOwner, herdSize::Number)
    # General Stats Manu
      println("***************   General Stats   **************\n")

    # Validate Beforehand Herd Stats
      if(milkPricePerPound == 0)
        println("Income rate \$/lbs not detrmined")
        println("Using average rate for calculations:\t0.23\n")
        milkPricePerPound = 0.23
      end

      if(IncomePerHerdPerDay == 0)
        println("Income rate herd/day not detrmined")
        println("Using average rate for calculations:\t3000\n")
        IncomePerHerdPerDay = 3000
      end

      if(feedCostPerHerdPerDay == 0)
        println("Cost to feed herd/day not detrmined")
        println("Using average rate for calculations:\t1500\n")
        feedCostPerHerdPerDay = 1500
      end

      if(employeeCostPerday == 0)
        println("Total employee expense/day not detrmined")
        println("Using average rate for calculations:\t500\n")
        employeeCostPerday = 500
      end

    # Calculations
      heiferFeedCost = feedCostPerHerdPerDay * 0.3
      dailyProfit = IncomePerHerdPerDay - feedCostPerHerdPerDay - heiferFeedCost - employeeCostPerday

      animalUpkeepCost = (dailyProfit * 0.5)
      vehicleMaintenanceCost = (dailyProfit * 0.2)
      regularMaintenanceCost = (dailyProfit * 0.05)
      otherExpenses = (dailyProfit * 0.1)

    # Display General Stats
      println("Price Stats:\n")
      println("\tProfit from sold milk: \t\t\t\t", round(IncomePerHerdPerDay; digits = 2))
      println("\tCost to feed cows: \t\t\t\t\t", round(feedCostPerHerdPerDay; digits = 2))
      println("\tCost to feed all other heifers: \t", round(heiferFeedCost; digits = 2))
      println("\tCost to pay Employees: \t\t\t\t", round(employeeCostPerday; digits = 2))

      println("\nAdditional Expenses:\n")
      println("\tAnimal upkeep: \t\t\t\t\t\t", round(animalUpkeepCost; digits = 2))
      println("\tVehicle Maintenance: \t\t\t\t", round(vehicleMaintenanceCost; digits = 2))
      println("\tRegular Maintenance: \t\t\t\t", round(regularMaintenanceCost; digits = 2))
      println("\tOther Expenses: \t\t\t\t\t",  round(otherExpenses; digits = 2))

    # User Option to Edit
      print("\n\tWould you like to edit rate? (y/n): ")
      userAdditionalExpensesInput = chomp(readline())

    # User Edit
      if(userAdditionalExpensesInput == "y")
        print("\n\tEnter Animal upkeep Expense: \t\t")
        animalUpkeepCost = chomp(readline())
        animalUpkeepCost = (parse(Float16, animalUpkeepCost))

        print("\tEnter Vehicle Maintenanc: \t\t\t")
        vehicleMaintenanceCost = chomp(readline())
        vehicleMaintenanceCost = (parse(Float16, vehicleMaintenanceCost))

        print("\tEnter Regular Maintenance: \t\t\t")
        regularMaintenanceCost = chomp(readline())
        regularMaintenanceCost = (parse(Float16, regularMaintenanceCost))

        print("\tEnter Other Expenses: \t\t\t\t")
        otherExpenses = chomp(readline())
        otherExpenses = (parse(Float16, otherExpenses))
      end

    # Calculations
      adjustedDailyProfit = dailyProfit - animalUpkeepCost - vehicleMaintenanceCost - regularMaintenanceCost - otherExpenses
      yearlyProfit = adjustedDailyProfit * 365

    # Display Grand Total General Stants
      println("\nGrand Totals:\n")
      println("\tFarm Name: \t\t", farmName)
      println("\tFarm Owner: \t", farmOwner)
      println("\tHerd Size: \t\t", herdSize)

      println("\n\tTotal profit per day: \t\t\t\t", round(dailyProfit; digits = 2))
      println("\tProfit after additional expenses: \t", round(adjustedDailyProfit; digits = 2))
      println("\tTotal profit per year: \t\t\t\t", round(yearlyProfit; digits = 2))

    # End of Function
      println("\n************************************************\n")
      println("\n...press ENTER to continue\n")
      empty = readline()
  end


########################   Help   ######################### 
  function help()
    # Help Manu
      println("*******************   Help   *******************\n")
      println("\nAbbreviations:")
      println("\tlb....................................pounds")
      println("\tcwt............................hundredweight")
      println("\tgal...................................gallon")
      println("\thr/hrs.................................hours")
      println("\therd...........................multiple cows")
      println("\t\$....................................dollars")
      println("\t%....................................percent")

      println("\nMilk Rate Abbreviations:")
      println("\tFat %........Fat Milk Composition Percentage\n")
      println("\tProtein %...................................")
      println("\t.........Protein Milk Composition Percentage\n")
      println("\tOther Solids %..............................")
      println("\t....Other Solids Milk Composition Percentage\n")
      println("\tSCC.......................Somatic Cell Count\n")
      println("\tFat \$/lb....................................")
      println("\t..............Fat Component Prices Per Pound\n")
      println("\tProtein \$/lb................................")
      println("\t..........Protein Component Prices Per Pound\n")
      println("\tOther Solids \$/lb...........................")
      println("\t.....Other Solids Component Prices Per Pound\n")
      println("\tSCC Adjust. Rate............................")
      println("\t..........Somatic Cell Count Adjustment Rate\n")
      println("\tPPD..............Producer Price Differential")

      println("\nMeasurements:")
      println("\t1 cwt................................100 lbs")
      println("\t1 cwt..............................11.63 gal")
      println("\t1 gal................................8.6 lbs")
      println("\t1 day.................................24 hrs")
      println("\t1 week...............................168 hrs")
      println("\t1 week................................7 days\n")

    # End of Function
      println("************************************************\n")
      println("\n...press ENTER to continue\n")
      empty = readline()
  end


######################   Main Menu   ###################### 
    # Local Variables
      mainMenuInput = 0
      milkPricePerPound = 0
      IncomePerHerdPerDay = 0
      feedCostPerHerdPerDay = 0
      employeeCostPerday = 0

    # Prompt User to Enter Basic Farm Information
      println("\nEnter the following information to get started!\n")
      print("Farm Name: \t")
      global farmName = chomp(readline())

      print("Farm Owner: ")
      global farmOwner = chomp(readline())

      print("Herd Size: \t")
      global herdSize = chomp(readline())
      herdSize = trunc(Int32, parse(Float32, herdSize))

    # End of Intitial Startup
      println("\n...press ENTER to continue\n")
      empty = readline()

    # Loop That Runs Farm Manager Program
      while(mainMenuInput != 7)
        println("************************************************")
        println("*           Welcome to Farm Manager!           *")
        println("*                                              *")
        println("* 1. Milk Price Stats                          *")
        println("* 2. Herd Stats                                *")
        println("* 3. Feeding Stats                             *")
        println("* 4. Employee Info                             *")
        println("* 5. General Stats                             *")
        println("* 6. Help                                      *")
        println("* 7. Exit                                      *")
        println("************************************************")

        # Prompt User to Select Numeric Option
          print("Enter a number: ")
          mainMenuInput = chomp(readline())
          mainMenuInput = trunc(Int8, parse(Float16, mainMenuInput))
          println("\n")

        # Statement That Coordinates to the Correct Funcation 
        # Given the Selected Number from the User
          if(mainMenuInput == 1)
            global milkPricePerPound = milkPriceStats()
          elseif(mainMenuInput == 2)
            global IncomePerHerdPerDay = heardInfo(milkPricePerPound, herdSize)
          elseif(mainMenuInput == 3)
            global feedCostPerHerdPerDay = feedingStats(herdSize)
          elseif(mainMenuInput == 4)
            global employeeCostPerday = employeeInfo(farmName, farmOwner)
          elseif(mainMenuInput == 5)
            general(milkPricePerPound, IncomePerHerdPerDay, feedCostPerHerdPerDay, employeeCostPerday, farmName, farmOwner, herdSize)
          elseif(mainMenuInput == 6)
            help()
          elseif(mainMenuInput == 7)
            println("...Exiting Application")
            break
          else 
            println("please enter a valid input")
          end
      end


#####################   References   ###################### 
#
# https://docs.julialang.org/en/v1/
#
# http://www.fmma30.com/DairyNews/2020/09-20--DairyNews.pdf
# https://extension.psu.edu/spreadsheet-to-calculate-milk-price
# https://afs.ca.uky.edu/files/what_does_it_cost_you_to_feed_your_cows.pdf
#
###########################################################
