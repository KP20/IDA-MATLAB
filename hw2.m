DataHW1(:,5)= sum(DataHW1(:, 2:4), 2);
minimumVal = min(DataHW1(:,5));
maximumVal = max(DataHW1(:,5));
width = (maximumVal-minimumVal)/5;
disp(width);
grades = blanks(40);
GradeA = 0;
GradeB = 0;
GradeC = 0;
GradeD = 0; 
GradeF = 0;
for i=1:40
    if DataHW1(i,5) >= maximumVal - width 
        grades(i) = 'A';
       GradeA = GradeA+1;
         elseif DataHW1(i,5) >= maximumVal - 2*width && DataHW1(i,5) < maximumVal - width
            grades(i)='B'; 
            GradeB=GradeB+1;
            
         elseif DataHW1(i,5) >= maximumVal - 3*width && DataHW1(i,5) < maximumVal - 2*width
            grades(i)='C';
           GradeC = GradeC+1;
         elseif DataHW1(i,5) >= maximumVal - 4*width && DataHW1(i,5) < maximumVal - 3*width
            grades(i)='D';
           GradeD= GradeD+1;
         elseif DataHW1(i,5) >= maximumVal - 5*width && DataHW1(i,5) < maximumVal - 4*width
            grades(i)='F';
           GradeF= GradeF+1;
    end 
end
 B = sortrows(DataHW1,5); 
nodata_items = size(B,1)/5;
gradesFre = blanks(40); 
gradesFre(1:nodata_items) = 'F';
gradesFre(nodata_items+1:2*nodata_items)='D';
gradesFre(2*nodata_items+1:3*nodata_items) = 'C';
gradesFre(3*nodata_items+1:4*nodata_items)='B';
gradesFre(4*nodata_items+1:5*nodata_items) = 'A';
for j=1:4
    if B(j*nodata_items,5) == B(j*nodata_items+1,5)
        gradesFre(j*nodata_items) = gradesFre(j*nodata_items+1);
        
    end
end 
happywidth=[];
happyfre=[];
k1=1;k2=1;
for j=1:40
          temp = B(j,1);
          if grades(temp) < gradesFre(j)
              happywidth(k1)= temp;
              k1=k1+1;
          elseif grades(temp)>gradesFre(j)
              happyFre(k2)= temp;
          k2=k2+1;
          end 
end
 countA=sum(gradesFre=='A');
 countB=sum(gradesFre=='B');
 countC=sum(gradesFre=='C');
 countD=sum(gradesFre=='D');
 countF=sum(gradesFre=='F');
 grades=char(grades);
for i=1:40   
fprintf('Student %d is awarded %s\n',B(i,1),gradesFre(i));
end
    

