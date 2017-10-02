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
disp(grades);
cell_array={DataHW1,grades'};
celldisp(cell_array);
fprintf('gradeA');
disp(GradeA);
fprintf('gradeB');
index(1)= randomGrade('A' ,grades);
temp = randomGrade('A',grades);
   while( ismember(temp,index))
       temp = randomGrade('A',grades);
   end
   index(2) = temp; 
index(3)= randomGrade('B' ,grades);
index(4)= randomGrade('B' ,grades);
index(5)= randomGrade('C' ,grades);
index(6)= randomGrade('C' ,grades);
index(7)= randomGrade('D' ,grades);
index(8)= randomGrade('D' ,grades);
index(9)= randomGrade('F' ,grades);
index(10)= randomGrade('F' ,grades);
DM= zeros(10:3);
for k=1:10
    id = index(k);
   DM(k,1:3) = DataHW1(id,2:4);
   
end
    Distance = squareform( pdist((DM),'euclidean'));
    DistanceMahal = squareform(pdist(DM,'mahalanobis'));
    Distance(Distance==0)=NaN;
Min = min(Distance);
DistanceMahal(DistanceMahal==0)=NaN;
Minimum=min(DistanceMahal);

        
    