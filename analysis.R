analysis <- function(){
        #read the train and test row files 
        data <- read.csv("pml-training.csv")
        test <- read.csv("pml-testing.csv")

        #clean data from NAs and spaces 
        clean <- data[ , colSums(data == "") == 0 & colSums(is.na(data)) == 0]
        clean <- subset(clean, select = -c(X, user_name, new_window, cvtd_timestamp))
        
        #create sub train data and cross validation from training 
        intrain <- createDataPartition(y=clean$classe, p = .25, list = FALSE)
        train <- clean[intrain,]
        cv <- clean[-intrain,]
        
        #train the model with sub train data  
        #modelfit <- train(train$classe ~ ., method = "rf", preProcess = c("center", "scale"),  data = train, prox = TRUE, ntree = 10)
        
        #model efficiency 
        confusionMatrix(cv$classe, predict(modelfit, cv))
        
        #predict 20 different test cases
        answers <- predict(modelfit, test)
        
        #output
        n = length(answers)
        for(i in 1:n){
                filename = paste0("problem_id_",i,".txt")
                write.table(answers[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
        }
        answers
}