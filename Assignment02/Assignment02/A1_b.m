fid = fopen('NIST_Filip_trim.txt','r'); 
x = zeros(82,1); 
y = zeros(82,1); 
yy = zeros(82,2); 
ii = 0; 
while ~feof(fid) 
    ii=ii+1; 
    tline = fgetl(fid); 
    % code to format/store tline 
    AAA = sscanf(tline,'%f %f'); 
    yy(ii,1)= AAA(1,1); 
    yy(ii,2)= AAA(2,1); 
 %   fprintf(' ii=%i y= %f x= %f \n',ii,yy(ii,1),yy(ii,2)) 
end 
fclose(fid); 

sorted_data = sortrows(yy,1); 
x = sorted_data(:,2);
y = sorted_data(:,1);

x = (x - min(x)) / (max(x) - min(x)) * 2 - 1;
y = (y - min(y)) / (max(y) - min(y)) * 2 - 1;

figure
plot(x,y,'.');
xlabel('x');
ylabel('y');
title('Sorted data plot');