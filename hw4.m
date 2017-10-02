
Z = zscore(DataHW1);
rows = size(DataHW1,1);
improved(:,1) = DataHW1(:,1);
improved(:,2:4)= Z(:,2:4);
improved(:,5) = sum(improved(:,2:4),2);
sorted = sortrows(improved,5);
nodata_items = size(sorted,1)/5;
gradesFre = blanks(40); 
gradesFre(1:nodata_items) = 'F';
gradesFre(nodata_items+1:2*nodata_items)='D';
gradesFre(2*nodata_items+1:3*nodata_items) = 'C';
gradesFre(3*nodata_items+1:4*nodata_items)='B';
gradesFre(4*nodata_items+1:5*nodata_items) = 'A';
for j=1:4
    if sorted(j*nodata_items,5) == sorted(j*nodata_items+1,5)
        gradesFre(j*nodata_items) = gradesFre(j*nodata_items+1);
        
    end
end
gradesSorted = blanks(40);
for j=1:40
          temp = sorted(j,1);
          gradesSorted(temp)=gradesFre(j);
          
end
cellarray = {DataHW1(:,1),gradesSorted}
for i=1:40   
fprintf('Student %d is awarded %s\n',DataHW1(i,1),gradesSorted(i));
end
 
DataHW1(:,5)= sum(DataHW1(:, 2:4), 2);
 B = sortrows(DataHW1,5); 
nodata_items = size(B,1)/5;
gradesFre1 = blanks(40); 
gradesFre1(1:nodata_items) = 'F';
gradesFre1(nodata_items+1:2*nodata_items)='D';
gradesFre1(2*nodata_items+1:3*nodata_items) = 'C';
gradesFre1(3*nodata_items+1:4*nodata_items)='B';
gradesFre1(4*nodata_items+1:5*nodata_items) = 'A';
for j=1:4
    if B(j*nodata_items,5) == B(j*nodata_items+1,5)
        gradesFre1(j*nodata_items) = gradesFre1(j*nodata_items+1);
        
    end
end 

gradesSorted1 = blanks(40);
for j=1:40
          temp = B(j,1);
          gradesSorted1(temp)=gradesFre1(j);
          
end

 countA=sum(gradesFre=='A');
 countB=sum(gradesFre=='B');
 countC=sum(gradesFre=='C');
 countD=sum(gradesFre=='D');
 countF=sum(gradesFre=='F');
 %grades=char(grades);
for i=1:40   
fprintf('Student %d is awarded %s\n',i,gradesSorted1(i));
end
happyFreZcore=[];
happyfre=[];
k1=1;k2=1;
for j=1:40
         % temp = B(j,1);
          if gradesSorted1(j) < gradesSorted(j)
              happyfre(k1)= j;
              k1=k1+1;
          elseif gradesSorted1(j)>gradesSorted(j)
              happyFreZscore(k2)= j;
          k2=k2+1;
          end 
end 
