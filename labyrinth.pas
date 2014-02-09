Program Labyrinth;
Uses WinCRT,WinDOS;
{arxikopoiisi twn sinartisewn gia na min dimiourgithoun provlimata otan kalestoun}
Function IntToStr (I:Integer):String;
Forward;
Procedure swap_ints(Var int1:Integer;Var int2:Integer);
Forward;
Procedure BestScores(sc1,sc2,sc3,sc4,sc5:integer);
Forward;
Procedure NextLevel(Var HUD:Boolean);
Forward;
Function totaltime(time,time2,h,m,s,hund,h2,m2,s2,year,month,day,year2,month2,day2:word):Integer;
Forward;
Procedure FormatScore (Var sc:integer;Var s_temp:string);
Forward;
Procedure xartis(Level:string;Var Q:Boolean);
Forward;
Procedure LoadScore (Level:String;Var sc1,sc2,sc3,sc4,sc5:integer);
Forward;
Procedure grapse(keimeno:String; HUD:Boolean;coo_a,coo_b:ShortInt);
Forward;
Procedure RT_BS(Level:string;Q:Boolean;sc1,sc2,sc3,sc4,sc5:integer);
Forward;
	
Function IntToStr (I:Integer):String;{metatropi akeraiou se alfarithmitikou}
Var
	S:String;
Begin
	Str(I,S);
	IntToStr := S;
End;

Procedure swap_ints(Var int1:Integer;Var int2:Integer);{enalagi akeraiwn}
Var
	temp:Integer;
Begin
	temp := int1;
	int1 := int2;
	int2 := temp;
End;

Procedure grapse(keimeno:String; HUD:Boolean;coo_a,coo_b:ShortInt); {Epilogi an tha graftei to keimeno i oxi}
Var
	keimeno_length:Integer;
Begin
	if (HUD) then
		begin
			CursorTo(coo_a,coo_b);
			write(keimeno);
		end
	else
		begin
		keimeno_length := Length(keimeno);
		CursorTo(coo_a,coo_b);
		write(' ':keimeno_length);
		end;
End;

Procedure RT_BS(Level:string;Q:Boolean;sc1,sc2,sc3,sc4,sc5:integer);{I emfanisi tou high score real time}
Var
	s_temp:string;
Begin
	grapse('Level ' + Level,Q,65,1);
	grapse('High Scores:',Q,65,3);
	CursorTo(67,4);
	if sc1=0 then
		begin
			grapse('-',Q,67,4);
		end
	else
		begin
			s_temp:=IntToStr(sc1);
			grapse(s_temp,Q,67,4);
		end;
	if sc2=0 then
		begin
			grapse('-',Q,67,5);
		end
	else
		begin
			s_temp:=IntToStr(sc2);
			grapse(s_temp,Q,67,5);
		end;
	if sc3=0 then
		begin
			grapse('-',Q,67,6);
		end
	else
		begin
			s_temp:=IntToStr(sc3);
			grapse(s_temp,Q,67,6);
		end;
	CursorTo(67,7);
	if sc4=0 then
		begin
			grapse('-',Q,67,7);
		end
	else
		begin
			s_temp:=IntToStr(sc4);
			grapse(s_temp,Q,67,7);
		end;
	CursorTo(67,8);
	if sc5=0 then
		begin
			grapse('-',Q,67,8);
		end
	else
		begin
			s_temp:=IntToStr(sc5);
			grapse(s_temp,Q,67,8);
		end;
	grapse('Current time: ',Q,65,10);
End;

Procedure BestScores(sc1,sc2,sc3,sc4,sc5:integer);{emfanisi twn skor kata ton termatismo tou lvl}
Begin
	writeln;
	writeln('High scores:');
	writeln;
	if (sc1=000) then
		begin
			writeln('1==>---');
		end
	else
		begin
			writeln('1==>',sc1);
		end;
	if (sc2=000) then
		begin
			writeln('2==>---');
		end
	else
		begin
			writeln('2==>',sc2);
		end;
	if (sc3=000) then
		begin
			writeln('3==>---');
		end
	else
		begin
			writeln('3==>',sc3);
		end;
	if (sc4=000) then
		begin
			writeln('4==>---');
		end
	else
		begin
			writeln('4==>',sc4);
		end;
	if (sc5=000) then
		begin
			writeln('5==>---');
		end
	else
		begin
			writeln('5==>',sc5);
		end;
	writeln;
End;

Procedure NextLevel(Var HUD:boolean);{anamoni mexri na patithei to enter kai activate/deactivate HUD}
Var
	x:char;
Begin
	x := '1';
	Repeat 
		if (keypressed) then
			begin
				x :=(readkey);
				if (x='Q') OR (x='q') then
					begin
						if HUD=True then
							begin
								HUD:=False;
							end
						else
							begin
								HUD:=True;
							end;
					end;
			end;
	until (ord(x) = 13);
End;

Procedure LoadScore (Level:String;Var sc1,sc2,sc3,sc4,sc5:integer);{fortwsi apo to arxeio twn hight scores}
Var
	BestTimes:file of char;{arxeio xronou}
	c_temp:char;
	s_temp:string;
	j:integer; {den xerw ti kanei to Val alla etsi elege to help file. Einai to mono pou den skerw ton logo iparksis tou}
Begin
	assign (BestTimes, './Times/sc' + Level + '.bs');
	reset (BestTimes);
	Seek (BestTimes,0);
	Read(BestTimes, c_temp);
	s_temp := c_temp;
	Seek (BestTimes,1);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Seek (BestTimes,2);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Val(s_temp,sc1,j);
	Seek (BestTimes,3);
	Read(BestTimes, c_temp);
	s_temp := c_temp;
	Seek (BestTimes,4);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Seek (BestTimes,5);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Val(s_temp,sc2,j);
	Seek (BestTimes,6);
	Read(BestTimes, c_temp);
	s_temp := c_temp;
	Seek (BestTimes,7);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Seek (BestTimes,8);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Val(s_temp,sc3,j);
	Seek (BestTimes,9);
	Read(BestTimes, c_temp);
	s_temp := c_temp;
	Seek (BestTimes,10);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Seek (BestTimes,11);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Val(s_temp,sc4,j);
	Seek (BestTimes,12);
	Read(BestTimes, c_temp);
	s_temp := c_temp;
	Seek (BestTimes,13);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Seek (BestTimes,14);
	Read(BestTimes, c_temp);
	s_temp := s_temp + c_temp;
	Val(s_temp,sc5,j);
	Close(BestTimes);
End;

Function totaltime(time,time2,h,m,s,hund,h2,m2,s2,year,month,day,year2,month2,day2:word):Integer;{ipologismos xronou}
Const
	daytime = 86400; {giati na vlepoume sinexeia 86400???}
Var
	i,j,ii :integer;{to ii den ipirxe prin me rwtisei o Zaharias pws ginetai o ipologismos tou xronou. Ty :)}
Begin
	if (year<>year2) then {se periptwsi diaforas xronou}
		begin
			j := 0; {meres pou perilamvanontai}
			for i:=year to year2 do
				begin
					if (i=year) then {ipologismos tis periptwsis o xronos na einai kai o arxikos}
						begin
							for ii:=month to 12 do
								begin
									if (ii=1)or(ii=3)or(ii=5)or(ii=7)or(ii=8)or(ii=10)or(ii=12) then
										begin
											if (ii = month) then {ipologismos tou minos ap'opou arxizei i metrisi}
												begin
													j := j + (31 - day);
												end
											else
												begin
													j := j + 31;
												end;
										end;
									if (ii=2) then
										begin
											if (ii=month) then {to idio me to parapanw}
												begin
													j := j + (28 - day);
												end
											else
												begin
													j := j + 28;
												end;
										end;
									if (ii=4)or(ii=6)or(ii=9)or(ii=11) then
										begin
											if (ii = month) then {ipologismos tou minos ap'opou arxizei i metrisi}
												begin
													j := j + (30 - day);
												end
											else
												begin
													j := j + 30;
												end;
										end;
								end;
						end
					else if (i=year2) then {ipologismos tis periptwsis na einai o teleftaios xronos}
						begin
							for ii:=1 to month2 do
								begin
									if (ii=1)or(ii=3)or(ii=5)or(ii=7)or(ii=8)or(ii=10)or(ii=12) then
										begin
											if (ii = month2) then {ipologismos tou minos pou teleiwnei i metrisi}
												begin
													j := j + (day2 -1);
												end
											else
												begin
													j := j + 31;
												end;
										end;
									if (ii=2) then
										begin
											if (ii = month2) then
												begin
													j := j + (day2 -1);
												end
											else
												begin
													j := j + 28;
												end;
										end;
									if (ii=4)or(ii=6)or(ii=9)or(ii=11) then
										begin
											if (ii = month2) then
												begin
													j := j + (day2 -1);
												end
											else
												begin
													j := j + 30;
												end;
										end;
								end;
						end
					else {olos o xronos}
						begin
							j := j + 365;
						end;
				end;
		time := (daytime - time) + (j*daytime) + time2;
		end
	else if (month<>month2) then {ipologismos se periptwsi diaforas minwn}
		begin
			j := 0; {meres twn minwn pou perilamvanontai}
			for i:=month to month2 do {idios logos me ton xrono parapanw. To idio kai ta ipoloipa}
				begin
					if (i=1)or(i=3)or(i=5)or(i=7)or(i=8)or(i=10)or(i=12) then
						begin
							if (i = month) then
								begin
									j := j + (31 - day);
								end
							else if (i = month2) then
								begin
									j := j + (day2 -1);
								end
							else
								begin
									j := j + 31;
								end;
						end;
					if (i=2) then
						begin
							if (i=month) then
								begin
									j := j + (28 - day);
								end
							else if (i = month2) then
								begin
									j := j + (day2 -1);
								end
							else
								begin
									j := j + 28;
								end;
						end;
					if (i=4)or(i=6)or(i=9)or(i=11) then
						begin
							if (i = month) then
								begin
									j := j + (30 - day);
								end
							else if (i = month2) then
								begin
									j := j + (day2 -1);
								end
							else
								begin
									j := j + 30;
								end;
						end;
				end;
			time := (daytime - time) + (j*daytime) + time2;
		end
	else if (day<>day2) then{ipologismos diaforas imeras}
		begin
			time2 := (daytime - time) + time2 + (day2 - day)*daytime;
		end
	else{ipologismos diaforas wrwn}
		begin
			time2 := h2*3600 + m2*60+s2;
			time := time2 - time;
		end;
		totaltime := time;
End;

Procedure FormatScore (Var sc:integer;Var s_temp:string);{metatropi arithmou se alfarithmitiko}
Begin
	if sc<10 then
		begin
			s_temp := '0'+'0'+(IntToStr(sc));
		end
	else if sc<100 then
		begin
			s_temp := '0'+(IntToStr(sc));
		end
	else
		begin
			s_temp := (IntToStr(sc));
		end;
End;

Procedure xartis(Level:string; Var Q:boolean);{emfanisi tou xarti kai den simmazeuetai........}
Var
	epipedo:array[1..22,1..60] of char; {trexon xartis}
	x :array[1..2] of integer; {i thesi tou paikti}
	filein1:file of char; {arxeia xartwn}
	s_temp:string;
	Q_temp:boolean;
	BestTimes2 :text; {xrisi stin apothikeusi twn apotelesmatwn}
    time3,time_temp,i,j,time,time2,sc1,sc2,sc3,sc4,sc5:integer;{epanalipseis, apothikefsi xronou, xronoi}
	n:longint; {seek}
	x_temp : char; {to pliktro pou patithike(sinithos)}
	h,m,s,hund,h2,m2,s2,year,month,day,dayofweek,year2,month2,day2:word; {h,m,s,mera}
Begin
	assign (filein1, './Levels/level' + Level + '.lvl');{fortwsi tou xarti}
	reset (filein1);
	n:= 0;
	
	For i:=1 to 22 do
		begin
			For j:=1 to 60 do
				begin
					Seek(filein1, n);
					Read(filein1, epipedo[i,j]);
					n := n+1;
				end;
		end;
	x[1] := 11;
	x[2] := 30;
	epipedo[x[1],x[2]] := '@';
	Close (filein1);{kleisimo tou arxeiou tou xarti}
	clrscr;
	
	For i:=1 to 22 do{ektipwsi tou xarti, anathema tin wra kai tin stigmi pou xalasa gia na vrw pws ginetai swsta}
		begin
			For j:=1 to 60 do
				begin
					CursorTo(j,i);
					write(epipedo[i,j]);
				end;
		end;
	LoadScore (Level,sc1,sc2,sc3,sc4,sc5);{fortwsi twn skor}
	RT_BS(Level,Q,sc1,sc2,sc3,sc4,sc5);{emfanisi tou Live skor}
	GetTime(h,m,s,hund);
	GetDate(year, month, day, dayofweek);
	time := h*3600 + m*60+s;
	time3 := 0;
	time_temp := time3;
	s_temp:=IntToStr(time_temp);
	grapse(s_temp,Q,67,11);
		
	Repeat {kinisi}
		x_temp := '0';{reset tou x_temp}
		if (keypressed) then
			begin
				x_temp := readkey;
				if (x_temp = 'a') OR (x_temp = 'A') then {aristera}
					begin
						if epipedo[x[1],x[2] - 1] <> '*' then
							begin
								CursorTo(x[2],x[1]);
								write(' ');{svisimo tou prwtagwnisti mas}
								x[2] := x[2] - 1;
							end;
					end
				else if (x_temp = 's') OR (x_temp = 'S') then {katw}
					begin
						if epipedo[x[1] + 1,x[2]] <> '*' then
							begin
								CursorTo(x[2],x[1]);
								write(' ');
								x[1] := x[1] + 1;
							end;
					end
				else if (x_temp = 'd') OR (x_temp = 'D') then {deksia}
					begin
						if epipedo[x[1] ,x[2] + 1] <> '*' then
							begin
								CursorTo(x[2],x[1]);
								write(' ');
								x[2] := x[2] + 1;
							end;
					end
				else if (x_temp = 'w') OR (x_temp = 'W') then {panw}
					begin
						if epipedo[x[1] - 1,x[2]] <> '*' then
							begin
								CursorTo(x[2],x[1]);
								write(' ');
								x[1] := x[1] - 1;
							end;
					end
				else if (x_temp = 'q') OR (x_temp = 'Q') then {HUD}
					begin
						if Q=True then
							begin
								Q:=False;
							end
						else
							begin
								Q:=True;
							end;
					end;
				CursorTo(x[2],x[1]);
				write('@');{egwwwwwwwwwwwwww}
				GetTime(h2,m2,s2,hund);
				GetDate(year2, month2, day2, dayofweek);
				time2 := h2*3600 + m2*60+s2;
				time3 := totaltime(time,time2,h,m,s,hund,h2,m2,s2,year,month,day,year2,month2,day2);
			end
		else {Real Time metrisi xronou, to kanei kai stin proigoumeni epanalipsi}
			begin
				GetTime(h2,m2,s2,hund);
				GetDate(year2, month2, day2, dayofweek);
				time2 := h2*3600 + m2*60+s2;
				time3 := totaltime(time,time2,h,m,s,hund,h2,m2,s2,year,month,day,year2,month2,day2);
			end;
		if (time_temp<>time3) then{kataxwrisi xronou sto time_temp gia siggrisi}
			begin
				time_temp:=time3;
				grapse('Current time:',Q,65,10);
				s_temp:= IntToStr(time_temp);
				grapse(s_temp,Q,67,11);
			end;
		if (Q<>Q_temp) then{fortwnetai i allagi tou HUD}
			begin
				Q_temp:=Q;
				grapse('Current time:',Q,65,10);
				s_temp:= IntToStr(time_temp);
				grapse(s_temp,Q,67,11);
				RT_BS(Level,Q,sc1,sc2,sc3,sc4,sc5);
			end;
	Until (x[1] = 1) OR (x[1] = 22) OR (x[2] = 1) OR (x[2] = 60);
	GetTime(h2,m2,s2,hund);
	GetDate(year2, month2, day2, dayofweek);
	time2 := h2*3600 + m2*60+s2;
	clrscr;
	
	time := totaltime(time,time2,h,m,s,hund,h2,m2,s2,year,month,day,year2,month2,day2);
	writeln('Congratulations, you finished level ' + Level + ', within ',time,' seconds.');
	
	LoadScore (Level,sc1,sc2,sc3,sc4,sc5);{fortwsi kai pali ton skor}
	
	If ((time<sc5) or (sc5=000))and(time<999) then {apothikefsi tou xronou kai emfanisi tou}
		begin
			sc5 := time;
		end
	else
		begin
			writeln('Your score is too low to be stored as a high score');
		end;
	if (sc5<sc4) or (sc4=000) then{oi arxikes times einai 000}
		begin
			swap_ints(sc5,sc4);
		end;
	if (sc4<sc3) or (sc3=000) then
		begin
			swap_ints(sc4,sc3);
		end;
	if (sc3<sc2) or (sc2=000) then
		begin
			swap_ints(sc3,sc2);
		end;
	if (sc2<sc1) or (sc1=000) then
		begin
			swap_ints(sc2,sc1);
		end;
	BestScores(sc1,sc2,sc3,sc4,sc5);{twra pou termatisame na min doume kai ta nea high scores?}
	
	assign (BestTimes2, './Times/sc' + Level + '.bs');{xwsta kai ston arxeio twra}
	rewrite(BestTimes2);
	FormatScore(sc1,s_temp);
	write(BestTimes2, s_temp);
	FormatScore(sc2,s_temp);
	write(BestTimes2, s_temp);
	FormatScore(sc3,s_temp);
	write(BestTimes2, s_temp);
	FormatScore(sc4,s_temp);
	write(BestTimes2, s_temp);
	FormatScore(sc5,s_temp);
	write(BestTimes2, s_temp);
	Close (BestTimes2);
End;

Var
	Level : String;
	Q:boolean; {HUD}
	
BEGIN{kapou edw arxizoyme}
	writeln('Labyrinth v1.2');
	Q:=True;
	writeln;
	writeln('To move through the labyrinth use the keys:');
	CursorTo(41,4);
	write('W (up)');
	CursorTo(35,5);
	write('A (left)');
	CursorTo(45,5);
	write('D (right)');
	CursorTo(40,6);
	write('S (down)');
	CursorTo(0,8);
	write('You can activate\deactivate HUD with the Q');
	CursorTo(0,10);
	Level := '1';
	write('To continue to level ' + Level + ' press Enter...');
	NextLevel(Q);
	xartis(Level,Q);
	Level := '2';
	write('To continue to level ' + Level + ' press Enter...');
	NextLevel(Q);
	xartis(Level,Q);
	Level := '3';
	write('To continue to level ' + Level + ' press Enter...');
	NextLevel(Q);
	xartis(Level,Q);
	Level := '4';
	write('To continue to level ' + Level + ' press Enter...');
	NextLevel(Q);
	xartis(Level,Q);
	Level := '5';
	write('To continue to level ' + Level + ' press Enter...');
	NextLevel(Q);
	xartis(Level,Q);
	write('You have completed all levels. Press Enter to see credits.');
	NextLevel(Q);
	clrscr;
	CursorTo(34,0);
	write('CREDITS');{ta efsima ma mou ston sef, pou lene. Exoume kai kapoion egwismo}
	CursorTo(35,2);
	write('Idea');
	CursorTo(30,3);
	write('Sagiakos Giorgos');
	CursorTo(32,5);
	write('Game Design');
	CursorTo(28,6);
	write('Egarhos Konstantinos');
	CursorTo(32,8);
	write('Level Design');
	CursorTo(28,9);
	write('Egarhos Konstantinos');
	CursorTo(32,5);
	write('Programming');
	CursorTo(28,6);
	write('Egarhos Konstantinos');
	CursorTo(34,11);
	write('Music');
	CursorTo(31,12);
	write('What music?');
	CursorTo(33,14);
	write('Artworks');
	CursorTo(34,15);
	write('Huh?');
	CursorTo(29,17);
	write('Many thanks to');
	CursorTo(21,18);
	write('My mother who tolerated me (so far)');
	CursorTo(21,19);
	write('My brother       >>           >>   ');
	CursorTo(24,20);
	write('Zaharias for the beta testing');
	CursorTo(22,23);
	write('Thank you for playing this game :)');
	
	NextLevel(Q);
	DoneWinCRT; {telos}
END.