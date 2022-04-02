**free                                                                       
//  RPG PROGRAMA- SVG8600DET FECHA 22-03-2022                                
//  AUTOR       - JUAN MANUEL GOMEZ GAYTAN   - TELGUA                        
//                RPG PARA LEVANTAR PANTALLA DETALLE                         
//_____________________________________________________________________      
ctl-opt dftactgrp(*no) datedit(*ymd) fixnbr(*zoned) aut(*all);               
ctl-opt option(*nodebugio:*srcstmt:*nounref);                                
ctl-opt copyright('Derechos Reservados (DR) Claro Guatemala 2022. +          
                   Todos Los Derechos Reservados.');                         
//Delaracion Pantalla                                                        
dcl-f SVG8600PDT  workstn;                                                   
                                                                             
//Declaracion Variables                                                      
dcl-s wnbrcols        int(10)     inz(132);                                  
dcl-s wnbrrows        int(10)     inz(20);                                   
                                                                             
//Declaracion Estructura basada en Tablas                                    
dcl-ds dssvbitosnoa   extname('SVBITOSNOA') qualified end-ds;                
                                                                             
//Api para Presentar pantalla como popup                                     
dcl-pr setscreensize  extproc('QsnRtvScrDim');                               
     nbrrows          int(10)     options(*omit);                            
     nbrcols          int(10)     options(*omit);                            
          handle           int(10)     options(*omit);                   
     errorcode        char(32767) options(*varsize: *omit);         
end-pr;                                                             
                                                                    
//Entrada Parametros                                                
dcl-pi SVG8600DET;                                                  
     orden    char(09);                                             
     fechains char(26);                                             
end-pi;                                                             
                                                                    
exsr main;                                                          
*inlr = *on;                                                        
return;                                                             
                                                                    
begsr main;                                                         
     dssvbitosnoa = ir_svbitosnoa(orden:fechains);                  
     cargavalorespantalla();                                        
     setscreensize(wnbrrows:wnbrcols:*omit:*omit);                  
     if wnbrcols = 132;                                             
          *in90  = *on;                                             
     else;                                                          
          *in90  = *off;                                            
     endif;                                                         
     exfmt w1;                                                      
     endsr;                                                              
                                                                    
dcl-proc ir_svbitosnoa;                                             
     dcl-pi *n likeds(dssvbitosnoa);                                
          os     char(09) const;                                    
          fecins char(26) const;                                    
     end-pi;                                                        
     dcl-ds dsrespuesta likeds(dssvbitosnoa) inz;                   
                                                                    
     exec sql select * into: dsrespuesta                            
                from svbitosnoa                                     
               where svbitorden =: os                               
                 and svbitfcins =: fecins                           
               fetch first row only;                                
                                                                    
     return dsrespuesta;                                            
end-proc;                                                           
                                                                    
                                                                    
dcl-proc cargavalorespantalla;                                      
     dcl-pi *n end-pi;                                              
     srnorden     =  dssvbitosnoa.svbitorden;                       
     srncicloos   =  %editc(dssvbitosnoa.svbitciclo:'X');           
     srnciclofc   =  %editc(dssvbitosnoa.svbitciclf:'X');           
           srntipserv   =  dssvbitosnoa.svbittpser;                    
     srntipos     =  dssvbitosnoa.svbittipos;                    
     srnetapa     =  dssvbitosnoa.svbitetapa;                    
     srnestatus   =  dssvbitosnoa.svbitestat;                    
     srnfecins    =  %char(dssvbitosnoa.svbitfcins);             
     srnfecenv    =  %char(dssvbitosnoa.svbitfcenv);             
     srnjobins    =  dssvbitosnoa.svbitjbins;                    
     srnjobenv    =  dssvbitosnoa.svbitjbenv;                    
end-proc;                                                        