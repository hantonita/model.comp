# model.comp
A package to help with fitted model comparisons 

## Exercise 1.1:
To create this R package, the following steps were used:
```
library(devtools)
create_package('~Documents/model.comp')
``` 
to make an R package

```
library(devtools)
use_git()
``` 
to ensure that the project is using git. Then I created a repository on github with the same name, and used the shell opened from my R project to push the existing repository to github.

```
library(devtools)
use_r('compare')
```
to create the `compare.R` file to hold my `compare` function.

I then edited the `DESCRIPTION` file, adding a title and the author information, and using `use_mit_license()` to add a license to my package.


