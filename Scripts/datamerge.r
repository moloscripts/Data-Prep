library(readxl)
library(dplyr)
library(naniar)

#Survey data
survey <- read_excel("Data/swaintake3sat4buscode.xlsx")

#Part 1 of the oil palm farmers data
# part1_oil_farm_details <- read_excel("swabeneficiaryintake2-oil_fam_det.xlsx")

part1_oil_farm_details <- read_excel("Data/swabeneficiaryintake2-oil_fam_det.xlsx")
part1_oil_farm_size <- read_excel("Data/swabeneficiaryintake2-oil_fam_size.xlsx")

part1_oil_majority_data <- read_excel("Data/swabeneficiaryintake2.xlsx")

part1_oil_farm_details_size <- merge(part1_oil_farm_details, part1_oil_farm_size, by = "KEY", all.x = TRUE)
part1_oil_data <- merge(part1_oil_majority_data, part1_oil_farm_details_size, by = "KEY", all.x = TRUE)



# EXERCISE 1 SOLUTION ####
#Part 2 of the oil palm farmers data
part2_oil_farm_details <- read_excel("Data/swaintake3sat4bus-oil_fam_det.xlsx")
part2_oil_farm_size <- read_excel("Data/swaintake3sat4bus-oil_fam_size.xlsx")
part2_oil_majority_data <- read_excel("Data/swaintake3sat4bus.xlsx")

part2_oil_farm_details_size <- merge(part2_oil_farm_details, part2_oil_farm_size, by = "KEY", all.x = TRUE)


part2_oil_data <- merge(part2_oil_majority_data, part2_oil_farm_details_size, by = "KEY", all.x = TRUE)

#Append the 2 datasets (using bind_rows instead of rbind because there is an unequal number of columns)
data <- bind_rows(part1_oil_data, part2_oil_data)


survey2 <- survey %>% filter(
  name == "country_id"|
    name == "region_id"|
    name == "district_id"|
    name == "community_id1"|
    name == "age"|
    name == "yearofrespondent"|
    name == "sex"|
    name == "marital"|
    name == "a15"|
    name == "a15_english"|
    name == "a15_twi"|
    name == "a15_ga"|
    name == "a15_ewe"|
    name == "a15_fante"|
    name == "a15_dagbani"|
    name == "a15_sefwi"|
    name == "a15_french"|
    name == "a15_wassa"|
    name == "a15_ahanta"|
    name == "a15_nzema"|
    name == "a15_guan"|
    name == "a15_sign"|
    name == "a15_other"|
    name == "a15_none"|
    name == "a15oth"|
    name == "a16"|
    name == "a18"|
    name == "a19"|
    name == "a20"|
    name == "a21"|
    name == "coc_b1"|
    name == "coc_b4"|
    name == "coc_b4_nobenefit"|
    name == "coc_b4_training"|
    name == "coc_b4_groupnegotiation"|
    name == "coc_b4_inputs"|
    name == "coc_b4_financialservice"|
    name == "coc_b4_other"|
    name == "c1a"|
    name == "c8phones"|
    name == "c9"|
    name == "c9_basicphone"|
    name == "c9_featuredphone"|
    name == "c9_smartphone"|
    name == "e2"|
    name == "e4"|
    name == "coc_f1"|
    name == "oil_f1"|
    name == "h5"|
    name == "h6"|
    name == "h6_seedlings"|
    name == "h6_fertilizers"|
    name == "h6_agrochecmicals"|
    name == "h6_raingears"|
    name == "h6_training"|
    name == "h6_basictools"|
    name == "h6_processmachine"|
    name == "h7"|
    name == "h7_inputshop"|
    name == "h7_traders"|
    name == "h7_partners"|
    name == "h7_family"|
    name == "h7_middlemen"|
    name == "h7_other"|
    name == "j7"|
    name == "j8"|
    name == "j8_jan"|
    name == "j8_feb"|
    name == "j8_mar"|
    name == "j8_apr"|
    name == "j8_may"|
    name == "j8_jun"|
    name == "j8_jul"|
    name == "j8_aug"|
    name == "j8_sep"|
    name == "j8_oct"|
    name == "j8_nov"|
    name == "j8_dec"|
    name == "j9"|
    name == "j9_earninghhdied"|
    name == "j9_earninghhleft"|
    name == "j9_morehhmem"|
    name == "j9_earninghhjobloss"|
    name == "j9_earninghhill"|
    name == "j9_noremittace"|
    name == "j9_lessremittance"|
    name == "j9_pestaffectfoodharvest"|
    name == "j9_climateaffectfoodharves"|
    name == "j9_pestaffectcocoa"|
    name == "j9_climateaffectcocoa"|
    name == "j9_foodstorproblem"|
    name == "j9_soldafterharvest"|
    name == "j9_highfoodprice"|
    name == "j9_lesslandaccess"|
    name == "k1a_a"|
    name == "k1b_a")

n_miss(data)
miss_var_summary(data)

miss <- colSums(is.na(data))
gg_miss_upset(data)