function forcasting = predicting3(closeMF,A,VarSF,BSF,FVG,WBS,FLRG,Al,e1)
  forcast=zeros(260,1);
  
    
   
    
    for i=e1:260
         c=1;
         c2=1;
         cc=0;
       flr=zeros(2,9);                                                  %finding corresponding fuzzy set and fuzzy variation group for day t-1
       fuzyA=A(i-1,1);
       fuzyB=BSF(i-1,1);
       var_relations=FVG(fuzyB,:);
       size_=size(var_relations);
       size1=size_(1,2);
       flr2=zeros(2,size1);
       
       sit2=sum(var_relations(:));
       
       if(sit2==0)
           
           prev=0;
            next=0;
             mid=0;
             
              if (fuzyA~=min(A(:)))
                   
                 next= ((Al+((fuzyA+1-1)*200))+100)*0.5;
              
              
              elseif(fuzyA~=max(A(:)))
                  
              prev=((Al+((fuzyA-2)*200))+100)*0.5;
              
              end  
           
                mid=((Al+((fuzyA-1)*200))+100)*1;
                
                
          forcast(i,1)=(next+prev+mid)/2;
          
        
           
       elseif(sit2~=0)
          
       
      
           
            for j=1:size1
           if var_relations(j)>0
               flr2(1,c2)=j;
               flr2(2,c2)=var_relations(j);             %extracting FLRGs from the vector relations into the matrix 'flr' 
               c2=c2+1;
           end
           
       end
       
       c2=c2-1;
       
      semi_pr=zeros(1,c2);
           
        for vr=1:c2
         c=1;   
            
            relations=FLRG(fuzyA,:,flr2(1,vr));               % getting all fuzzy logical relations in the corresponding fuzzy variation group of day t-1
            
      
        
        
        
           
 
       for j=1:9
           if relations(j)>0
               flr(1,c)=j;
               flr(2,c)=relations(j);             %extracting FLRGs from the vector relations into the matrix 'flr' 
               c=c+1;
           end
           
       end
       
       c=c-1;
       
       sit=sum(relations(:));
       
       
      
       cen=zeros(1,c);                      %initializing an matrix
       
       if (sit==0)
           
           prev=0;
            next=0;
             mid=0;
             
              if (fuzyA~=min(A(:)))
                   
                 next= ((Al+((fuzyA+1-1)*200))+100)*0.5;
              
              
              elseif(fuzyA~=max(A(:)))
                  
              prev=((Al+((fuzyA-2)*200))+100)*0.5;
              
              end  
           
                mid=((Al+((fuzyA-1)*200))+100)*1;
                
                
          semi_pr(1,vr)=(next+prev+mid)/2;
           
           
       elseif(sit~=0)
               
               
       
       for j=1:c
           prev=0;
           next=0;                          %finding the centroid of the corresponding fuzzy sets found in flr matrix
           mid=0;
           
          
           
           if (flr(1,j)~=1)
               
           prev=((Al+((flr(1,j)-2)*200))+100)*0.5;      % getting the midpoint of the previous interval and multiplying with 0.5 , 
                                                        %to get the midpoint of any interval use (min+((fuzzyset-1)*200)+100)  
                                                        
                                                        
                                                        
                                                   
           end
           
           if(flr(1,j)~=9)
           next=((Al+((flr(1,j)+1-1)*200))+100)*0.5;    %getting the midpoint of the next interval and multiplying with 0.5 
           end
           
           mid=((Al+((flr(1,j)-1)*200))+100)*1;         %getting the midpoint of the middle interval and multiplying with 1 
           
           cen(1,j)=(prev+mid+next)/2;                  %calculating the centroid 
           
           
       end
       
       fr=0;
       cc=0;
       for j=1:c
           cc=cc+flr(2,j);                                  %finding total number of fuzzy sets in FLRGS ,total number of times they exist
       end
       
       
       
       
       
      for j=1:c
           
       fr=fr+(cen(1,j)*flr(2,j));                          %summing the centroids                                %
      
      end
      
      
      
      semi_pr(1,vr)=fr/cc;                            %dividing the sum by number of fuzzy realtions.
      
      disp(semi_pr(1,vr));  
       end 
       
       
        end
        
        cc3=0;
  for k=1:c2
      cc3=cc3+flr2(2,k);
  end
  
  for k=1:c2
     semi_pr(1,k)=semi_pr(1,k)*flr2(2,k); 
  end
  
    forcast(i,1)=sum(semi_pr(1,:))/cc3;
    
    end %end of sit2 if
    
    
    end
       forcasting=forcast;
       
       
       
       
       
       end