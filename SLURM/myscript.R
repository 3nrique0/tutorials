# This is an R script

# First part of the script
print("Hello,")
Sys.getenv("USER")
print("The time is")
Sys.time()


# Second part of the script
Sys.sleep(60)
print("Now 60 seconds have passed since the last print")
Sys.time()


# Thrid part of the script 
print("\nExtra text to output")
head(mtcars)


# Fouth part
# Make a plot !
png("hist_horse_power.png")
hist(mtcars$hp)
dev.off()
