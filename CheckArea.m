function y=CheckArea(hObject,modu,Whites,Blacks,Scounter,SmidX,SmidY)
%funkcja sprawdza czy na wybranym przez nas polu znajduje sie jakikolwiek z
%naszych pionkow
mat = zeros(1,15);%Zmienna lokalna-potrzebna tylko do policzenia middle
mat1 = zeros(15,201);
mat2 = zeros(15,201);
MidofY=zeros(1,15);
MidofY1=zeros(1,15);
len1=length(Whites);
len2=length(Blacks);
if modu %Biale
        for i = 1:len1 %sprawdzam czy nie ma czarnych
                varX = get(Whites(:,i),'X');
                mat2(i,:)=varX;
                Min1=min(varX);
                Max1=max(varX);
                Middle1=(Min1+Max1)/2;
                if (round(Middle1*1e3))/1e3==(round(SmidX*1e3))/1e3 
                    varY = get(Whites(:,i),'Y');
                    mat2(i,:)=varY;
                    Min11=min(varY);
                    Max11=max(varY);
                    Middle11=(Min11+Max11)/2;
                    if any(Middle11==SmidY)
                        MidofY(:,i)=Middle11;
                    end
                end
        end
        if any(MidofY)
            y=Scounter;
        else
            y=Scounter-1;
        end
elseif ~(modu) %Czarne
            for i = 1:len2
                varX = get(Blacks(:,i),'X');
                mat2(i,:)=varX;
                Min1=min(varX);
                Max1=max(varX);
                Middle1=(Min1+Max1)/2;
                if (round(Middle1*1e3))/1e3==(round(SmidX*1e3))/1e3 
                    varY = get(Blacks(:,i),'Y');
                    mat2(i,:)=varY;
                    Min11=min(varY);
                    Max11=max(varY);
                    Middle11=(Min11+Max11)/2;
                    if any(Middle11==SmidY)
                       MidofY1(:,i)=Middle11;
                    end
                end
            end
        if any(MidofY1)
            y=Scounter;
        else
            y=Scounter-1;
        end 
                end
            
end
