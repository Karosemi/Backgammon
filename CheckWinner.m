function y=CheckWinner(modu,Whites,Blacks)
%Funkcja sprawdza czy wszystkie pionki sa w dworze
Check=zeros(1,length(Whites));
Check1=zeros(1,length(Blacks));
    switch modu
        case 1
        for i=1:length(Whites);
            Xvar=get(Whites(:,i),'X');
            maxX=max(Xvar);
            if maxX==30;
                Check(:,i)=1;
            end
        end
            y=(length(find(Check==1))==length(Whites));
        case 0
           for i=1:length(Blacks);
                Xvar=get(Blacks(:,i),'X');
                maxX=max(Xvar);
                if maxX==30;
                    Check1(:,i)=1;
                end
            end
            y=(length(find(Check1==1))==length(Blacks));
       
    end
end