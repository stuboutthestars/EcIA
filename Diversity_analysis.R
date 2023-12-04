##### Shannon Diversity Indices for each taxa

rm(list=ls())
library(ggplot2)
setwd("C:/Users/yogna/OneDrive/Documents/MSc EcoEvoBiodiv/Professional Skills for Ecologists/EcIA")


#importing datasets
bird_data <- read.csv("bird_occurrences.csv")
bird_pc_data <- read.csv("bird_pc_occurrences.csv")
mammal_data <- read.csv("mammal_occurrences.csv")
bat_data <- read.csv("bat_occurences.csv") 
invert_a_data <- read.csv("invertebrates_a_occurrences.csv")
invert_t_data <- read.csv("invertebrates_t_occurrences.csv")
tree_data <- read.csv("trees_occurrences.csv")


# Calculate the unique bird species - from transects
# Rows 1:13 for 'north'
unique_birds_north <- unique(bird_data[1:13, "species"])
sum_birds_north <- numeric(length(unique_birds_north))

for (i in seq_along(unique_birds_north)) {
  current_species <- unique_birds_north[i]
  sum_birds_north[i] <- sum(bird_data[1:13, "organismQuantity"][bird_data[1:13, "species"] == current_species], na.rm = TRUE)
}

# Rows 14:32 for 'south'
unique_birds_south <- unique(bird_data[14:32, "species"])
sum_birds_south <- numeric(length(unique_birds_south))

for (i in seq_along(unique_birds_south)) {
  current_species <- unique_birds_south[i]
  sum_birds_south[i] <- sum(bird_data[14:32, "organismQuantity"][bird_data[14:32, "species"] == current_species], na.rm = TRUE)
}

# Create data frames for north and south
bird_abundance_north <- data.frame(
  species = unique_birds_north,
  total_birds = sum_birds_north,
  region = "north"
)

bird_abundance_south <- data.frame(
  species = unique_birds_south,
  total_birds = sum_birds_south,
  region = "south"
)

bird_abundance_north
bird_abundance_south




#############
#point count bird data
# Rows 1:5 for 'north'
unique_pcbirds_north <- unique(bird_pc_data[1:5, "species"])
sum_pcbirds_north <- numeric(length(unique_pcbirds_north))

for (i in seq_along(unique_pcbirds_north)) {
  current_pcspecies <- unique_pcbirds_north[i]
  sum_pcbirds_north[i] <- sum(bird_pc_data[1:5, "organismQuantity"][bird_pc_data[1:5, "species"] == current_pcspecies], na.rm = TRUE)
}

# Rows 6:9 for 'south'
unique_pcbirds_south <- unique(bird_pc_data[6:9, "species"])
sum_pcbirds_south <- numeric(length(unique_pcbirds_south))

for (i in seq_along(unique_pcbirds_south)) {
  current_pcspecies <- unique_pcbirds_south[i]
  sum_pcbirds_south[i] <- sum(bird_pc_data[6:9, "organismQuantity"][bird_pc_data[6:9, "species"] == current_pcspecies], na.rm = TRUE)
}

# Create data frames for north and south
pcbird_abundance_north <- data.frame(
  pcspecies = unique_pcbirds_north,
  total_pcbirds = sum_pcbirds_north,
  region = "north"
)

pcbird_abundance_south <- data.frame(
  pcspecies = unique_pcbirds_south,
  total_pcbirds = sum_pcbirds_south,
  region = "south"
)

# Combine the data frames
pcbird_abundance_north
pcbird_abundance_south
#pcbird_abundance <- rbind(pcbird_abundance_north, pcbird_abundance_south)



###########
#aquatic invertebrates
#calculating unique order as many species and family unidentified
unique_ainverts_north <- unique(invert_a_data[1:24, "order"])
sum_ainverts_north <- numeric(length(unique_ainverts_north))

for (i in seq_along(unique_ainverts_north)) {
  current_ainv_order <- unique_ainverts_north[i]
  sum_ainverts_north[i] <- sum(invert_a_data[1:24, "organismQuantity"][invert_a_data[1:24, "order"] == current_ainv_order], na.rm = TRUE)
}

# Rows 25:50 for 'south'
unique_ainverts_south <- unique(invert_a_data[25:50, "order"])
sum_ainverts_south <- numeric(length(unique_ainverts_south))

for (i in seq_along(unique_ainverts_south)) {
  current_ainv_order <- unique_ainverts_south[i]
  sum_ainverts_south[i] <- sum(invert_a_data[25:50, "organismQuantity"][invert_a_data[25:50, "order"] == current_ainv_order], na.rm = TRUE)
}

# Create data frames for north and south
ainverts_abundance_north <- data.frame(
  ainv_order = unique_ainverts_north,
  total_ainverts = sum_ainverts_north,
  region = "north"
)

ainverts_abundance_south <- data.frame(
  ainv_order = unique_ainverts_south,
  total_ainverts = sum_ainverts_south,
  region = "south"
)

ainverts_abundance_north
ainverts_abundance_south




##############
#terrestrial invertebrates 
#calculating unique family as many species unidentified
unique_tinverts_north <- unique(invert_t_data[1:108, "family"])
sum_tinverts_north <- numeric(length(unique_tinverts_north))

for (i in seq_along(unique_tinverts_north)) {
  current_tinv_family <- unique_tinverts_north[i]
  sum_tinverts_north[i] <- sum(invert_t_data[1:108, "organismQuantity"][invert_t_data[1:108, "family"] == current_tinv_family], na.rm = TRUE)
}

# Rows 109:199 for 'south'
unique_tinverts_south <- unique(invert_t_data[109:199, "family"])
sum_tinverts_south <- numeric(length(unique_tinverts_south))

for (i in seq_along(unique_tinverts_south)) {
  current_tinv_family <- unique_tinverts_south[i]
  sum_tinverts_south[i] <- sum(invert_t_data[109:199, "organismQuantity"][invert_t_data[109:199, "family"] == current_tinv_family], na.rm = TRUE)
}

# Create data frames for north and south
tinverts_abundance_north <- data.frame(
  tinv_family = unique_tinverts_north,
  total_tinverts = sum_tinverts_north,
  region = "north"
)

tinverts_abundance_south <- data.frame(
  tinv_family = unique_tinverts_south,
  total_tinverts = sum_tinverts_south,
  region = "south"
)

tinverts_abundance_north
tinverts_abundance_south




###################
#bat abundance - using presence absence as a proxy
bat_abundance_north <- length(unique(bat_data[27:44,]$species))
bat_abundance_south <- length(unique(bat_data[1:26,]$species))
bat_abundance_north
bat_abundance_south


###############
#trees
unique_trees_north <- unique(tree_data[10:13, "species"])
sum_trees_north <- numeric(length(unique_trees_north))

for (i in seq_along(unique_trees_north)) {
  current_tree_species <- unique_trees_north[i]
  sum_trees_north[i] <- sum(tree_data[10:13, "organismQuantity"][tree_data[10:13, "species"] == current_tree_species], na.rm = TRUE)
}

# Rows 1:9 for 'south'
unique_trees_south <- unique(tree_data[1:9, "species"])
sum_trees_south <- numeric(length(unique_trees_south))

for (i in seq_along(unique_trees_south)) {
  current_tree_species <- unique_trees_south[i]
  sum_trees_south[i] <- sum(tree_data[1:9, "organismQuantity"][tree_data[1:9, "species"] == current_tree_species], na.rm = TRUE)
}

# Create data frames for north and south
tree_abundance_north <- data.frame(
  species = unique_trees_north,
  total_trees = sum_trees_north,
  region = "north"
)

tree_abundance_south <- data.frame(
  species = unique_trees_south,
  total_trees = sum_trees_south,
  region = "south"
)

tree_abundance_north
tree_abundance_south



##################
#calculating Shannon's diversity index for each group
#Function to calculate Shannon's Diversity Index
shannon_diversity <- function(abundance_vector) {
  proportions <- abundance_vector / sum(abundance_vector)
  -sum(proportions * log(proportions, base = exp(1)))
}

#terrestrial inverts - northern plot
tinverts_tot_north <- tinverts_abundance_north$total_tinverts
shannon_tinvert_north <- shannon_diversity(tinverts_tot_north)
cat("Shannon Diversity Index for the North Region:", shannon_tinvert_north, "\n")
#southern plot
tinverts_tot_south <- tinverts_abundance_south$total_tinverts
shannon_tinvert_south <- shannon_diversity(tinverts_tot_south)
cat("Shannon Diversity Index for the South Region:", shannon_tinvert_south, "\n")

#aquatic inverts - northern plot
ainverts_tot_north <- ainverts_abundance_north$total_ainverts
shannon_ainvert_north <- shannon_diversity(ainverts_tot_north)
cat("Shannon Diversity Index for the North Region:", shannon_ainvert_north, "\n")
#southern plot
ainverts_tot_south <- ainverts_abundance_south$total_ainverts
shannon_ainvert_south <- shannon_diversity(ainverts_tot_south)
cat("Shannon Diversity Index for the South Region:", shannon_ainvert_south, "\n")

#birds (transect) - northern plot
bird_tot_north <- bird_abundance_north$total_birds
shannon_bird_north <- shannon_diversity(bird_tot_north)
cat("Shannon Diversity Index for the North Region:", shannon_bird_north, "\n")
#southern
bird_tot_south <- bird_abundance_south$total_birds
shannon_bird_south <- shannon_diversity(bird_tot_south)
cat("Shannon Diversity Index for the South Region:", shannon_bird_south, "\n")

#birds (point count) - northern plot
pcbird_tot_north <- pcbird_abundance_north$total_pcbirds
shannon_pcbird_north <- shannon_diversity(pcbird_tot_north)
cat("Shannon Diversity Index for the North Region:", shannon_pcbird_north, "\n")
#southern
pcbird_tot_south <- pcbird_abundance_south$total_pcbirds
shannon_pcbird_south <- shannon_diversity(pcbird_tot_south)
cat("Shannon Diversity Index for the South Region:", shannon_pcbird_south, "\n")

#trees - northern
#birds (point count) - northern plot
trees_tot_north <- tree_abundance_north$total_trees
shannon_trees_north <- shannon_diversity(trees_tot_north)
cat("Shannon Diversity Index for the North Region:", shannon_trees_north, "\n")
#southern
trees_tot_south <- tree_abundance_south$total_trees
shannon_trees_south <- shannon_diversity(trees_tot_south)
cat("Shannon Diversity Index for the South Region:", shannon_trees_south, "\n")

#diversity plot
diversity_plot <- data.frame(
  Region = c("North", "South", "North", "South", "North", "South", "North", "South", "North", "South"),
  Group = rep(c("Terrestrial Invertebrates", "Aquatic Invertebrates", "Birds (Transect)", "Birds (Point Count)", "Trees"), each = 2),
  Shannon_Diversity = c(
    shannon_tinvert_north, shannon_tinvert_south,
    shannon_ainvert_north, shannon_ainvert_south,
    shannon_bird_north, shannon_bird_south,
    shannon_pcbird_north, shannon_pcbird_south,
    shannon_trees_north, shannon_trees_south
  )
)

#plotting the diversities
ggplot(diversity_plot, aes(x = Group, y = Shannon_Diversity, fill = Region)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = sprintf("%.2f", Shannon_Diversity)), vjust = -0.5, position = position_dodge(width = 0.9), size = 3) +
  labs( y = "Shannon Diversity Index", x = "Group") +
  scale_fill_manual(values = c("#3399FF", "#CC99FF")) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#plotting bat abundance as can't calculate diversity index
bat_counts <- data.frame(
  Region = c("North", "South"),
  Count = c(bat_abundance_north, bat_abundance_south)
)

#plotting graph
ggplot(bat_counts, aes(x = Region, y = Count, fill = Region)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Count), vjust = -0.5, position = position_dodge(width = 0.9), size = 3) +
  labs(title = "Bat Species Abundance", y = "Number of Unique Species", x = "Region") +
  scale_fill_manual(values = c("#3399FF", "#CC99FF")) +
  theme_minimal()