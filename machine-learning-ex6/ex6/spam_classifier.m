%% Initializationclear ; close all; clc%% =========== Part 1: Train Linear SVM for Spam Classification ========%  Train a linear classifier to determine if an mail is Spam or Not-Spam.% Load the Spam Email dataset% Loads X, y in environmentload('spamTrain.mat');fprintf('\nTraining Linear SVM (Spam Classification)\n')fprintf('(this may take 1 to 2 minutes) ...\n')C = 0.1;model = svmTrain(X, y, C, @linearKernel);p = svmPredict(model, X);fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);%% =================== Part 2: Test Spam Classification ================%  After training the classifier, evaluate it on a test set. % Test set in spamTest.mat% Load the test dataset / Xtest, ytest in the environmentload('spamTest.mat');fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')p = svmPredict(model, Xtest);fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);pause;%% ================= Part 3: Top Predictors of Spam ====================%  Since the model we are training is a linear SVM, we can inspect the%  weights learned by the model to understand better how it is determining%  whether an email is spam or not. The following code finds the words with%  the highest weights in the classifier. Informally, the classifier%  'thinks' that these words are the most likely indicators of spam.%% Sort the weights and obtin the vocabulary list[weight, idx] = sort(model.w, 'descend');vocabList = getVocabList();fprintf('\nTop predictors of spam: \n');for i = 1:30    fprintf(' %-15s (%f) \n', vocabList{idx(i)}, weight(i));endfprintf('\n\n');fprintf('\nProgram paused. Press enter to continue.\n');pause;%% =================== Part 4: Try Your Own Emails =====================%  Use the classifier on actual emails. In the starter code, we have included % spamSample1.txt, spamSample2.txt, emailSample1.txt and emailSample2.txt as examples. %  The following code reads in one of these emails and then uses the %  learned SVM classifier to determine whether the email is Spam or %  Not Spam% Set the file to be read in (change this to spamSample2.txt,% emailSample1.txt or emailSample2.txt to see different predictions on% different emails types). filename = 'spam1.txt';% Read and predictfile_contents = readFile(filename);word_indices  = processEmail(file_contents);x             = emailFeatures(word_indices);p = svmPredict(model, x);fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);fprintf('(1 indicates spam, 0 indicates not spam)\n\n');