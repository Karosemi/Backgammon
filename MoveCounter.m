function [A1,Whites1,Blacks1,Scounter1]=MoveCounter(hObject,diff,A,modu,Fnumber,Snumber,Blacks,Whites,FmidX,FmidY,SmidX,SmidY,YdownMid,YupMid,Scounter)
%Funckja przesuwa pionek
    [a b]=pol2cart(0:pi/100:2*pi,1);
    if any(diff==A)%diff zmienna globalna
        mat = zeros(1,15);
        mat1 = zeros(15,201);
        mat2 = zeros(15,201);
        index=find(diff==A);
        
        len1=length(Whites);
        len2=length(Blacks);
        MidofY = zeros(1,15);
        if modu %Biale
            if Fnumber-Snumber>0;
            for i = 1:len2 %sprawdzam czy nie ma czarnych
                varX = get(Blacks(:,i),'X');
                mat2(i,:)=varX;
                Min1=min(varX);
                Max1=max(varX);
                Middle1=(Min1+Max1)/2;
                if (round(Middle1*1e3))/1e3==(round(FmidX*1e3))/1e3 
                    varY = get(Blacks(:,i),'Y');
                    mat2(i,:)=varY;
                    Min11=min(varY);
                    Max11=max(varY);
                    Middle11=(Min11+Max11)/2;
                    if any(Middle11==FmidY)
                        MidofY(:,i)=Middle11;
                    end
                end
            end
            Yarea=length(find(MidofY~=0));
            if Yarea==0 %Tutaj wykona proces przesuwania
                mat = zeros(1,15);
                mat1 = zeros(15,201);
                mat2 = zeros(15,201);
                for i=1:len1
                    Xvar=get(Whites(:,i),'X');
                    mat2(i,:)=Xvar;
                    Min1=min(Xvar);
                    Max1=max(Xvar);
                    Middle1=(Min1+Max1)/2;
                    if (round(Middle1*1e3))/1e3==(round(SmidX*1e3))/1e3 %SmidX
                    	Yvar=get(Whites(:,i),'Y');
                        mat1(i,:)=Yvar;
                        OneVar = max(Yvar);
                        OVar=min(Yvar);
                        Middlev=(OneVar+OVar)/2;
                        if any(Middlev==SmidY);
                            B=(Middlev==YdownMid);
                            D=(Middlev==YupMid);
                            if any(B);
                                mat(:,i)=Middlev;
                                final=max(mat);
                            end
                        if any(D)
                        mat(:,i)=Middlev;
                        final=min(mat(mat>0));
                    
                        
                        end
                        end
        
        
                    end
                end
                k=find(mat==final);
                for j=Whites
                    if get(j,'Y')'==mat1(k,:) & get(j,'X')'==mat2(k,:) ;
                        newObject = find(i==Whites);
                        mat = zeros(1,15);
                        mat1 = zeros(15,201);
                        mat2 = zeros(15,201);

                        for i = 1:len1
                            varX = get(Whites(:,i),'X');
                            mat2(i,:)=varX;
                            Min1=min(varX);
                            Max1=max(varX);
                            Middle1=(Min1+Max1)/2;
                            if (round(Middle1*1e3))/1e3==(round(FmidX*1e3))/1e3 
                            	varY = get(Whites(:,i),'Y');
                                mat2(i,:)=varY;
                                Min11=min(varY);
                                Max11=max(varY);
                                Middle11=(Min11+Max11)/2;
                                if any(Middle11==FmidY)
                                   MidofY(:,i)=Middle11;
                                end
                            end
                        end
                        if any(1==FmidY)
                            YvariableF= max(MidofY);
                        else
                            YvariableF= min(MidofY(MidofY>0));
                        end
                        if any(MidofY)
                            newindex=find(FmidY==YvariableF)+1;
                            NewY=FmidY(:,newindex);
                        else
                            NewY=FmidY(:,1);
                        end
                        set(j,'X',a+FmidX,'Y',b+NewY);
                        uistack(j,'top');
                        if length(index)==2;
                            A(:,1)=0;
                        elseif length(index)==1;
                            A(:,index) = 0;
                        end
                    end
                end
            else 
                Scounter=ChangeScounter(Scounter);
            end
            else
                Scounter=ChangeScounter(Scounter);
            end
        elseif ~(modu) %Czarne
            if Fnumber-Snumber<0;
            for i = 1:len1;
                varX = get(Whites(:,i),'X');
                mat2(i,:)=varX;
                Min1=min(varX);
                Max1=max(varX);
                Middle1=(Min1+Max1)/2;
                if (round(Middle1*1e3))/1e3==(round(FmidX*1e3))/1e3 
                    varY = get(Whites(:,i),'Y');
                    mat2(i,:)=varY;
                    Min11=min(varY);
                    Max11=max(varY);
                    Middle11=(Min11+Max11)/2;
                    if any(Middle11==FmidY)
                        MidofY(:,i)=Middle11;
                        
                    end
                end
            end
            Yarea=length(find(MidofY~=0));
            if Yarea==0 %Tutaj wykona proces usuwania
                mat = zeros(1,15);
                mat1 = zeros(15,201);
                mat2 = zeros(15,201);
                for i=1:len2
                    Xvar=get(Blacks(:,i),'X');
                    mat2(i,:)=Xvar;
                    Min1=min(Xvar);
                    Max1=max(Xvar);
                    Middle1=(Min1+Max1)/2;
                    if (round(Middle1*1e3))/1e3==(round(SmidX*1e3))/1e3 %SmidX
                    	Yvar=get(Blacks(:,i),'Y');
                        mat1(i,:)=Yvar;
                        OneVar = max(Yvar);
                        OVar=min(Yvar);
                        Middlev=(OneVar+OVar)/2;
                        if any(Middlev==SmidY)
                            B=(Middlev==YdownMid);
                            D=(Middlev==YupMid);
                        if any(B)
                            mat(:,i)=Middlev;
                            final=max(mat);
                        end
                        if any(D)
                        mat(:,i)=Middlev;
                        final=min(mat(mat>0));
                    
                        
                        end
                        end
        
        
                    end
                end
                k=find(mat==final);
                for j=Blacks
                    if get(j,'Y')'==mat1(k,:) & get(j,'X')'==mat2(k,:) 
                        newObject = find(i==Blacks);
                        mat = zeros(1,15);
                        mat1 = zeros(15,201);
                        mat2 = zeros(15,201);

                        for i = 1:len2
                            varX = get(Blacks(:,i),'X');
                            mat2(i,:)=varX;
                            Min1=min(varX);
                            Max1=max(varX);
                            Middle1=(Min1+Max1)/2;
                            if (round(Middle1*1e3))/1e3==(round(FmidX*1e3))/1e3 
                            	varY = get(Blacks(:,i),'Y');
                                mat2(i,:)=varY;
                                Min11=min(varY);
                                Max11=max(varY);
                                Middle11=(Min11+Max11)/2;
                                if any(Middle11==FmidY)
                                   MidofY(:,i)=Middle11;
                                end
                            end
                        end
                        if any(1==FmidY);
                            YvariableF= max(MidofY);
                        else
                            YvariableF= min(MidofY(MidofY>0));
                        end
                        if any(MidofY)
                            newindex=find(YvariableF==FmidY)+1;
                            NewY=FmidY(:,newindex);
                        else
                            NewY=FmidY(:,1);
                        end
                        set(j,'X',a+FmidX,'Y',b+NewY);
                        uistack(j,'top');
                        if length(index)==2
                            A(:,1)=0;
                        elseif length(index)==1
                            A(:,index) = 0;
                        end
                    end
                end
            else 
                Scounter=ChangeScounter(Scounter);
            end
            else
                Scounter=ChangeScounter(Scounter);
            end
            end
    

                    
            
            
    else
        Scounter=ChangeScounter(Scounter);%jezeli liczba oczek sie nie zgadza przelicznik
                                                         %zwraca mozliwosc
                                                         %ponownego
                                                            %wybrania pol do
    end
    A1 = A;
    Whites1=Whites;
    Blacks1=Blacks;
    Scounter1=Scounter;
end