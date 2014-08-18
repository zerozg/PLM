PML
===

The instruction list:

1. Step1 - manually download training and testing Dataset from the link 
                  "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
                  "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv" and unzipped

2. Step2 - run  R version 3.1.0, read the train and test row files using read.csv function

3. Step3 - clean data from NAs and spaces 

4. Step4 - create sub train data and cross validation from training data using createDataPartition function with p argment equal .25
                   and list argment equal FALSE

5. Step5 - apply center and scale on sub train data 

6. Step6 - train the model with sub train data using train function with random forests algorithm and ntree argment equal 10

7. Step7 - model efficiency on sub train data is about 98.3% and on cross validation data is about 99%

8. Step8 - predict 20 different test cases