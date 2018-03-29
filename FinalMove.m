function [A2,Whites1,Blacks1,Scounter1]=FinalMove(hObject, Whites, Blacks,modu, A,diff,Fnumber,Snumber,YupMid,YdownMid,SmidX,SmidY,FmidX,FmidY,Scounter)
%Funkcja ktora wykonuje ruchy jak wszystkie pionki sa w domu
[a b]=pol2cart(0:pi/100:2*pi,1);
x=13/6;
Xmiddlesm=[x/2+15,x+1.5+15,x*2.5+15,x*3.5+15,x*4.5+15,x*5.5+15,18.2500,29];
len1=length(Whites);%whites
len2=length(Blacks);%blacks
matm=zeros(1,len1);
matm1=zeros(1,len2);
MidofY = zeros(1,15);


if modu
    if any(A>=Fnumber-Snumber)
        index=find(A>=Fnumber-Snumber);
        for i=1:len1
            Xvar=get(Whites(:,i),'X');
            minm=min(Xvar);
            maxm=max(Xvar);
            middlem=(minm+maxm)/2;
            if any((round(middlem*1e2))/1e2==(round(Xmiddlesm.*1e2))./1e2)
                Yvar=get(Whites(:,i),'Y');
                minYm=min(Yvar);
                maxYm=max(Yvar);
                middleYm=(minYm+maxYm)/2;
                if any(middleYm==YupMid)
                    matm(:,i)=1;
                end
                
        	end
        end
        if length(find(matm==1))==length(matm)
                mat = zeros(1,len1);%Zmienna lokalna-niepotrzebna pozniej
                mat1 = zeros(len1,201);%Zmienna lokalna-niepotrzebna pozniej
                mat2 = zeros(len1,201);%Zmienna lokalna-niepotrzebna pozniej
                for i=1:len1
                    Xvar=get(Whites(:,i),'X');%Zmienna lokalna-niepotrzebna pozniej
                    mat2(i,:)=Xvar;%Zmienna lokalna-niepotrzebna pozniej
                    Min1=min(Xvar);%Zmienna lokalna-niepotrzebna pozniej
                    Max1=max(Xvar);%Zmienna lokalna-niepotrzebna pozniej
                    Middle1=(Min1+Max1)/2;%Zmienna lokalna-niepotrzebna pozniej
                    if (round(Middle1*1e2))/1e2==(round(SmidX*1e2))/1e2 %SmidX
                    	Yvar=get(Whites(:,i),'Y');
                        mat1(i,:)=Yvar;
                        OneVar = max(Yvar);
                        OVar=min(Yvar);
                        Middlev=(OneVar+OVar)/2;
                        mat(:,i)=Middlev;
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
                for j=Whites
                    if get(j,'Y')'==mat1(k,:) & get(j,'X')'==mat2(k,:) 
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
                        set(j,'X',a+29,'Y',b+NewY);
                        uistack(j,'top');
                        if length(index)==2
                            if A(:,1)==A(:,2);
                                A(:,1)=0;
                            elseif A(:,1)~=A(:,2);
                                u=find(min(A(A>0))==A);
                                A(:,u)=0;
                            end
                        elseif length(index)==1
                            A(:,index) = 0;
                        end
                    end
                end
        else
        Scounter=ChangeScounter(Scounter);    
        end   
    else %Gdy liczba oczek sie nie zgadza cofaj licznik
        Scounter=ChangeScounter(Scounter);
        
    end
elseif ~(modu)
    if any(A>=Fnumber-Snumber)
        index=find(A>=abs(Fnumber-Snumber));
        for i=1:len2
            Xvar=get(Blacks(:,i),'X');
            minm=min(Xvar);
            maxm=max(Xvar);
            middlem=(minm+maxm)/2;
            if any((round(middlem*1e2))/1e2==(round(Xmiddlesm.*1e2))./1e2)
                Yvar=get(Blacks(:,i),'Y');
                minYm=min(Yvar);
                maxYm=max(Yvar);
                middleYm=(minYm+maxYm)/2;
                if any(middleYm==YdownMid)
                    matm(:,i)=1;
                end
                
        	end
        end
        if length(find(matm==1))==length(matm)
                mat = zeros(1,len2);%Zmienna lokalna-niepotrzebna pozniej
                mat1 = zeros(len2,201);%Zmienna lokalna-niepotrzebna pozniej
                mat2 = zeros(len2,201);%Zmienna lokalna-niepotrzebna pozniej
                for i=1:len1
                    Xvar=get(Blacks(:,i),'X');%Zmienna lokalna-niepotrzebna pozniej
                    mat2(i,:)=Xvar;%Zmienna lokalna-niepotrzebna pozniej
                    Min1=min(Xvar);%Zmienna lokalna-niepotrzebna pozniej
                    Max1=max(Xvar);%Zmienna lokalna-niepotrzebna pozniej
                    Middle1=(Min1+Max1)/2;%Zmienna lokalna-niepotrzebna pozniej
                    if (round(Middle1*1e2))/1e2==(round(SmidX*1e2))/1e2 %SmidX
                    	Yvar=get(Blacks(:,i),'Y');
                        mat1(i,:)=Yvar;
                        OneVar = max(Yvar);
                        OVar=min(Yvar);
                        Middlev=(OneVar+OVar)/2;
                        mat(:,i)=Middlev;
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

                        for i = 1:len1
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
                        set(j,'X',a+29,'Y',b+NewY);
                        uistack(j,'top');
                        if length(index)==2
                            if A(:,1)==A(:,2)
                                A(:,1)=0;
                            elseif A(:,1)~=A(:,2);
                                u=find(min(A(A>0))==A);
                                A(:,u)=0;
                            end
                        elseif length(index)==1
                            A(:,index) = 0;
                        end
                    end
                end
        else
            Scounter=ChangeScounter(Scounter);
        end   
    else %Gdy liczba oczek sie nie zgadza cofaj licznik
        Scounter=ChangeScounter(Scounter);
        end
    
    end
A2=A;
Whites1=Whites;
Blacks1=Blacks;
Scounter1=Scounter;
end
