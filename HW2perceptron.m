net = perceptron;
net.trainparam.epochs = 50;
net = train(net, databank(:,1:2)', databank(:,5)')
weights = net.iw{1,1}
bias = net.b{1}
hold on;
Data10 = databank(databank(:,5)==1,:);
Data11 = databank(databank(:,5)==0,:);
scatter(Data10(:,1),Data10(:,2),'k')
scatter(Data11(:,1),Data11(:,2),'r')
x = [-5:5];
y = (weights(1)*x + bias)/weights(2);
plot(x,y)
hold off;
a = net(databank(:,1:2)');
sum(databank(:,5) ~= a(:))