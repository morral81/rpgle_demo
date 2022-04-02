**free                                                                           
//  RPG PROGRAMA- SVG8600AVI FECHA 15-03-2022                                    
//  AUTOR       - JUAN MANUEL GOMEZ GAYTAN   - TELGUA                            
//                RPG PARA LEVANTAR PANTALLA DE AVISO                            
//_____________________________________________________________________          
ctl-opt dftactgrp(*no) datedit(*ymd) fixnbr(*zoned) aut(*all);                   
ctl-opt option(*nodebugio:*srcstmt:*nounref);                                    
ctl-opt copyright('Derechos Reservados (DR) Claro Guatemala 2022. +              
                   Todos Los Derechos Reservados.');                             
//Delaracion Pantalla                                                            
dcl-f SVG8600PAN  workstn;                                                       
                                                                                 
//declaracion de variables                                                       
dcl-s wnbrcols        int(10)     inz(132);                                      
dcl-s wnbrrows        int(10)     inz(20);                                       
dcl-c juanito         'c';
dcl-s 

//Api para Presentar pantalla como popup                                         
dcl-pr setscreensize  extproc('QsnRtvScrDim');                                   
     nbrrows          int(10)     options(*omit);                                
     nbrcols          int(10)     options(*omit);                                
     handle           int(10)     options(*omit);                                
     errorcode        char(32767) options(*varsize: *omit);                      
end-pr;                                                                          

//Rpg Obtiene Usuario de Facturacion                                     
dcl-pr SVG8600USR extpgm;                                                
     *n  char(10);                                                       
end-pr;                                                                  
                                                                         
//Entrada Parametros                                                     
dcl-pi SVG8600AVN;                                                       
     ciclofac packed(02);                                                
     cicloos  zoned (02);                                                
     bandresp ind;                                                       
end-pi;                                                                  
                                                                         
exsr main;                                                               
*inlr = *on;                                                             
return;                                                                  
                                                                         
begsr main;                                                              
     clear bandresp;                                                     
     srncfac = ciclofac;                                                 
     srncos  = cicloos;                                                  
     srnuser = obtuserfacuracion();                                      
     setscreensize(wnbrrows:wnbrcols:*omit:*omit);                       
     if wnbrcols = 132;                                                  
               *in90  = *on;                         
     else;                                      
          *in90  = *off;                        
     endif;                                     
     exfmt w1;                                  
     bandresp = *off;      
     //prueba
     //esto es otra prueba mas  saludos github                     
endsr;                                          
                                                
dcl-proc obtuserfacuracion;                     
     dcl-pi *n     char(10) end-pi;             
     dcl-s userres char(10) inz;                
                                                
     SVG8600USR(userres);                       
                                                
     return userres;                            
end-proc;                                       
