```
Author:     Lianrui Geng
Partner:    None
Course:     CS 3200, University of Utah, School of Computing
GitHub ID:  LianruiBruce
Date:		02/12/2022
Copyright:  CS 3200 and Lianrui Geng - This work may not be copied for use in Academic Coursework.
```

# This is assignment 2 from CS 3200:

# README for Code Snippet

# Q1_a

This code snippet reads data from a text file named "NIST_Filip_trim.txt", which contains two columns of data. The data is read line by line and stored in an array named yy.

After all the lines of the text file have been read, the data is sorted based on the first column and stored in a sorted array named sorted_data. The x-values and y-values are then stored in separate arrays named x and y, respectively.

Finally, a plot of the sorted data is created using the plot function. The x-values are plotted on the x-axis and the y-values are plotted on the y-axis. The plot is labeled with x-axis and y-axis labels, and a title.

This code serves as a starting point for further processing and analysis of the data contained in the text file.

# Q1_b:

This code reads data from a text file named "NIST_Filip_trim.txt". It uses the fopen and fgetl functions to read the data line by line, store it in an array named yy, and sort it based on the first column. The x-values and y-values are 
then stored in separate arrays named x and y. The values in these arrays are then normalized between -1 and 1 using the min and max functions. Finally, a plot of the normalized and sorted data is created and labeled with x-axis and y-axis labels, and a title.

# Q1_c:

This code reads data from a text file named "NIST_Filip_trim.txt" and fits polynomials of different degrees to the data. The data is read using the fopen and fgetl functions and stored in arrays named x and y.

A design matrix named X is created using the x values, and linear regression is performed using the \ operator to fit polynomials of different degrees to the data. The fitted values are stored in an array named y_hat.

Finally, the code creates a plot of the original data and the fitted polynomials for each degree of the polynomial. The plots are labeled with x-axis and y-axis labels, and a title for each plot.

# Q1_d:

This code reads data from a text file named "NIST_Filip_trim.txt" and fits polynomials of different degrees to the data. The data is read using the fopen and fgetl functions and stored in arrays named x and y.

A design matrix named X is created using the x values, and linear regression is performed using the \ operator to fit polynomials of different degrees to the data. The fitted values are stored in an array named y_hat, and the residual sum of squares (RSS) and the condition number of the design matrix are calculated and stored in variables named E and k, respectively.

Finally, the code creates a plot of the original data and the fitted polynomials for each degree of the polynomial. The plots are labeled with x-axis and y-axis labels, a title for each plot, and the degree of the polynomial, RSS, and condition number.

# Q2

This code block performs a matrix operation to find the solution to a system of linear equations represented by the matrix A and the column vector b. The system of equations is solved using the backslash operator (\), which computes the solution to the equation A*x = b. The resulting solution x is then displayed using the disp function.