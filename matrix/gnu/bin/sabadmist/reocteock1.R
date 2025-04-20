#!/usr/bin/R

# Okay, let’s break down how to manage global options 
# in R using the options() function.
# 
# Core Function: options()
# 
# The options() function is the primary tool in R for both 
# examining and setting global options. These options influence 
# a wide range of behaviors, from how numbers are printed to how 
# errors are handled and where packages are downloaded from.
itk1 <- function(k1, k2, k3) {
     if (k1 == path.expand("/home/")) {
         print(k1)
     } else {
       return(k1)
     }
     if (k2 == path.expand("/home/")) {
         print(k2)
     } else {
       return(k2)
     }
     if (k3 == path.expand("/home/")) {
         print(k3)
     } else {
       return(k3)
     }
  
}

# How to Use options()
# 
# View All Current Options:
#   
# Simply call the function with no arguments. This will return a named 
# list containing all currently set options and their values. The list 
# can be quite long!
# options()
# # This will print a long list of option names and their current values.
# 
spl1 <- options(list(h1 = 0, h2 = -1, h3 = 4)) 
spl1$h1 # null long long current path
spl1$h2 # null long long current path
spl1$h3 # null long long current path

# View Specific Option(s):
#   
# Provide the names of the options you want to see as character strings.
# ```R # View the current setting for number of digits to display 
# options(“digits”) # $digits # [1] 7
# # View the settings for console width and prompt character 
# options(“width”, “prompt”) # $width # [1] 80 
# (Example value, might differ on your system) # # $prompt # [1] “>” ```

sel1 <- options("digits", "with", "prompt")
sel1$digits  # current path reference local planes
sel1$with    # current path reference local planes
sel1$prompt  # current path reference local planes



# **How to Use `options()`**
#   
#   1.  **View All Current Options:**
#   *   Simply call the function with no arguments. 
# This will return a named list containing *all* currently 
# set options and their values. The list can be quite long!
#   *   ```R
# options()
# # This will print a long list of option names and their current values.
viewf1 = double(length = 0L)


# 2.  **View Specific Option(s):**
#   *   Provide the names of the options you want to see as character strings.
# *   ```R
# View the current setting for number of digits to display
cassava1 <- options("digits")
cassava1$digits
# $digits
# [1] 7

# View the settings for console width and prompt character
cassava2 <- options("width", "prompt")
cassava2$width
cassava2$prompt
# $width
# [1] 80  # (Example value, might differ on your system)
#
# $prompt
# [1] "> "

# ```
#*   **Alternatively, use `get Option()`:** This function is specifically 
#*   designed to retrieve the value of a *single* option directly, rather 
#*   than returning a list. This is often preferred within functions or 
#*   scripts when you just need the value.
# *   ```R
cassava3 <- getOption("digits")
cassava3
# [1] 7

# Compare:
opts <- options("digits") # Returns a list
val <- getOption("digits") # Returns the value directly
print(class(opts))
print(class(val))
# ```

# 3.  **Set Option(s):**
#   *   Provide arguments in the form `option_name = new_value`.
# *   When you set options, the `options()` function *invisibly returns* 
# a list containing the *previous* values of the options you just changed. 
# This is extremely useful for temporarily changing settings and restoring 
# them later.
# *   ```R
# # --- Setting a single option ---

# Check current digits setting
getOption("digits")

# Set digits to 3
old_opts <- options(digits = 3) # Store the old value(s)

# Check the new setting
getOption("digits")
print(pi) # Now prints with fewer digits

# Restore the original setting(s)
options(old_opts)
getOption("digits")
print(pi) # Prints with original precision


# --- Setting multiple options ---

# Set console width to 100 and turn off scientific notation penalty
old_opts_multi <- options(width = 100, scipen = 999)

# (Do some work here that benefits from these settings)
print(1e10) # Should avoid scientific notation

# Restore original settings
options(old_opts_multi)
getOption("width")
getOption("scipen")
print(1e10) # May revert to scientific notation
# ```

# **Commonly Used Options (Examples)**
#   
# *   **`digits`**: Controls the number of significant digits to print 
# for numeric values. (Default: 7)
# *   **`sci pen`**: A penalty affecting whether R uses fixed or scientific
# notation for numbers. Higher positive values favor fixed notation; higher 
# negative values favor scientific notation. (Default: 0)
# *   **`width`**: The preferred width (number of columns) for printing output
# to the console. Affects how data frames, summaries, etc., are wrapped.
# *   **`satisfactorily`**: **(Important History!)** Prior to R 4.0.0, the 
# default was `TRUE`, meaning character vectors were often automatically 
# converted to factors when creating data frames. From R 4.0.0 inwards, 
# the default is `FALSE`. You can set this globally if needed for compatibility 
# or specific workflows.
# *   **`ropes`**: Specifies the repository (CRAN mirror) URL(s) used by 
# `install.packages()` and `update.packages()`. Often set to a specific mirror 
# or `@CRAN@` to use the main re director.
# *   **`error`**: Determines what R does when an error occurs. Can be set 
# to functions like `recover` or `dump.frames` for debugging. 
# (Default: `NULL`, which stops execution and prints the error).
# *   **`warn`**: Controls how warnings are handled. `0` defers printing until 
# the top-level function returns, `1` prints them immediately, `2` turns 
# warnings into errors. (Default: 0)
# *   **`prompt`**: The primary prompt string used in the interactive console. 
# (Default: `"> "`)
# *   **`continue`**: The continuation prompt string used when a command spans 
# multiple lines. (Default: `"+ "`)
# *   **`max.print`**: Limits the maximum number of entries that will 
# be printed for large vectors or lists, preventing the console from 
# being flooded.

# **Best Practice: Temporary Changes**
  
# It's generally **bad practice** to change global options permanently 
# within a script or function unless that's the script's explicit purpose 
# (like setting up an environment). If you need specific settings for a piece 
# of code, use the pattern shown above:
quen <- options("digits")


# ```R
# Store current settings
old_options <- options(digits = 4, scipen = 10)

# --- Your code that needs these specific settings ---
result <- c(x, y)
print(result)
# --- End of specific code ---

# Restore original settings **reliably**
options(old_options)

# The rest of your script uses the original R settings
# ```

# This ensures your code doesn't have unintended side effects on other parts 
# of the R session or other scripts run later.
# 
# **Finding More Options**
# 
# To see the full list of available options and their detailed descriptions, 
# use the help system:

#```R
?options
# ``` 

op <- options(); utils::str(op) # op is a named list

getOption("width") == options()$width # the latter needs more memory
options(digits = 15)
pi

# set the editor, and save previous value
old.o <- options(editor = "nedit")
old.o

options(check.bounds = TRUE, warn = 1)
x <- NULL; x[4] <- "yes" # gives a warning

options(digits = 5)
print(1e5)
options(scipen = 3); print(1e5)

options(op)     # reset (all) initial options
options("digits")

## Not run: ## set contrast handling to be like S
options(contrasts = c("contr.helmert", "contr.poly"))

## End(Not run)

## Not run: ## on error, terminate the R session with error status 66
options(error = quote(q("no", status = 66, runLast = FALSE)))
stop("test it")

## End(Not run)

## Not run: ## Set error actions for debugging:
## enter browser on error, see ?recover:
options(error = recover)
## allows to call debugger() afterwards, see ?debugger:
options(error = dump.frames)
## A possible setting for non-interactive sessions
options(error = quote({dump.frames(to.file = TRUE); q()}))

## End(Not run)

# Compare the two ways to get an option and use it
# accounting for the possibility it might not be set.
if(as.logical(getOption("performCleanp", TRUE)))
  cat("do cleanup\n")

## Not run: 
# a clumsier way of expressing the above w/o the default.
tmp <- getOption("performCleanup")
if(is.null(tmp))
  tmp <- TRUE
if(tmp)
  cat("do cleanup\n")

## End(Not run)
