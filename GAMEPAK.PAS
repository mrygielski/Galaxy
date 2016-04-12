
unit gamepak;

interface

uses rgraph, help2, galaxy_x, midisnd, adlib;

procedure initgame;
procedure ladowanie;
procedure menugfx;
procedure menu;
procedure levelgame;

implementation

procedure initgame;
begin
     if memavail div 1024<memtostart(6) then
     begin
          cls(0,0,0);
          tekstkolor(7);
          piszln('BL¤D Z PAMI¨CI¤');
          piszln('dost©pna pami©†: '+numstr(memavail div 1024));
          piszln('wymagana pami©†: '+numstr(memtostart(6)));
          halt;
     end;
     detect_sb;
     initgraph(6);
end;

procedure ladowanie;
begin
     outtextxy(5,90,3,2,10,1,'LADOWANIE...',false);
     outtextxy(6,90,3,2,10,1,'LADOWANIE...',false);
     outtextxy(7,90,3,2,10,1,'LADOWANIE...',false);
     outtextxy(5,91,3,2,2,1,'LADOWANIE...',false);
     outtextxy(6,91,3,2,2,1,'LADOWANIE...',false);
     outtextxy(7,91,3,2,2,1,'LADOWANIE...',false);
     outtextxy(5,90,3,2,10,1,'-',false);
     outtextxy(6,90,3,2,10,1,'-',false);
     outtextxy(7,90,3,2,10,1,'-',false);
     outtextxy(5,91,3,2,2,1,'-',false);
     outtextxy(6,91,3,2,2,1,'-' ,false);
     outtextxy(7,91,3,2,2,1,'-',false);
     pokazgrafike;
     clearlayer(1);
end;

procedure menugfx;
begin
     openship(6,40,-20,4,2,2);
     openship(6,41,-20,4,2,2);
     openship(6,42,-20,4,2,2);
     openship(6,43,-20,4,2,2);
     openship(6,44,-20,4,2,2);
     openship(6,40,-19,4,2,2);
     openship(6,41,-19,4,2,2);
     openship(6,42,-19,4,2,2);
     openship(6,43,-19,4,2,2);
     openship(6,44,-19,4,2,2);
     blur(47,16,285,62,8,false,2);
     openship(7,100,50,2,1,2);
     openship(7,101,50,2,1,2);
     openship(8,100,100,2,1,2);
     openship(8,101,100,2,1,2);
     openship(9,100,140,2,1,2);
     openship(9,101,140,2,1,2);
     blur(100,70,220,190,8,false,2);
     openship(10,10,150,1,1,2);
end;

var
   x1, y1, x2, y2, x3, y3, x4, y4 : integer;
   l1, l2, l3, l4 : integer;
   x, y, yy1, yy2 : integer;
   l : byte;
   znak : char;
   a : integer;

procedure menu;

procedure koniec;

var
   r : integer;

begin
     for r:= 190 downto 0 do
     begin
          circle(159,99,r,0,1);
          circle(159,100,r,0,1);
          circle(160,100,r,0,1);
          circle(161,100,r,0,1);
          circle(161,101,r,0,1);
          circle(161,99,r,0,1);
          pokazgrafike;
     end;
end;

procedure info;

var
   scrx, bcrx : integer;
   znak3 : char;

begin
     outtextxyshadow(7,42,1,1,25,8,6,'              ,          ,',false);
     outtextxyshadow(5,40,1,1,25,8,6,'GalaxY jest gra polegajaca na zniszcze-',false);
     outtextxyshadow(5,49,1,1,25,8,6,'                       ` ',false);
     outtextxyshadow(7,52,1,1,25,8,6,'                                  ,',false);
     outtextxyshadow(5,50,1,1,25,8,6,'niu  wszystkich  obiektow  znajdujacych',false);
     outtextxyshadow(5,59,1,1,25,8,6,'                        ``           `',false);
     outtextxyshadow(7,62,1,1,25,8,6,'  ,',false);
     outtextxyshadow(5,60,1,1,25,8,6,'sie  na ekranie. Gdy ilosc przeciwnikow',false);
     outtextxyshadow(7,72,1,1,25,8,6,'                             ,     ,',false);
     outtextxyshadow(5,70,1,1,25,8,6,'zmaleje  do  zera  pojawia sie nastepny',false);
     outtextxyshadow(5,79,1,1,25,8,6,'          `',false);
     outtextxyshadow(5,80,1,1,25,8,6,'poziom, ktory  jest  zawsze trudniejszy',false);
     outtextxyshadow(5,90,1,1,25,8,6,'od poprzedniego. Po pewnym czasie prze-',false);
     outtextxyshadow(7,100,1,1,25,8,6,'                 ,',false);
     outtextxyshadow(5,99,1,1,25,8,6,'                           `          `',false);
     outtextxyshadow(5,100,1,1,25,8,6,'ciwnicy  zaczynaja  strzelac i schodzic',false);
     outtextxyshadow(5,104,1,1,25,8,6,'          .',false);
     outtextxyshadow(5,110,1,1,25,8,6,'coraz  blizej naszego pojazdu. Gdy nasz',false);
     outtextxyshadow(7,122,1,1,25,8,6,'                        ,',false);
     outtextxyshadow(5,120,1,1,25,8,6,'statek  zostanie  dotkniety  przez obce',false);
     outtextxyshadow(5,124,1,1,25,8,6,'                      .',false);
     outtextxyshadow(5,130,1,1,25,8,6,'statki, tracimy jedno zycie.',false);
     outtextxyshadow(6,150,1,1,25,8,6,'            -',false);
     outtextxyshadow(5,150,1,1,25,8,6,'AUTOR: MICHAL RYGIELSKI /REGi/',false);
     outtextxyshadow(225,180,1,1,25,8,6,'ENTERKEY...',false);
     scrx:=5;
     bcrx:=2;
     repeat
           bar(scrx-1,2,scrx+62,38,0,6);
           openship(6,scrx,-10,1,1,6);
           pokazgrafike;
           if (scrx>260) or (scrx<6) then bcrx:=-bcrx; scrx:=scrx-bcrx;
           if keypres then
           begin
                znak3:=anykey;
           end;
     until znak3=#13;
end;

procedure kursormenu;
begin
     line(x1,y+y1,x2,y+y2,52,1);
     line(x2,y+y2,x4,y+y4,52,1);
     line(x1,y+y1,x3,y+y3,52,1);
     line(x3,y+y3,x4,y+y4,52,1);
     line(x1,y+y1+1,x2,y+y2+1,53,1);
     line(x2-1,y+y2,x4-1,y+y4,53,1);
     line(x1+1,y+y1,x3+1,y+y3,53,1);
     line(x3+1,y+y3-1,x4,y+y4-1,53,1);
     line(x1,y+y1+2,x2,y+y2+2,54,1);
     line(x2-2,y+y2,x4-2,y+y4,54,1);
     line(x1+2,y+y1,x3+2,y+y3,54,1);
     line(x3,y+y3-2,x4,y+y4-2,54,1);
end;

begin
     x1:=100;
     y1:=70;
     x2:=230;
     y2:=70;
     x3:=100;
     y3:=120;
     x4:=230;
     y4:=120;
     l:=1;
     with f do
     begin
          modchr:=$41; carchr:=$41; modlev:=$8a; carlev:=$40;
          modatk:=$F4; caratk:=$F1; modsus:=$31; carsus:=$33;
          modwav:=0;   carwav:=02;   feedback:=6;
     end;
     fmreset;
     fmsetup(2,f);
     repeat
           kursormenu;
           czekaj(100);
           pokazgrafike;
           clearlayer(1);
           if keypres then
           begin
                znak:=anykey;
                if znak=#72 then
                begin
                     l:=l-1;
                     y:=y-51;
                     if detect_sb=true then
                     begin
                          fmkeyoff(2);
                          fmkeyon(2,notefreq[7],1);
                     end;
                     if detect_sb=false then
                     begin
                          dzwiek(200,50);
                     end;
                end;
                if znak=#80 then
                begin
                     l:=l+1;
                     y:=y+51;
                     if detect_sb=true then
                     begin
                          fmkeyoff(2);
                          fmkeyon(2,notefreq[7],1);
                     end;
                     if detect_sb=false then
                     begin
                          dzwiek(200,50);
                     end;
                end;
                if (l=1) and (znak=#72) then
                begin
                     yy2:=yy2+15;
                end;
                if (l=2) and (znak=#80) then
                begin
                     yy2:=yy2-15;
                end;
                if (l=3) and (znak=#80) then
                begin
                     yy1:=yy1-16;
                     yy2:=yy2-12;
                end;
                if (l=2) and (znak=#72) then
                begin
                     yy1:=yy1+16;
                     yy2:=yy2+12;
                end;
                if y=-51 then begin l:=l+1; y:=y+51; end;
                if y=153 then begin l:=l-1; y:=y-51; end;
           end;
           l1:=random(5);
           if l1=0 then begin x1:=97; y1:=64+yy1; end;
           if l1=1 then begin x1:=98; y1:=65+yy1; end;
           if l1=2 then begin x1:=99; y1:=66+yy1; end;
           if l1=3 then begin x1:=100; y1:=67+yy1; end;
           if l1=4 then begin x1:=101; y1:=68+yy1; end;
           if l1=5 then begin x1:=102; y1:=69+yy1; end;
           l2:=random(5);
           if l2=0 then begin x2:=230; y2:=64+yy1; end;
           if l2=1 then begin x2:=229; y2:=65+yy1; end;
           if l2=2 then begin x2:=228; y2:=66+yy1; end;
           if l2=3 then begin x2:=227; y2:=67+yy1; end;
           if l2=4 then begin x2:=226; y2:=68+yy1; end;
           if l2=5 then begin x2:=225; y2:=69+yy1; end;
           l3:=random(5);
           if l3=0 then begin x3:=100; y3:=120+yy2; end;
           if l3=1 then begin x3:=101; y3:=119+yy2; end;
           if l3=2 then begin x3:=102; y3:=118+yy2; end;
           if l3=3 then begin x3:=103; y3:=117+yy2; end;
           if l3=4 then begin x3:=104; y3:=116+yy2; end;
           if l3=5 then begin x3:=105; y3:=115+yy2; end;
           l4:=random(5);
           if l4=0 then begin x4:=230; y4:=120+yy2; end;
           if l4=1 then begin x4:=229; y4:=119+yy2; end;
           if l4=2 then begin x4:=228; y4:=118+yy2; end;
           if l4=3 then begin x4:=227; y4:=117+yy2; end;
           if l4=4 then begin x4:=226; y4:=116+yy2; end;
           if l4=5 then begin x4:=225; y4:=115+yy2; end;
           if (l=1) and (znak=#13) then
           begin
                if detect_sb=true then
                begin
                     fmkeyoff(2);
                     fmkeyon(2,notefreq[4],1);
                end;
                if detect_sb=false then
                begin
                     dzwiek(200,100);
                end;
                levelgame;
           end;
           if (l=2) and (znak=#13) then
           begin
                if detect_sb=true then
                begin
                     fmkeyoff(2);
                     fmkeyon(2,notefreq[4],1);
                end;
                if detect_sb=false then
                begin
                     dzwiek(200,100);
                end;
                hidelayer(1);
                hidelayer(2);
                info;
                znak:=#80;
                clearlayer(6);
                showlayer(1);
                showlayer(2);
           end;
           if (l=3) and (znak=#13) then
           begin
                if detect_sb=true then
                begin
                     fmkeyoff(2);
                     fmkeyon(2,notefreq[4],1);
                end;
                if detect_sb=false then
                begin
                     dzwiek(200,100);
                end;
                line(x1,y+y1,x2,y+y2,52,1);
                line(x2,y+y2,x4,y+y4,52,1);
                line(x1,y+y1,x3,y+y3,52,1);
                line(x3,y+y3,x4,y+y4,52,1);
                line(x1,y+y1+1,x2,y+y2+1,53,1);
                line(x2-1,y+y2,x4-1,y+y4,53,1);
                line(x1+1,y+y1,x3+1,y+y3,53,1);
                line(x3+1,y+y3-1,x4,y+y4-1,53,1);
                line(x1,y+y1+2,x2,y+y2+2,54,1);
                line(x2-2,y+y2,x4-2,y+y4,54,1);
                line(x1+2,y+y1,x3+2,y+y3,54,1);
                line(x3,y+y3-2,x4,y+y4-2,54,1);
                koniec;
                closegraph;
                halt;
           end;
     until znak='GALAXY vBETA by REGi';
end;

var
   a1x, a1y, a2x, a2y, a3x, a3y, a4x, a4y, a5x, a5y, a6x, a6y, a7x, a7y, a8x, a8y,
   b1x, b1y, b2x, b2y, b3x, b3y, b4x, b4y, b5x, b5y, b6x, b6y, b7x, b7y, b8x, b8y : integer;
   e1a, e2a, e3a, e4a, e5a, e6a, e7a, e8a,
   e1b, e2b, e3b, e4b, e5b, e6b, e7b, e8b : byte;
   q1a, q2a, q3a, q4a, q5a, q6a, q7a, q8a,
   q1b, q2b, q3b, q4b, q5b, q6b, q7b, q8b : boolean;
   t1a, t2a, t3a, t4a, t5a, t6a, t7a, t8a,
   t1b, t2b, t3b, t4b, t5b, t6b, t7b, t8b : byte;
   s1a, s2a, s3a, s4a, s5a, s6a, s7a, s8a,
   s1b, s2b, s3b, s4b, s5b, s6b, s7b, s8b : integer;
   ka1x, ka2x, ka3x, ka4x, ka5x, ka6x, ka7x, ka8x,
   kb1x, kb2x, kb3x, kb4x, kb5x, kb6x, kb7x, kb8x : integer;
   ka1y, ka2y, ka3y, ka4y, ka5y, ka6y, ka7y, ka8y,
   kb1y, kb2y, kb3y, kb4y, kb5y, kb6y, kb7y, kb8y : integer;
   qka1y, qka2y, qka3y, qka4y, qka5y, qka6y, qka7y, qka8y,
   qkb1y, qkb2y, qkb3y, qkb4y, qkb5y, qkb6y, qkb7y, qkb8y : boolean;
   l1a, l2a, l3a, l4a, l5a, l6a, l7a, l8a,
   l1b, l2b, l3b, l4b, l5b, l6b, l7b, l8b : byte;
   rlos, rwyb : byte;
   px, py : integer;
   sx, sy : integer;
   qs : boolean;
   znak2 : char;
   punkty : longint;
   zycia : byte;
   poziom : byte;
   cz : integer;
   lg : byte;

procedure levelgame;

procedure background;
begin
     rectangle(1,1,320,200,52,5);
     rectangle(2,2,319,199,53,5);
     rectangle(3,3,318,198,54,5);
     rectangle(4,4,317,197,55,5);
end;

procedure game(ile : integer);
begin
           if qs=true then
           begin
                sy:=sy-5;
                putpixel(sx+14,sy+4,23,4);
                putpixel(sx+14,sy+5,24,4);
                putpixel(sx+14,sy+6,25,4);
                putpixel(sx+15,sy+4,23,4);
                putpixel(sx+15,sy+5,24,4);
                putpixel(sx+15,sy+6,25,4);
                putpixel(sx+16,sy+4,23,4);
                putpixel(sx+16,sy+5,24,4);
                putpixel(sx+16,sy+6,25,4);
           end;
           if q1a=true then
           begin
                openship(t1a,a1x,a1y,e1a,1,4);
           end;
           if q2a=true then
           begin
                openship(t2a,a2x,a2y,e2a,e2a,4);
           end;
           if q3a=true then
           begin
                openship(t3a,a3x,a3y,e3a,e3a,4);
           end;
           if q4a=true then
           begin
                openship(t4a,a4x,a4y,e4a,e4a,4);
           end;
           if q5a=true then
           begin
                openship(t5a,a5x,a5y,e5a,e5a,4);
           end;
           if q6a=true then
           begin
                openship(t6a,a6x,a6y,e6a,e6a,4);
           end;
           if q7a=true then
           begin
                openship(t7a,a7x,a7y,e7a,e7a,4);
           end;
           if q8a=true then
           begin
                openship(t8a,a8x,a8y,e8a,e8a,4);
           end;
           if q1b=true then
           begin
                openship(t1b,b1x,b1y,e1b,e1b,4);
           end;
           if q2b=true then
           begin
                openship(t2b,b2x,b2y,e2b,e2b,4);
           end;
           if q3b=true then
           begin
                openship(t3b,b3x,b3y,e3b,e3b,4);
           end;
           if q4b=true then
           begin
                openship(t4b,b4x,b4y,e4b,e4b,4);
           end;
           if q5b=true then
           begin
                openship(t5b,b5x,b5y,e5b,e5b,4);
           end;
           if q6b=true then
           begin
                openship(t6b,b6x,b6y,e6b,e6b,4);
           end;
           if q7b=true then
           begin
                openship(t7b,b7x,b7y,e7b,e7b,4);
           end;
           if q8b=true then
           begin
                openship(t8b,b8x,b8y,e8b,e8b,4);
           end;
           openship(5,px,py,1,1,4); {player}
           pokazgrafike;
           clearlayer(4);
           if znak2=#77 then px:=px+3;
           if znak2=#75 then px:=px-3;
           if px=6 then px:=px+3;
           if px=285 then px:=px-3;
           if keypres then
           begin
                znak2:=anykey;
                if (znak2=' ') and (qs=false) then
                begin
                     if detect_sb=true then
                     begin
                          fmkeyoff(2);
                          fmkeyon(2,notefreq[5],2);
                     end;
                     if detect_sb=false then
                     begin
                          dzwiek(200,100);
                     end;
                     sx:=px;
                     sy:=py;
                     qs:=true;
                end;
           end;
           if sy=5 then
           begin
                sy:=py;
                qs:=false;
           end;
           if (sx>a1x-15) and (sx<a1x+15) and (sy>a1y-15) and (sy<a1y+15) and (q1a=true) then
           begin
                q1a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>a2x-15) and (sx<a2x+15) and (sy>a2y-15) and (sy<a2y+15) and (q2a=true) then
           begin
                q2a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>a3x-15) and (sx<a3x+15) and (sy>a3y-15) and (sy<a3y+15) and (q3a=true) then
           begin
                q3a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>a4x-15) and (sx<a4x+15) and (sy>a4y-15) and (sy<a4y+15) and (q4a=true) then
           begin
                q4a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>a5x-15) and (sx<a5x+15) and (sy>a5y-15) and (sy<a5y+15) and (q5a=true) then
           begin
                q5a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>a6x-15) and (sx<a6x+15) and (sy>a6y-15) and (sy<a6y+15) and (q6a=true) then
           begin
                q6a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>a7x-15) and (sx<a7x+15) and (sy>a7y-15) and (sy<a7y+15) and (q7a=true) then
           begin
                q7a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>a8x-15) and (sx<a8x+15) and (sy>a8y-15) and (sy<a8y+15) and (q8a=true) then
           begin
                q8a:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b1x-15) and (sx<b1x+15) and (sy>b1y-15) and (sy<b1y+15) and (q1b=true) then
           begin
                q1b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b2x-15) and (sx<b2x+15) and (sy>b2y-15) and (sy<b2y+15) and (q2b=true) then
           begin
                q2b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b3x-15) and (sx<b3x+15) and (sy>b3y-15) and (sy<b3y+15) and (q3b=true) then
           begin
                q3b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b4x-15) and (sx<b4x+15) and (sy>b4y-15) and (sy<b4y+15) and (q4b=true) then
           begin
                q4b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b5x-15) and (sx<b5x+15) and (sy>b5y-15) and (sy<b5y+15) and (q5b=true) then
           begin
                q5b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b6x-15) and (sx<b6x+15) and (sy>b6y-15) and (sy<b6y+15) and (q6b=true) then
           begin
                q6b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b7x-15) and (sx<b7x+15) and (sy>b7y-15) and (sy<b7y+15) and (q7b=true) then
           begin
                q7b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (sx>b8x-15) and (sx<b8x+15) and (sy>b8y-15) and (sy<b8y+15) and (q8b=true) then
           begin
                q8b:=false;
                clearlayer(3);
                punkty:=punkty+300;
                sy:=py;
                qs:=false;
           end;
           if (a1x>35) or (a1x<10) then s1a:=-s1a; a1x:=a1x+s1a;
           if (a2x>70) or (a2x<45) then s2a:=-s2a; a2x:=a2x+s2a;
           if (a3x>105) or (a3x<80) then s3a:=-s3a; a3x:=a3x+s3a;
           if (a4x>140) or (a4x<115) then s4a:=-s4a; a4x:=a4x+s4a;
           if (a5x>175) or (a5x<150) then s5a:=-s5a; a5x:=a5x+s5a;
           if (a6x>210) or (a6x<185) then s6a:=-s6a; a6x:=a6x+s6a;
           if (a7x>245) or (a7x<220) then s7a:=-s7a; a7x:=a7x+s7a;
           if (a8x>280) or (a8x<255) then s8a:=-s8a; a8x:=a8x+s8a;
           if (b1x>35) or (b1x<10) then s1b:=-s1b; b1x:=b1x+s1b;
           if (b2x>70) or (b2x<45) then s2b:=-s2b; b2x:=b2x+s2b;
           if (b3x>105) or (b3x<80) then s3b:=-s3b; b3x:=b3x+s3b;
           if (b4x>140) or (b4x<115) then s4b:=-s4b; b4x:=b4x+s4b;
           if (b5x>175) or (b5x<150) then s5b:=-s5b; b5x:=b5x+s5b;
           if (b6x>210) or (b6x<185) then s6b:=-s6b; b6x:=b6x+s6b;
           if (b7x>245) or (b7x<220) then s7b:=-s7b; b7x:=b7x+s7b;
           if (b8x>280) or (b8x<255) then s8b:=-s8b; b8x:=b8x+s8b;
           if (qka1y=true) and (q1a=true) then
           begin
                ka1y:=ka1y+2;
                putpixel(ka1x,ka1y,15,4);
           end;
           randomize;
           l1a:=random(rlos)+1;
           if l1a=rwyb then begin qka1y:=true; end;
           if ka1y>190 then
           begin
                ka1x:=a1x+15;
                ka1y:=a1y+25;
                qka1y:=false;
           end;
           if (qka2y=true) and (q2a=true) then
           begin
                ka2y:=ka2y+2;
                putpixel(ka2x,ka2y,15,4);
           end;
           l2a:=random(rlos)+1;
           if l2a=rwyb then begin qka2y:=true; end;
           if ka2y>190 then
           begin
                ka2x:=a2x+15;
                ka2y:=a2y+25;
                qka2y:=false;
           end;
           if (qka3y=true) and (q3a=true) then
           begin
                ka3y:=ka3y+2;
                putpixel(ka3x,ka3y,15,4);
           end;
           l3a:=random(rlos)+1;
           if l3a=rwyb then begin qka3y:=true; end;
           if ka3y>190 then
           begin
                ka3x:=a3x+15;
                ka3y:=a3y+25;
                qka3y:=false;
           end;
           if (qka4y=true) and (q4a=true) then
           begin
                ka4y:=ka4y+2;
                putpixel(ka4x,ka4y,15,4);
           end;
           l4a:=random(rlos)+1;
           if l4a=rwyb then begin qka4y:=true; end;
           if ka4y>190 then
           begin
                ka4x:=a4x+15;
                ka4y:=a4y+25;
                qka4y:=false;
           end;
           if (qka5y=true) and (q5a=true) then
           begin
                ka5y:=ka5y+2;
                putpixel(ka5x,ka5y,15,4);
           end;
           l5a:=random(rlos)+1;
           if l5a=rwyb then begin qka5y:=true; end;
           if ka5y>190 then
           begin
                ka5x:=a5x+15;
                ka5y:=a5y+25;
                qka5y:=false;
           end;
           if (qka6y=true) and (q6a=true) then
           begin
                ka6y:=ka6y+2;
                putpixel(ka6x,ka6y,15,4);
           end;
           l6a:=random(rlos)+1;
           if l6a=rwyb then begin qka6y:=true; end;
           if ka5y>190 then
           begin
                ka6x:=a6x+15;
                ka6y:=a6y+25;
                qka6y:=false;
           end;
           if (qka7y=true) and (q7a=true) then
           begin
                ka7y:=ka7y+2;
                putpixel(ka7x,ka7y,15,4);
           end;
           l7a:=random(rlos)+1;
           if l7a=rwyb then begin qka7y:=true; end;
           if ka7y>190 then
           begin
                ka7x:=a7x+15;
                ka7y:=a7y+25;
                qka7y:=false;
           end;
           if (qka8y=true) and (q8a=true) then
           begin
                ka8y:=ka8y+2;
                putpixel(ka8x,ka8y,15,4);
           end;
           l8a:=random(rlos)+1;
           if l8a=rwyb then begin qka8y:=true; end;
           if ka8y>190 then
           begin
                ka8x:=a8x+15;
                ka8y:=a8y+25;
                qka8y:=false;
           end;
           if (qkb1y=true) and (q1b=true) then
           begin
                kb1y:=kb1y+2;
                putpixel(kb1x,kb1y,15,4);
           end;
           randomize;
           l1b:=random(rlos)+1;
           if l1b=rwyb then begin qkb1y:=true; end;
           if kb1y>190 then
           begin
                kb1x:=b1x+15;
                kb1y:=b1y+25;
                qkb1y:=false;
           end;
           if (qkb2y=true) and (q2b=true) then
           begin
                kb2y:=kb2y+2;
                putpixel(kb2x,kb2y,15,4);
           end;
           l2b:=random(rlos)+1;
           if l2b=rwyb then begin qkb2y:=true; end;
           if kb2y>190 then
           begin
                kb2x:=b2x+15;
                kb2y:=b2y+25;
                qkb2y:=false;
           end;
           if (qkb3y=true) and (q3b=true) then
           begin
                kb3y:=kb3y+2;
                putpixel(kb3x,kb3y,15,4);
           end;
           l3b:=random(rlos)+1;
           if l3b=rwyb then begin qkb3y:=true; end;
           if kb3y>190 then
           begin
                kb3x:=b3x+15;
                kb3y:=b3y+25;
                qkb3y:=false;
           end;
           if (qkb4y=true) and (q4b=true) then
           begin
                kb4y:=kb4y+2;
                putpixel(kb4x,kb4y,15,4);
           end;
           l4b:=random(rlos)+1;
           if l4b=rwyb then begin qkb4y:=true; end;
           if kb4y>190 then
           begin
                kb4x:=b4x+15;
                kb4y:=b4y+25;
                qkb4y:=false;
           end;
           if (qkb5y=true) and (q5b=true) then
           begin
                kb5y:=kb5y+2;
                putpixel(kb5x,kb5y,15,4);
           end;
           l5b:=random(rlos)+1;
           if l5b=rwyb then begin qkb5y:=true; end;
           if kb5y>190 then
           begin
                kb5x:=b5x+15;
                kb5y:=b5y+25;
                qkb5y:=false;
           end;
           if (qkb6y=true) and (q6b=true) then
           begin
                kb6y:=kb6y+2;
                putpixel(kb6x,kb6y,15,4);
           end;
           l6b:=random(rlos)+1;
           if l6b=rwyb then begin qkb6y:=true; end;
           if kb5y>190 then
           begin
                kb6x:=b6x+15;
                kb6y:=b6y+25;
                qkb6y:=false;
           end;
           if (qkb7y=true) and (q7b=true) then
           begin
                kb7y:=kb7y+2;
                putpixel(kb7x,kb7y,15,4);
           end;
           l7b:=random(rlos)+1;
           if l7b=rwyb then begin qkb7y:=true; end;
           if kb7y>190 then
           begin
                kb7x:=b7x+15;
                kb7y:=b7y+25;
                qkb7y:=false;
           end;
           if (qkb8y=true) and (q8b=true) then
           begin
                kb8y:=kb8y+2;
                putpixel(kb8x,kb8y,15,4);
           end;
           l8b:=random(rlos)+1;
           if l8b=rwyb then begin qkb8y:=true; end;
           if kb8y>190 then
           begin
                kb8x:=b8x+15;
                kb8y:=b8y+25;
                qkb8y:=false;
           end;
           if (ka1x>px) and (ka1x<px+30) and (ka1y>py+10) and (ka1y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka1x:=a1x+15;
                ka1y:=a1y+25;
                qka1y:=false;
           end;
           if (ka2x>px) and (ka2x<px+30) and (ka2y>py+10) and (ka2y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka2x:=a2x+15;
                ka2y:=a2y+25;
                qka2y:=false;
           end;
           if (ka3x>px) and (ka3x<px+30) and (ka3y>py+10) and (ka3y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka3x:=a3x+15;
                ka3y:=a3y+25;
                qka3y:=false;
           end;
           if (ka4x>px) and (ka4x<px+30) and (ka4y>py+10) and (ka4y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka4x:=a4x+15;
                ka4y:=a4y+25;
                qka4y:=false;
           end;
           if (ka5x>px) and (ka5x<px+30) and (ka5y>py+10) and (ka5y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka5x:=a5x+15;
                ka5y:=a5y+25;
                qka5y:=false;
           end;
           if (ka6x>px) and (ka6x<px+30) and (ka6y>py+10) and (ka6y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka6x:=a6x+15;
                ka6y:=a6y+25;
                qka6y:=false;
           end;
           if (ka7x>px) and (ka7x<px+30) and (ka7y>py+10) and (ka7y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka7x:=a7x+15;
                ka7y:=a7y+25;
                qka7y:=false;
           end;
           if (ka8x>px) and (ka8x<px+30) and (ka8y>py+10) and (ka8y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                ka8x:=a8x+15;
                ka8y:=a8y+25;
                qka8y:=false;
           end;
           if (kb1x>px) and (kb1x<px+30) and (kb1y>py+10) and (kb1y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb1x:=b1x+15;
                kb1y:=b1y+25;
                qkb1y:=false;
           end;
           if (kb2x>px) and (kb2x<px+30) and (kb2y>py+10) and (kb2y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb2x:=b2x+15;
                kb2y:=b2y+25;
                qkb2y:=false;
           end;
           if (kb3x>px) and (kb3x<px+30) and (kb3y>py+10) and (kb3y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb3x:=b3x+15;
                kb3y:=b3y+25;
                qkb3y:=false;
           end;
           if (kb4x>px) and (kb4x<px+30) and (kb4y>py+10) and (kb4y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb4x:=b4x+15;
                kb4y:=b4y+25;
                qkb4y:=false;
           end;
           if (kb5x>px) and (kb5x<px+30) and (kb5y>py+10) and (kb5y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb5x:=b5x+15;
                kb5y:=b5y+25;
                qkb5y:=false;
           end;
           if (kb6x>px) and (kb6x<px+30) and (kb6y>py+10) and (kb6y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb6x:=b6x+15;
                kb6y:=b6y+25;
                qka6y:=false;
           end;
           if (kb7x>px) and (kb7x<px+30) and (kb7y>py+10) and (kb7y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb7x:=b7x+15;
                kb7y:=b7y+25;
                qkb7y:=false;
           end;
           if (kb8x>px) and (kb8x<px+30) and (kb8y>py+10) and (kb8y<py+40) then
           begin
                clearlayer(3);
                zycia:=zycia-1;
                kb8x:=b8x+15;
                kb8y:=b8y+25;
                qkb8y:=false;
           end;
           if cz=ile then
           begin
                ka1y:=ka1y+25; ka2y:=ka2y+25; ka3y:=ka3y+25; ka4y:=ka4y+25;
                ka5y:=ka5y+25; ka6y:=ka6y+25; ka7y:=ka7y+25; ka8y:=ka8y+25;
                kb1y:=kb1y+25; kb2y:=kb2y+25; kb3y:=kb3y+25; kb4y:=kb4y+25;
                kb5y:=kb5y+25; kb6y:=kb6y+25; kb7y:=kb7y+25; kb8y:=kb8y+25;
                a1y:=a1y+15;
                a2y:=a2y+15;
                a3y:=a3y+15;
                a4y:=a4y+15;
                a5y:=a5y+15;
                a6y:=a6y+15;
                a7y:=a7y+15;
                a8y:=a8y+15;
                b1y:=b1y+15;
                b2y:=b2y+15;
                b3y:=b3y+15;
                b4y:=b4y+15;
                b5y:=b5y+15;
                b6y:=b6y+15;
                b7y:=b7y+15;
                b8y:=b8y+15;
                lg:=lg+1;
                cz:=0;
           end;
end;

begin
     background;
     {poziom 1}
     hidelayer(1);
     hidelayer(2);
     a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
     a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
     b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
     b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
     q1a:=false; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=false;
     q1b:=false; q2b:=false; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=false; q8b:=false;
     t1a:=1; t2a:=1; t3a:=1; t4a:=1; t5a:=1; t6a:=1; t7a:=1; t8a:=1;
     t1b:=1; t2b:=1; t3b:=1; t4b:=1; t5b:=1; t6b:=1; t7b:=1; t8b:=1;
     e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
     e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
     s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
     s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
     ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
     ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
     kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
     kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
     ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
     ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
     kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
     kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
     qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
     qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
     qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
     qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
     with f do
     begin
          modchr:=$41; carchr:=$41; modlev:=$8a; carlev:=$40;
          modatk:=$F4; caratk:=$F1; modsus:=$31; carsus:=$33;
          modwav:=0;   carwav:=02;   feedback:=6;
     end;
     fmreset;
     fmsetup(2,f);
     zycia:=10;
     px:=147;
     py:=160;
     qs:=false;
     punkty:=0;
     rlos:=200;
     rwyb:=40;
     poziom:=1;
     cz:=0;
     lg:=0;
     znak2:=#13;
     repeat
           outtextxy(10,10,1,1,15,3,'PUNKTY: '+numstr(punkty)+' ZYCIA= '+numstr(zycia)+' POZIOM= '+numstr(poziom),false);
           cz:=cz+1;
           game(900);
           if lg=6 then {zycie -1}
           begin
                clearlayer(4);
                clearlayer(3);
                zycia:=zycia-1;
                a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
                a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
                b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
                b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
                q1a:=false; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=false;
                q1b:=false; q2b:=false; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=false; q8b:=false;
                t1a:=1; t2a:=1; t3a:=1; t4a:=1; t5a:=1; t6a:=1; t7a:=1; t8a:=1;
                t1b:=1; t2b:=1; t3b:=1; t4b:=1; t5b:=1; t6b:=1; t7b:=1; t8b:=1;
                e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
                e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
                s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
                s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
                ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
                ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
                kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
                kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
                ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
                ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
                kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
                kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
                qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
                qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
                qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
                qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
                game(400);
                lg:=0;
                pokazgrafike;
           end;
           if (poziom=1) and (q2a=false) and (q3a=false) and (q4a=false) and
                             (q5a=false) and (q6a=false) and (q7a=false) and
                             (q3b=false) and (q4b=false) and (q5b=false) and
                             (q6b=false) then
           begin
                {poziom 2}
                clearlayer(4);
                clearlayer(3);
                a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
                a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
                b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
                b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
                q1a:=false; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=false;
                q1b:=false; q2b:=true; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=true; q8b:=false;
                t1a:=1; t2a:=2; t3a:=1; t4a:=1; t5a:=1; t6a:=1; t7a:=2; t8a:=1;
                t1b:=1; t2b:=1; t3b:=2; t4b:=1; t5b:=1; t6b:=2; t7b:=1; t8b:=1;
                e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
                e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
                s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
                s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
                ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
                ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
                kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
                kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
                ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
                ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
                kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
                kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
                qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
                qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
                qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
                qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
                lg:=0;
                px:=147;
                py:=160;
                qs:=false;
                rlos:=180;
                rwyb:=40;
                poziom:=2;
                cz:=0;
                lg:=0;
                repeat
                 outtextxy(10,10,1,1,15,3,'PUNKTY: '+numstr(punkty)+' ZYCIA= '+numstr(zycia)+' POZIOM= '+numstr(poziom),false);
                      cz:=cz+1;
                      game(800);
           if (poziom=2) and (q2a=false) and (q3a=false) and (q4a=false) and
                             (q5a=false) and (q6a=false) and (q7a=false) and
                             (q3b=false) and (q4b=false) and (q5b=false) and
                             (q6b=false) and (q2b=false) and (q7b=false) then
           begin
                {poziom 3}
                clearlayer(4);
                clearlayer(3);
                a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
                a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
                b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
                b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
                q1a:=false; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=false;
                q1b:=false; q2b:=true; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=true; q8b:=false;
                t1a:=1; t2a:=2; t3a:=2; t4a:=1; t5a:=1; t6a:=2; t7a:=2; t8a:=1;
                t1b:=1; t2b:=2; t3b:=2; t4b:=1; t5b:=1; t6b:=2; t7b:=2; t8b:=1;
                e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
                e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
                s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
                s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
                ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
                ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
                kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
                kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
                ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
                ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
                kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
                kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
                qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
                qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
                qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
                qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
                lg:=0;
                px:=147;
                py:=160;
                qs:=false;
                rlos:=160;
                rwyb:=40;
                poziom:=3;
                cz:=0;
                lg:=0;
                repeat
                 outtextxy(10,10,1,1,15,3,'PUNKTY: '+numstr(punkty)+' ZYCIA= '+numstr(zycia)+' POZIOM= '+numstr(poziom),false);
                      cz:=cz+1;
                      game(650);
           if (poziom=3) and (q2a=false) and (q3a=false) and (q4a=false) and
                             (q5a=false) and (q6a=false) and (q7a=false) and
                             (q3b=false) and (q4b=false) and (q5b=false) and
                             (q6b=false) and (q2b=false) and (q7b=false) then
           begin
                {poziom 4}
                clearlayer(4);
                clearlayer(3);
                a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
                a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
                b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
                b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
                q1a:=false; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=false;
                q1b:=false; q2b:=true; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=true; q8b:=false;
                t1a:=1; t2a:=3; t3a:=2; t4a:=4; t5a:=4; t6a:=2; t7a:=3; t8a:=1;
                t1b:=1; t2b:=2; t3b:=1; t4b:=1; t5b:=1; t6b:=1; t7b:=2; t8b:=1;
                e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
                e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
                s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
                s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
                ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
                ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
                kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
                kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
                ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
                ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
                kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
                kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
                qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
                qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
                qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
                qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
                lg:=0;
                px:=147;
                py:=160;
                qs:=false;
                rlos:=140;
                rwyb:=40;
                poziom:=4;
                cz:=0;
                lg:=0;
                repeat
                 outtextxy(10,10,1,1,15,3,'PUNKTY: '+numstr(punkty)+' ZYCIA= '+numstr(zycia)+' POZIOM= '+numstr(poziom),false);
                      cz:=cz+1;
                      game(650);
           if (poziom=4) and (q2a=false) and (q3a=false) and (q4a=false) and
                             (q5a=false) and (q6a=false) and (q7a=false) and
                             (q3b=false) and (q4b=false) and (q5b=false) and
                             (q6b=false) and (q2b=false) and (q7b=false) then
           begin
                {poziom 5}
                clearlayer(4);
                clearlayer(3);
                a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
                a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
                b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
                b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
                q1a:=true; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=true;
                q1b:=false; q2b:=true; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=true; q8b:=false;
                t1a:=1; t2a:=2; t3a:=1; t4a:=4; t5a:=4; t6a:=1; t7a:=2; t8a:=1;
                t1b:=1; t2b:=2; t3b:=1; t4b:=1; t5b:=1; t6b:=1; t7b:=2; t8b:=1;
                e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
                e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
                s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
                s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
                ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
                ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
                kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
                kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
                ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
                ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
                kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
                kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
                qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
                qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
                qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
                qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
                lg:=0;
                px:=147;
                py:=160;
                qs:=false;
                rlos:=130;
                rwyb:=40;
                poziom:=5;
                cz:=0;
                lg:=0;
                repeat
                 outtextxy(10,10,1,1,15,3,'PUNKTY: '+numstr(punkty)+' ZYCIA= '+numstr(zycia)+' POZIOM= '+numstr(poziom),false);
                      cz:=cz+1;
                      game(600);
           if (poziom=5) and (q2a=false) and (q3a=false) and (q4a=false) and
                             (q5a=false) and (q6a=false) and (q7a=false) and
                             (q3b=false) and (q4b=false) and (q5b=false) and
                             (q6b=false) and (q2b=false) and (q7b=false) and
                             (q1a=false) and (q8a=false) then
           begin
                {poziom 6}
                clearlayer(4);
                clearlayer(3);
                a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
                a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
                b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
                b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
                q1a:=true; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=true;
                q1b:=false; q2b:=true; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=true; q8b:=false;
                t1a:=4; t2a:=3; t3a:=2; t4a:=4; t5a:=4; t6a:=2; t7a:=3; t8a:=4;
                t1b:=1; t2b:=2; t3b:=1; t4b:=1; t5b:=1; t6b:=1; t7b:=2; t8b:=1;
                e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
                e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
                s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
                s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
                ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
                ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
                kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
                kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
                ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
                ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
                kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
                kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
                qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
                qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
                qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
                qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
                lg:=0;
                px:=147;
                py:=160;
                qs:=false;
                rlos:=110;
                rwyb:=40;
                poziom:=6;
                cz:=0;
                lg:=0;
                repeat
                 outtextxy(10,10,1,1,15,3,'PUNKTY: '+numstr(punkty)+' ZYCIA= '+numstr(zycia)+' POZIOM= '+numstr(poziom),false);
                      cz:=cz+1;
                      game(500);
           if (poziom=6) and (q2a=false) and (q3a=false) and (q4a=false) and
                             (q5a=false) and (q6a=false) and (q7a=false) and
                             (q3b=false) and (q4b=false) and (q5b=false) and
                             (q6b=false) and (q2b=false) and (q7b=false) and
                             (q1a=false) and (q8a=false) then
           begin
                {poziom 7}
                clearlayer(4);
                clearlayer(3);
                a1x:=22; a2x:=57; a3x:=92; a4x:=127; a5x:=162; a6x:=197; a7x:=232; a8x:=267;
                a1y:=20; a2y:=20; a3y:=20; a4y:=20; a5y:=20; a6y:=20; a7y:=20; a8y:=20;
                b1x:=22; b2x:=57; b3x:=92; b4x:=127; b5x:=162; b6x:=197; b7x:=232; b8x:=267;
                b1y:=50; b2y:=50; b3y:=50; b4y:=50; b5y:=50; b6y:=50; b7y:=50; b8y:=50;
                q1a:=true; q2a:=true; q3a:=true; q4a:=true; q5a:=true; q6a:=true; q7a:=true; q8a:=true;
                q1b:=true; q2b:=true; q3b:=true; q4b:=true; q5b:=true; q6b:=true; q7b:=true; q8b:=true;
                t1a:=4; t2a:=1; t3a:=2; t4a:=3; t5a:=3; t6a:=2; t7a:=1; t8a:=4;
                t1b:=2; t2b:=2; t3b:=1; t4b:=1; t5b:=1; t6b:=1; t7b:=2; t8b:=2;
                e1a:=1; e2a:=1; e3a:=1; e4a:=1; e5a:=1; e6a:=1; e7a:=1; e8a:=1;
                e1b:=1; e2b:=1; e3b:=1; e4b:=1; e5b:=1; e6b:=1; e7b:=1; e8b:=1;
                s1a:=1; s2a:=1; s3a:=1; s4a:=1; s5a:=1; s6a:=1; s7a:=1; s8a:=1;
                s1b:=1; s2b:=1; s3b:=1; s4b:=1; s5b:=1; s6b:=1; s7b:=1; s8b:=1;
                ka1x:=a1x+15; ka2x:=a2x+15; ka3x:=a3x+15; ka4x:=a4x+15;
                ka5x:=a5x+15; ka6x:=a6x+15; ka7x:=a7x+15; ka8x:=a8x+15;
                kb1x:=b1x+15; kb2x:=b2x+15; kb3x:=b3x+15; kb4x:=b4x+15;
                kb5x:=b5x+15; kb6x:=b6x+15; kb7x:=b7x+15; kb8x:=b8x+15;
                ka1y:=a1y+25; ka2y:=a2y+25; ka3y:=a3y+25; ka4y:=a4y+25;
                ka5y:=a5y+25; ka6y:=a6y+25; ka7y:=a7y+25; ka8y:=a8y+25;
                kb1y:=b1y+25; kb2y:=b2y+25; kb3y:=b3y+25; kb4y:=b4y+25;
                kb5y:=b5y+25; kb6y:=b6y+25; kb7y:=b7y+25; kb8y:=b8y+25;
                qka1y:=false; qka2y:=false; qka3y:=false; qka4y:=false;
                qka5y:=false; qka6y:=false; qka7y:=false; qka8y:=false;
                qkb1y:=false; qkb2y:=false; qkb3y:=false; qkb4y:=false;
                qkb5y:=false; qkb6y:=false; qkb7y:=false; qkb8y:=false;
                lg:=0;
                px:=147;
                py:=160;
                qs:=false;
                rlos:=90;
                rwyb:=40;
                poziom:=7;
                cz:=0;
                lg:=0;
                repeat
                 outtextxy(10,10,1,1,15,3,'PUNKTY: '+numstr(punkty)+' ZYCIA= '+numstr(zycia)+' POZIOM= '+numstr(poziom),false);
                      cz:=cz+1;
                      game(350);
           if (poziom=7) and (q2a=false) and (q3a=false) and (q4a=false) and
                             (q5a=false) and (q6a=false) and (q7a=false) and
                             (q3b=false) and (q4b=false) and (q5b=false) and
                             (q6b=false) and (q2b=false) and (q7b=false) and
                             (q1a=false) and (q8a=false) and (q1b=false) and
                             (q8b=false) then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
                      if keypres then
                      begin
                           znak2:=anykey;
                      end;
           if zycia=0 then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
                until znak2=#27;
           end;
                      if keypres then
                      begin
                           znak2:=anykey;
                      end;
           if zycia=0 then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
                until znak2=#27;
           end;
                      if keypres then
                      begin
                           znak2:=anykey;
                      end;
           if zycia=0 then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
                until znak2=#27;
           end;
                      if keypres then
                      begin
                           znak2:=anykey;
                      end;
           if zycia=0 then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
                until znak2=#27;
           end;
                      if keypres then
                      begin
                           znak2:=anykey;
                      end;
           if zycia=0 then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
                until znak2=#27;
           end;

           if keypres then
           begin
                znak2:=anykey;
           end;
           if zycia=0 then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
                until znak2=#27;
           end;
           if zycia=0 then
           begin
                clearlayer(3);
                clearlayer(4);
                outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
                outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
                outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
                outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
                outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
                pokazgrafike;
                czekaj(1000);
                clearlayer(5);
                showlayer(1);
                showlayer(2);
                znak:=#80;
                menu;
           end;
     until znak2=#27;
     clearlayer(3);
     clearlayer(4);
     outtextxy(30,80,3,3,28,5,'KINIEC GRY',false);
     outtextxy(31,80,3,3,28,5,'KINIEC GRY',false);
     outtextxy(32,80,3,3,28,5,'KINIEC GRY',false);
     outtextxy(33,80,3,3,28,5,'KINIEC GRY',false);
     outtextxy(30,81,3,3,29,5,'KINIEC GRY',false);
     outtextxy(31,81,3,3,29,5,'KINIEC GRY',false);
     outtextxy(32,81,3,3,29,5,'KINIEC GRY',false);
     outtextxy(33,81,3,3,29,5,'KINIEC GRY',false);
     outtextxy(30,82,3,3,30,5,'KINIEC GRY',false);
     outtextxy(31,82,3,3,30,5,'KINIEC GRY',false);
     outtextxy(32,82,3,3,30,5,'KINIEC GRY',false);
     outtextxy(33,82,3,3,30,5,'KINIEC GRY',false);
     outtextxy(30,83,3,3,31,5,'KINIEC GRY',false);
     outtextxy(31,83,3,3,31,5,'KINIEC GRY',false);
     outtextxy(32,83,3,3,31,5,'KINIEC GRY',false);
     outtextxy(33,83,3,3,31,5,'KINIEC GRY',false);
     pokazgrafike;
     czekaj(1000);
     clearlayer(5);
     showlayer(1);
     showlayer(2);
     znak:=#80;
     menu;
end;

end.