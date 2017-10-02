covMatrix = cov(databank);
D1 = databank(databank(:,5)==1,:);
D2 = databank(databank(:,5)==0,:);
hold on;
scatter(D1(:,1),D1(:,2),'b');

scatter(D2(:,1),D2(:,2),'r');

plot([1,1],[15,-15]);

plot([-8,8],[5,5]);
plot ([-3,-3],[5,15]);
hold off;
r = 1:1372;
training = randperm(1372,800);
trainingData = databank(training,:);
difference = setdiff(r,training);
validation = datasample(difference,200,'Replace',false);
validationData = databank(validation,:);
Testing = setdiff(difference,validation)
TestingData = databank(Testing ,:);
leafSize= [1,2,5,10,15,20,25,30,35,40,45,50];
Vaccuracy = zeros(size(leafSize)); testaccuracy=zeros(size(leafSize));
k=1;
for l = leafSize
ctree =fitctree(trainingData(:,1:4),trainingData(:,5),'MinLeafSize',l);
%view(ctree,'mode','graph');
testclassify = predict(ctree,TestingData(:,1:4));
actualTest = TestingData(:,5);
ValidateClassify = predict(ctree,validationData(:,1:4));
actualValidate = validationData(:,5);
[C,order] = confusionmat(actualTest,testclassify);
TN = C(1,1); FP = C(1,2); FN = C(2,1); TP= C(2,2);
testAccuracy = (TN+TP)/(TN+TP+FP+FN);
[C1,order1] = confusionmat(actualValidate,ValidateClassify);
TN1 = C1(1,1); FP1 = C1(1,2); TP1 = C1(2,2); FN1 = C1(2,1);
validateAccuracy = (TN1+TP1)/(TN1+TP1+FP1+FN1);
testaccuracy(k) = testAccuracy;
Vaccuracy(k) = validateAccuracy;
k=k+1;

end
figure 
plot(leafSize,testaccuracy); 
figure
plot(leafSize,Vaccuracy); 

leafSize = 10;

ctreeselected =fitctree(trainingData(:,1:4),trainingData(:,5),'MinLeafSize',leafSize);
view(ctreeselected,'mode','graph');
Classified = predict(ctreeselected,TestingData(:,1:4));
actualTestdata = TestingData(:,5);
[ConfusionMatrix,orderMatrix] = confusionmat(actualTest,testclassify);
TrueNegative = ConfusionMatrix(1,1); FalsePositive = ConfusionMatrix(1,2); FalseNegative = ConfusionMatrix(2,1); TruePositive= ConfusionMatrix(2,2);
Accuracy = (TruePositive+TrueNegative)/(TruePositive+TrueNegative+FalsePositive+FalseNegative);
RecallClass1 = TruePositive/(TruePositive+FalseNegative) ;
RecallClass0 = TrueNegative/(TrueNegative+FalsePositive);
precisionClass1 = TruePositive/(TruePositive+FalsePositive);
presicionClass0 = TrueNegative/(TrueNegative+FalseNegative);

