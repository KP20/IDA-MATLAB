function index = randomGrade(X ,grades)
                 
                 idx = randi(40);
                 
                  if grades(idx)== X 
                      index = idx;
                  else
                    index= randomGrade(X,grades);
                  end  
end
