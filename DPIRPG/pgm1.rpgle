**free

dcl-s prueba char(10) inz;

dcl-ds dsjuan dim(10);
   a zoned(10)  inz;
end-ds;


if a=1;
   dsply 'one';
endif;


*inlr = *on;
return;